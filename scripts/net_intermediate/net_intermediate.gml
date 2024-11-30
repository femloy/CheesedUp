#macro INTERMEDIATE_VERSION 1.0

#macro U8_MAX 255
#macro U16_MAX 65535
#macro U32_MAX 4294967295

#macro S8_MIN -128
#macro S16_MIN -32768

#macro F32_MAX (3.40282347 * power(10, 38))

enum net_intermediate_control {
	none,
	header,
	variable,
	footer
};

enum net_intermediate_type {
    string,

    s8,
    s16,
    s32,
    s64,

    u8,
    u16,
    u32,
    u64,

    f32,
    f64,
};

function net_intermediate_to_struct(buffer) {
	var size = buffer_get_size(buffer);
	var cc = net_intermediate_control.none;
	var packet = {};
	while (buffer_tell(buffer) < size) {
		switch (buffer_read(buffer, buffer_u8)) {
			case net_intermediate_control.header:
				if cc != net_intermediate_control.none {
					net_log("Intermediate data was out of order.");
					return noone;
				}
				cc = net_intermediate_control.header;
				
				packet.version = buffer_read(buffer, buffer_f32);
				if packet.version != INTERMEDIATE_VERSION {
					net_log($"Intermediate version {packet.version} isn't supported by this client.");
					return noone;
				}
				packet.id = int64(buffer_read(buffer, buffer_u32));
				packet.reply = int64(buffer_read(buffer, buffer_u32));
				packet.type = buffer_read(buffer, buffer_string);
				break;
			case net_intermediate_control.variable:
				if cc != net_intermediate_control.header && cc != net_intermediate_control.variable {
					net_log("Intermediate data was out of order.");
					return noone;
				}
				
				var name = buffer_read(buffer, buffer_string);
				var type = buffer_read(buffer, buffer_u8);
				struct_set(packet, name, buffer_read(buffer, net_intermediate_type_buffer(type)));
				break;
			case net_intermediate_control.footer:
				return packet;
			case net_intermediate_control.none: continue;
		}
	}

	return noone;
}

function net_struct_to_intermediate(type, event, reply) {
	var buffer = buffer_create(0, buffer_grow, 1);
	var pid = random_range(1, U32_MAX);
	
	buffer_write(buffer, buffer_u8, net_intermediate_control.header);
	buffer_write(buffer, buffer_f32, INTERMEDIATE_VERSION);
	buffer_write(buffer, buffer_u32, pid);
	buffer_write(buffer, buffer_u32, reply);
	buffer_write(buffer, buffer_string, type);
	
	var keys = variable_struct_get_names(event);
	for (var i = array_length(keys)-1; i >= 0; --i) {
	    var k = keys[i];
	    var v = event[$ k];
		
		var vtype;
		if is_real(v)
			vtype = net_number_size(v);
		else if is_string(v)
			vtype = { intermediate: net_intermediate_type.string, buffer: buffer_string };
		else continue;
		
		buffer_write(buffer, buffer_u8, net_intermediate_control.variable);
		buffer_write(buffer, buffer_string, k);
		buffer_write(buffer, buffer_u8, vtype.intermediate);
		buffer_write(buffer, vtype.buffer, v);
	}
	
	buffer_write(buffer, buffer_u8, net_intermediate_control.footer);
	
	return { data: buffer, id: pid };
}

function net_number_size(value) {
	if value % 1 
		return value > F32_MAX ? { intermediate: net_intermediate_type.f64, buffer: buffer_f64 } : { intermediate: net_intermediate_type.f32, buffer: buffer_f32 };
	
	// UINT
	if value >= 0 {
		if value > U32_MAX
			return { intermediate: net_intermediate_type.u64, buffer: buffer_u64 };
		if value > U8_MAX
			return { intermediate: net_intermediate_type.u16, buffer: buffer_u16 };
		if value > U16_MAX
			return { intermediate: net_intermediate_type.u32, buffer: buffer_u32 };
			
		return { intermediate: net_intermediate_type.u8, buffer: buffer_u8 };
	}
	
	// INT
	if value < 0 {
		if value < S16_MIN
			return { intermediate: net_intermediate_type.s32, buffer: buffer_s32 };
		if value < S8_MIN
			return { intermediate: net_intermediate_type.s16, buffer: buffer_s16 };
			
		return { intermediate: net_intermediate_type.s8, buffer: buffer_s8 };
	}
}

function net_intermediate_type_buffer(type) {
	switch (type) {
		case net_intermediate_type.string: return buffer_string;

	    case net_intermediate_type.s8: return buffer_s8;
	    case net_intermediate_type.s16: return buffer_s16;
	    case net_intermediate_type.s32: return buffer_s32;
	    case net_intermediate_type.s64: return buffer_s32;

	    case net_intermediate_type.u8: return buffer_u8;
	    case net_intermediate_type.u16: return buffer_u16;
	    case net_intermediate_type.u32: return buffer_u32;
	    case net_intermediate_type.u64: return buffer_u64;

	    case net_intermediate_type.f32: return buffer_f32;
	    case net_intermediate_type.f64: return buffer_f64;
	}
}

function net_event_string(event, packet) {
    var func = asset_get_index($"net_event_{event}");
    if (func == -1) throw ("Unknown Event: '" + type + "'");
    return script_execute_ext(func, [packet]);
}
