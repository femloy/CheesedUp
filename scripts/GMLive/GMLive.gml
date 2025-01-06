// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all
// Generated at 2024-05-25 23:52:41 (9474ms) for v2.3.7+
/// @lint nullToAny true
// Feather disable all
globalvar g_gml_token_constructors;g_gml_token_constructors=["header","macro_def","macro_start","hash","semico","comma","period","colon","qmark","at_sign","dollar_sign","keyword","ident","undefined_hx","boolean","number","cstring","un_op","adjfix","bin_op","set_op","par_open","par_close","sqb_open","sqb_close","cub_open","cub_close","arg_const","null_co","null_co_set","pragma"];
globalvar g_gml_node_constructors;g_gml_node_constructors=["undefined_hx","boolean","number","cstring","other_const","enum_ctr","array_decl","object_decl","ensure_array_for_local","ensure_array_for_global","ensure_array_for_field","ensure_array_for_index","ensure_array_for_index2d","ident","self_hx","other_hx","global_ref","script","native_script","const","arg_const","arg_index","arg_count","call","call_script","call_script_at","call_script_id","call_script_with_array","call_field","call_func","call_func_at","construct","func_literal","prefix","postfix","un_op","bin_op","set_op","delete_hx","null_co","to_bool","from_bool","in","local_hx","local_set","local_aop","static_hx","static_set","static_aop","global_hx","global_set","global_aop","script_static","script_static_set","script_static_aop","field","field_set","field_aop","env","env_set","env_aop","env_fd","env_fd_set","env_fd_aop","env1d","env1d_set","env1d_aop","alarm","alarm_set_hx","alarm_aop","index","index_set","index_aop","index2d","index2d_set","index2d_aop","raw_id","raw_id_set","raw_id_aop","raw_id2d","raw_id2d_set","raw_id2d_aop","ds_list","ds_list_set_hx","ds_list_aop","ds_map","ds_map_set_hx","ds_map_aop","ds_grid","ds_grid_set_hx","ds_grid_aop","key_id","key_id_set","key_id_aop","var_decl","block","if_then","ternary","switch_hx","wait","fork","while_hx","do_until","do_while","repeat_hx","for_hx","with_hx","once","return_hx","exit_hx","break_hx","continue_hx","debugger","try_catch","throw_hx"];
globalvar mq_gml_thread_scope;mq_gml_thread_scope=[undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined];
globalvar gml_std_haxe_type_markerValue;if(live_enabled)gml_std_haxe_type_markerValue=[];
globalvar mt_gml_std_Date;
globalvar mt_gml_builder;
globalvar mt_gml_action;
globalvar mt_gml_func;
globalvar mt_api_api_version;
globalvar mt_gml_parser;
globalvar mt_gml_parser_template_state;
globalvar mt_gml_parser_macro;
globalvar mt_gml_program;
globalvar mt_gml_std_StringBuf;
globalvar mt_api_api_var;
globalvar mt_gml_enum;
globalvar mt_gml_enum_ctr;
globalvar mt_gml_macro;
globalvar mt_ast_gml_node_def_param;
globalvar mt_ast_gml_node_def_ctr;
globalvar mt_gml_script;
globalvar mt_gml_source;
globalvar mt_gml_std_haxe_class;
globalvar mt_gml_std_haxe_enum;
globalvar mt_gml_std_haxe_Exception;
globalvar mt_haxe_ds_basic_map;
globalvar mt_haxe_ds_string_map;
globalvar mt_gml_thread_scope;
globalvar mt_gml_with_scope;
globalvar mt_gml_type_ref;
globalvar mt_vm_v2_GmlStructBase;
if(live_enabled)then(function(){
mt_gml_std_Date=new gml_std_haxe_class(-1,"gml_std_Date");
mt_gml_builder=new gml_std_haxe_class(-1,"gml_builder");
mt_gml_action=new gml_std_haxe_enum(-1,"gml_action",["discard","dup","dup2x","dup3x","dup_in","undefined_hx","number","cstring","array_decl","object_decl","const","self_hx","other_hx","local_hx","local_set","local_aop","global_hx","global_set","global_aop","field","field_set","field_aop","fast_field_aop","self_field","self_field_set","self_field_aop","fast_self_field","fast_self_field_set","fast_self_field_aop","local_field","local_field_set","local_field_aop","fast_local_field","fast_local_field_set","fast_local_field_aop","index","index_set","index_aop","index2d","index2d_set","index2d_aop","env","env_set","env_aop","env1d","env1d_set","env1d_aop","ds_aop","arg_const","arg_const_set","arg_const_aop","arg_index","arg_index_set","arg_index_aop","arg_count","add_int","equ_op","neq_op","concat","bin_op","un_op","in","in_const","call_script","call_script_id","call_script_with_array","call_func","call_func0","call_func0o","call_func1","call_func1o","call_func2","call_func2o","call_func3","call_func3o","call_func4","call_func4o","call_func_with_local0","call_func_with_local0o","call_func_with_local1","call_func_with_local1o","call_func_with_local2","call_func_with_local2o","call_func_with_local3","call_func_with_local3o","call_func_with_local4","call_func_with_local4o","call_field","construct","func_literal","jump","jump_if","jump_unless","jump_placeholder","bool_and","bool_or","null_co","switch_hx","switch_case","repeat_jump","repeat_pre","with_pre","with_next","with_post","break_hx","continue_hx","return_hx","return_const","result","try_hx","catch_hx","finally_hx","throw_hx","wait","fork","ensure_array_for_local","ensure_array_for_global","ensure_array_for_field","ensure_array_for_index","ensure_array_for_index2d","alarm","alarm_set_hx","alarm_aop","closure"]);
mt_gml_func=new gml_std_haxe_class(-1,"gml_func");
mt_api_api_version=new gml_std_haxe_class(-1,"api_api_version");
mt_gml_parser=new gml_std_haxe_class(-1,"gml_parser");
mt_gml_parser_template_state=new gml_std_haxe_class(-1,"gml_parser_template_state");
mt_gml_parser_macro=new gml_std_haxe_class(-1,"gml_parser_macro");
mt_gml_program=new gml_std_haxe_class(-1,"gml_program");
mt_gml_std_StringBuf=new gml_std_haxe_class(-1,"gml_std_StringBuf");
mt_api_api_var=new gml_std_haxe_class(-1,"api_api_var");
mt_gml_enum=new gml_std_haxe_class(-1,"gml_enum");
mt_gml_enum_ctr=new gml_std_haxe_class(-1,"gml_enum_ctr");
mt_gml_macro=new gml_std_haxe_class(-1,"gml_macro");
mt_ast_gml_node_def_param=new gml_std_haxe_class(-1,"ast_gml_node_def_param");
mt_ast_gml_node_def_ctr=new gml_std_haxe_class(-1,"ast_gml_node_def_ctr");
mt_gml_script=new gml_std_haxe_class(-1,"gml_script");
mt_gml_source=new gml_std_haxe_class(-1,"gml_source");
mt_gml_std_haxe_class=new gml_std_haxe_class(-1,"gml_std_haxe_class");
mt_gml_std_haxe_enum=new gml_std_haxe_class(-1,"gml_std_haxe_enum");
mt_gml_std_haxe_Exception=new gml_std_haxe_class(-1,"gml_std_haxe_Exception");
mt_haxe_ds_basic_map=new gml_std_haxe_class(-1,"haxe_ds_basic_map");
mt_haxe_ds_string_map=new gml_std_haxe_class(-1,"haxe_ds_string_map");
mt_haxe_ds_string_map.h_superClass=mt_haxe_ds_basic_map;
mt_gml_thread_scope=new gml_std_haxe_class(7,"gml_thread_scope");
mt_gml_with_scope=new gml_std_haxe_class(-1,"gml_with_scope");
mt_gml_type_ref=new gml_std_haxe_class(-1,"gml_type_ref");
mt_vm_v2_GmlStructBase=new gml_std_haxe_class(-1,"vm_v2_GmlStructBase");
})();
enum gml_node{undefined_hx,boolean,number,cstring,other_const,enum_ctr,array_decl,object_decl,ensure_array_for_local,ensure_array_for_global,ensure_array_for_field,ensure_array_for_index,ensure_array_for_index2d,ident,self_hx,other_hx,global_ref,script,native_script,const,arg_const,arg_index,arg_count,call,call_script,call_script_at,call_script_id,call_script_with_array,call_field,call_func,call_func_at,construct,func_literal,prefix,postfix,un_op,bin_op,set_op,delete_hx,null_co,to_bool,from_bool,in,local_hx,local_set,local_aop,static_hx,static_set,static_aop,global_hx,global_set,global_aop,script_static,script_static_set,script_static_aop,field,field_set,field_aop,env,env_set,env_aop,env_fd,env_fd_set,env_fd_aop,env1d,env1d_set,env1d_aop,alarm,alarm_set_hx,alarm_aop,index,index_set,index_aop,index2d,index2d_set,index2d_aop,raw_id,raw_id_set,raw_id_aop,raw_id2d,raw_id2d_set,raw_id2d_aop,ds_list,ds_list_set_hx,ds_list_aop,ds_map,ds_map_set_hx,ds_map_aop,ds_grid,ds_grid_set_hx,ds_grid_aop,key_id,key_id_set,key_id_aop,var_decl,block,if_then,ternary,switch_hx,wait,fork,while_hx,do_until,do_while,repeat_hx,for_hx,with_hx,once,return_hx,exit_hx,break_hx,continue_hx,debugger,try_catch,throw_hx}
if(live_enabled)function gml_std_enum_toString(){
	return gml_std_Std_stringify(self);
}
if(live_enabled)function gml_std_enum_getIndex(){
	return __enumIndex__;
}
enum gml_token{header,macro_def,macro_start,hash,semico,comma,period,colon,qmark,at_sign,dollar_sign,keyword,ident,undefined_hx,boolean,number,cstring,un_op,adjfix,bin_op,set_op,par_open,par_close,sqb_open,sqb_close,cub_open,cub_close,arg_const,null_co,null_co_set,pragma}

if(live_enabled)
function gml_std_Date(l_year,l_month,l_day,l_hour,l_min1,l_sec)constructor{
	// gml_std_Date(year:int, month:int, day:int, hour:int, min:int, sec:int)
	/// @ignore
	static h_date=undefined; /// @is {date}
	static h_getTime=function(){
		return (self.h_date-25569)*86400000;
	}
	self.h_date=date_create_datetime(l_year,l_month+1,l_day,l_hour,l_min1,l_sec);
	static __class__=mt_gml_std_Date;
}

if(live_enabled)
function gml_std_Date_now(){
	// gml_std_Date_now()->gml_std_Date
	/// @ignore
	var l_d=new gml_std_Date(2000,0,1,0,0,0);
	l_d.h_date=date_current_datetime();
	return l_d;
}

if(live_enabled)
function gml_builder(l_pg,l_src)constructor{
	// gml_builder(pg:gml_program, src:gml_source)
	/// @ignore
	static h_tokens=undefined; /// @is {array<gml_token>}
	static h_source=undefined; /// @is {gml_source}
	static h_offset=undefined; /// @is {int}
	static h_length=undefined; /// @is {int}
	static h_scripts=undefined; /// @is {array<gml_script>}
	static h_enums=undefined; /// @is {array<gml_enum>}
	static h_macro_names=undefined; /// @is {array<string>}
	static h_macro_nodes=undefined; /// @is {array<gml_macro>}
	static h_global_vars=undefined; /// @is {array<string>}
	static h_run=function(){
		if(self.h_error_text==undefined)self.h_build_loop(self.h_source.h_main);
	}
	static h_error_text=undefined; /// @is {string}
	static h_error_pos=undefined; /// @is {gml_pos}
	static h_error_at=function(l_text,l_pos){
		self.h_error_text=gml_pos_to_string(l_pos,self.h_program)+": "+l_text;
		self.h_error_pos=l_pos;
		return true;
	}
	static h_error=function(l_text,l_tk){
		return self.h_error_at(l_text,l_tk[1]);
	}
	static h_expect=function(l_text,l_tk){
		return self.h_error("Expected "+l_text+", got "+g_gml_token_constructors[l_tk[0]],l_tk);
	}
	static h_expect_node=function(l_text,l_node){
		return self.h_error_at("Expected "+l_text+", got "+g_gml_node_constructors[l_node[0]],gml_std_haxe_enum_tools_getParameter(l_node,0));
	}
	static h_out_node=undefined; /// @is {ast_GmlNode}
	static h_current_script=undefined; /// @is {string}
	static h_current_script_ref=undefined; /// @is {gml_script}
	static h_build_ops=function(l_firstPos,l_firstOp){
		self.h_offset+=1;
		var l_nodes=ds_list_create();
		ds_list_add(l_nodes,self.h_out_node);
		var l_ops=ds_list_create();
		ds_list_add(l_ops,l_firstOp);
		var l_locs=ds_list_create();
		ds_list_add(l_locs,l_firstPos);
		var l_proc=true;
		var l_i;
		while(l_proc&&self.h_offset<self.h_length){
			if(self.h_build_expr(1)){
				ds_list_destroy(l_nodes);
				ds_list_destroy(l_ops);
				ds_list_destroy(l_locs);
				return true;
			}
			ds_list_add(l_nodes,self.h_out_node);
			if(self.h_offset<self.h_length){
				var l__g=self.h_tokens[self.h_offset];
				switch(l__g[0]){
					case gml_token.bin_op:
						self.h_offset+=1;
						ds_list_add(l_locs,l__g[1]);
						ds_list_add(l_ops,l__g[2]);
						break;
					case gml_token.set_op:
						if(l__g[2]==-1){
							self.h_offset+=1;
							ds_list_add(l_locs,l__g[1]);
							ds_list_add(l_ops,64);
						} else l_proc=false;
						break;
					default:l_proc=false;
				}
			}
		}
		var l_pmin=7;
		var l_pmax=0;
		var l_n=ds_list_size(l_ops);
		for(l_i=0;l_i<l_n;l_i++){
			var l_pcur=gml_op_get_priority(ds_list_find_value(l_ops,l_i));
			if(l_pcur<l_pmin)l_pmin=l_pcur;
			if(l_pcur>l_pmax)l_pmax=l_pcur;
		}
		while(l_pmin<=l_pmax){
			for(l_i=0;l_i<l_n;l_i++){
				if(gml_op_get_priority(ds_list_find_value(l_ops,l_i))==l_pmin){
					ds_list_set(l_nodes,l_i,[gml_node.bin_op,ds_list_find_value(l_locs,l_i),ds_list_find_value(l_ops,l_i),ds_list_find_value(l_nodes,l_i),ds_list_find_value(l_nodes,l_i+1)]);
					ds_list_delete(l_nodes,l_i+1);
					ds_list_delete(l_ops,l_i);
					ds_list_delete(l_locs,l_i);
					l_n--;
					l_i--;
				}
			}
			l_pmin++;
		}
		self.h_out_node=ds_list_find_value(l_nodes,0);
		ds_list_destroy(l_nodes);
		ds_list_destroy(l_ops);
		ds_list_destroy(l_locs);
		return false;
	}
	static h_build_args=function(l_pos,l_sqb){
		var l_args1=[];
		var l_proc=true;
		var l_seenComma=true;
		var l_func=self.h_out_node;
		while(l_proc&&self.h_offset<self.h_length){
			var l_tk=self.h_tokens[self.h_offset];
			switch(l_tk[0]){
				case gml_token.par_close:
					if(l_sqb){
						return self.h_error("Unexpected `)`",l_tk);
					} else {
						l_proc=false;
						self.h_offset+=1;
					}
					break;
				case gml_token.sqb_close:
					if(l_sqb){
						l_proc=false;
						self.h_offset+=1;
					} else return self.h_error("Unexpected `]`",l_tk);
					break;
				case gml_token.comma:
					if(l_seenComma){
						array_push(l_args1,[gml_node.undefined_hx,l_tk[1]]);
						self.h_offset+=1;
					} else {
						l_seenComma=true;
						self.h_offset+=1;
					}
					break;
				default:
					if(l_seenComma){
						l_seenComma=false;
						if(self.h_build_expr(0))return true;
						array_push(l_args1,self.h_out_node);
					} else return self.h_expect("a comma or closing token.",l_tk);
			}
		}
		if(l_proc)return self.h_error_at("Unclosed list",l_pos);
		if(l_sqb)self.h_out_node=[gml_node.array_decl,l_pos,l_args1]; else self.h_out_node=[gml_node.call,l_pos,l_func,l_args1];
		return false;
	}
	static h_build_expr=function(l_flags){
		if(self.h_offset>=self.h_length)return self.h_error_at("Expected an expression",self.h_source.h_get_eof());
		var l_proc,l_sep,l_i,l_n,l_s,l_tk;
		var l_tk0=self.h_tokens[self.h_offset++];
		var l_node,l_node2,l_nodes;
		switch(l_tk0[0]){
			case gml_token.undefined_hx:self.h_out_node=[gml_node.undefined_hx,l_tk0[1]];break;
			case gml_token.number:self.h_out_node=[gml_node.number,l_tk0[1],l_tk0[2],l_tk0[3]];break;
			case gml_token.boolean:self.h_out_node=[gml_node.boolean,l_tk0[1],l_tk0[2]];break;
			case gml_token.cstring:self.h_out_node=[gml_node.cstring,l_tk0[1],l_tk0[2]];break;
			case gml_token.sqb_open:
				if(l_tk0[2]==0){
					l_proc=true;
					l_sep=true;
					self.h_build_args(l_tk0[1],true);
				} else if((l_flags&4)!=0){
					return self.h_expect("a statement",l_tk0);
				} else return self.h_expect("a value",l_tk0);
				break;
			case gml_token.ident:
				var l_s1=l_tk0[2];
				switch(l_s1){
					case "self":self.h_out_node=[gml_node.self_hx,l_tk0[1]];break;
					case "other":self.h_out_node=[gml_node.other_hx,l_tk0[1]];break;
					default:
						if(variable_struct_get(gml_asset_index,l_s1)!=undefined){
							l_i=variable_struct_get(gml_asset_index,l_s1);
							self.h_out_node=[gml_node.number,l_tk0[1],l_i,undefined];
						} else {
							var l_m=variable_struct_get(self.h_program.h_macro_map,l_s1);
							if(l_m!=undefined&&l_m.h_is_expr)self.h_out_node=gml_node_tools_clone(l_m.h_node); else self.h_out_node=[gml_node.ident,l_tk0[1],l_s1];
						}
				}
				break;
			case gml_token.arg_const:self.h_out_node=[gml_node.arg_const,l_tk0[1],l_tk0[2]];break;
			case gml_token.un_op:
				if(self.h_build_expr(1))return true;
				var l__g=self.h_out_node;
				if(l__g[0]==2){
					var l_f=l__g[2];
					switch(l_tk0[2]){
						case 2:l_f=~(l_f|0);break;
						case 0:l_f=-l_f;break;
						case 1:l_f=(l_f>0.5?0:1);break;
					}
					self.h_out_node=[gml_node.number,l_tk0[1],l_f,undefined];
				} else self.h_out_node=[gml_node.un_op,l_tk0[1],self.h_out_node,l_tk0[2]];
				break;
			case gml_token.adjfix:
				if(self.h_build_expr(1))return true;
				self.h_out_node=[gml_node.prefix,l_tk0[1],self.h_out_node,l_tk0[2]];
				break;
			case gml_token.bin_op:
				var l__g=l_tk0[1];
				switch(l_tk0[2]){
					case 16:if(self.h_build_expr(1))return true;break;
					case 17:
						var l_d=l__g;
						if(self.h_build_expr(1))return true;
						var l__g=self.h_out_node;
						if(l__g[0]==2)self.h_out_node=[gml_node.number,l_d,-l__g[2],undefined]; else self.h_out_node=[gml_node.un_op,l_d,self.h_out_node,0];
						break;
					default:if((l_flags&4)!=0)return self.h_expect("a statement",l_tk0); else return self.h_expect("a value",l_tk0);
				}
				break;
			case gml_token.par_open:
				if(self.h_build_expr(0))return true;
				if(self.h_offset>=self.h_length)return self.h_error("Unclosed parenthesis",l_tk0);
				if(self.h_offset>=self.h_length){
					return self.h_error_at("Expected a closing parenthesis",self.h_source.h_get_eof());
				} else if(self.h_tokens[self.h_offset][0]==22){
					self.h_offset+=1;
				} else return self.h_error("Expected a closing parenthesis",self.h_tokens[self.h_offset]);
				break;
			case gml_token.cub_open:
				var l_d=l_tk0[1];
				var l_keys=[];
				l_nodes=[];
				l_proc=true;
				var l__g=self.h_tokens[self.h_offset];
				if((l__g[0]==26)){
					l_proc=false;
					self.h_offset+=1;
				} else while(l_proc&&self.h_offset<self.h_length){
					var l__g=self.h_tokens[self.h_offset];
					switch(l__g[0]){
						case gml_token.ident:
							l_s=l__g[2];
							array_push(l_keys,l_s);
							self.h_offset+=1;
							if(self.h_offset>=self.h_length)continue;
							var l__g1=self.h_tokens[self.h_offset];
							var l_tmp;
							if(l__g1[0]==7)l_tmp=true; else l_tmp=false;
							if(l_tmp){
								self.h_offset+=1;
								if(self.h_build_expr(0))return true;
								array_push(l_nodes,self.h_out_node);
							} else {
								l_node=[gml_node.ident,l__g[1],l_s];
								array_push(l_nodes,l_node);
							}
							switch(self.h_tokens[self.h_offset][0]){
								case gml_token.comma:
									self.h_offset+=1;
									if(self.h_tokens[self.h_offset][0]==26){
										self.h_offset+=1;
										l_proc=false;
									}
									break;
								case gml_token.cub_close:
									self.h_offset+=1;
									l_proc=false;
									break;
								default:return self.h_expect("a `,` or a `}` in object declaration",self.h_tokens[self.h_offset]);
							}
							break;
						case gml_token.cstring:
							l_s=l__g[2];
							array_push(l_keys,l_s);
							self.h_offset+=1;
							if(self.h_offset>=self.h_length)continue;
							var l__g8=self.h_tokens[self.h_offset];
							var l_tmp1;
							if(l__g8[0]==7)l_tmp1=true; else l_tmp1=false;
							if(l_tmp1){
								self.h_offset+=1;
								if(self.h_build_expr(0))return true;
								array_push(l_nodes,self.h_out_node);
							} else {
								l_node=[gml_node.ident,l__g[1],l_s];
								array_push(l_nodes,l_node);
							}
							switch(self.h_tokens[self.h_offset][0]){
								case gml_token.comma:
									self.h_offset+=1;
									if(self.h_tokens[self.h_offset][0]==26){
										self.h_offset+=1;
										l_proc=false;
									}
									break;
								case gml_token.cub_close:
									self.h_offset+=1;
									l_proc=false;
									break;
								default:return self.h_expect("a `,` or a `}` in object declaration",self.h_tokens[self.h_offset]);
							}
							break;
						default:return self.h_expect("a key-value pair or a `}` in object declaration",self.h_tokens[self.h_offset]);
					}
				}
				if(l_proc)return self.h_error_at("Unclosed struct literal",l_d);
				self.h_out_node=[gml_node.object_decl,l_d,l_keys,l_nodes];
				break;
			case gml_token.header:if((l_flags&4)!=0)return self.h_error("Expected a statement, got a header (did you miss a closing bracket?)",l_tk0); else return self.h_error("Expected an expression, got a header (did you miss a closing parenthesis?)",l_tk0);
			case gml_token.keyword:
				switch(l_tk0[2]){
					case 0:
						var l_d=l_tk0[1];
						if(self.h_offset>=self.h_length){
							self.h_out_node=[gml_node.global_ref,l_d];
						} else if(self.h_tokens[self.h_offset][0]==6){
							l_tk=self.h_tokens[self.h_offset++];
							if(self.h_offset>=self.h_length){
								return self.h_expect("a field name",l_tk);
							} else {
								var l__g1=self.h_tokens[self.h_offset];
								if(l__g1[0]==12){
									self.h_offset+=1;
									self.h_out_node=[gml_node.global_hx,l__g1[1],l__g1[2]];
								} else return self.h_expect("a field name",self.h_tokens[self.h_offset]);
							}
						} else self.h_out_node=[gml_node.global_ref,l_d];
						break;
					case 26:
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected an opening square bracket",self.h_source.h_get_eof());
						} else if(self.h_tokens[self.h_offset][0]==23){
							self.h_offset+=1;
						} else return self.h_error("Expected an opening square bracket",self.h_tokens[self.h_offset]);
						if(self.h_build_expr(0))return true;
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected a closing square bracket",self.h_source.h_get_eof());
						} else if(self.h_tokens[self.h_offset][0]==24){
							self.h_offset+=1;
						} else return self.h_error("Expected a closing square bracket",self.h_tokens[self.h_offset]);
						self.h_out_node=[gml_node.arg_index,l_tk0[1],self.h_out_node];
						break;
					case 27:self.h_out_node=[gml_node.arg_count,l_tk0[1]];break;
					case 25:
						if(self.h_build_expr(l_flags))return true;
						var l__g1=self.h_out_node;
						if(l__g1[0]==23)self.h_out_node=[gml_node.construct,l__g1[1],l__g1[2],l__g1[3]]; else return self.h_expect("a callable value after `new`",l_tk0);
						break;
					case 24:
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected a function name or `(`",self.h_source.h_get_eof());
						var l_oldName=self.h_current_script;
						var l_oldScript=self.h_current_script_ref;
						l_i=0;
						do {
							l_s=l_oldName+"+"+string(++l_i);
							l_n=array_length(self.h_scripts);
							while(--l_n>=0){
								if(self.h_scripts[l_n].h_name==l_s)break;
							}
						} until(l_n<=0);
						var l_scrName;
						var l__g1=self.h_tokens[self.h_offset];
						if(l__g1[0]==12){
							var l__name=l__g1[2];
							self.h_offset+=1;
							l_scrName=l__name;
						} else l_scrName=undefined;
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected an opening `(`",self.h_source.h_get_eof());
						} else if(self.h_tokens[self.h_offset][0]==21){
							self.h_offset+=1;
						} else return self.h_error("Expected an opening `(`",self.h_tokens[self.h_offset]);
						if(self.h_build_script_args())return true;
						var l_isConstructor=false;
						var l_tmp;
						if(self.h_offset<self.h_length){
							var l__g1=self.h_tokens[self.h_offset];
							if(l__g1[0]==12)l_tmp=l__g1[2]=="constructor"; else l_tmp=false;
						} else l_tmp=false;
						if(l_tmp){
							l_isConstructor=true;
							self.h_offset+=1;
						}
						var l_argPrefix=self.h_build_script_args_prefix;
						var l_scr=self.h_add_script(l_s,self.h_build_script_args_map,self.h_build_script_args_argc,true,[]);
						l_scr.h_is_constructor=l_isConstructor;
						self.h_build_script_args_map=undefined;
						self.h_current_script=l_s;
						self.h_current_script_ref=l_scr;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected function body",self.h_source.h_get_eof());
						l_tk=self.h_tokens[self.h_offset];
						if(l_tk[0]==25)var l__g1=l_tk[1]; else return self.h_expect("a `{`",self.h_tokens[self.h_offset]);
						self.h_build_line();
						if(l_argPrefix!=undefined){
							array_push(l_argPrefix,self.h_out_node);
							l_scr.h_node=[gml_node.block,gml_std_haxe_enum_tools_getParameter(self.h_out_node,0),l_argPrefix];
						} else l_scr.h_node=self.h_out_node;
						self.h_out_node=[gml_node.func_literal,l_tk0[1],l_s,false];
						self.h_current_script=l_oldName;
						self.h_current_script_ref=l_oldScript;
						break;
					default:if((l_flags&4)!=0)return self.h_expect("a statement",l_tk0); else return self.h_expect("a value",l_tk0);
				}
				break;
			default:if((l_flags&4)!=0)return self.h_expect("a statement",l_tk0); else return self.h_expect("a value",l_tk0);
		}
		l_proc=true;
		while(l_proc&&self.h_offset<self.h_length){
			l_tk=self.h_tokens[self.h_offset];
			switch(l_tk[0]){
				case gml_token.adjfix:
					if((l_flags&2)==0){
						self.h_offset+=1;
						self.h_out_node=[gml_node.postfix,l_tk[1],self.h_out_node,l_tk[2]];
						l_flags|=2;
					} else if(l_tk[2]){
						return self.h_error_at("Unexpected `++`",l_tk[1]);
					} else return self.h_error_at("Unexpected `--`",l_tk[1]);
					break;
				case gml_token.period:
					if((l_flags&2)==0){
						self.h_offset+=1;
						var l__g=self.h_tokens[self.h_offset];
						if(l__g[0]==12){
							l_s=l__g[2];
							self.h_offset+=1;
							self.h_out_node=[gml_node.field,l_tk[1],self.h_out_node,l_s];
						} else return self.h_error("Expected a field name",self.h_tokens[self.h_offset]);
					} else return self.h_error("Unexpected period",self.h_tokens[self.h_offset]);
					break;
				case gml_token.par_open:
					if((l_flags&2)==0){
						self.h_offset+=1;
						if(self.h_build_args(l_tk[1],false))return true;
					} else return self.h_error_at("Unexpected `(`",l_tk[1]);
					break;
				case gml_token.sqb_open:
					var l_d4=l_tk[1];
					if((l_flags&2)==0){
						self.h_offset+=1;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected an index",self.h_source.h_get_eof());
						l_node=self.h_out_node;
						switch(l_tk[2]){
							case 124:
								if(self.h_build_expr(0))return true;
								if(self.h_offset>=self.h_length){
									return self.h_error_at("Expected a closing bracket",self.h_source.h_get_eof());
								} else if(self.h_tokens[self.h_offset][0]==24){
									self.h_offset+=1;
								} else return self.h_error("Expected a closing bracket",self.h_tokens[self.h_offset]);
								self.h_out_node=[gml_node.ds_list,l_d4,l_node,self.h_out_node];
								break;
							case 63:
								if(self.h_build_expr(0))return true;
								if(self.h_offset>=self.h_length){
									return self.h_error_at("Expected a closing bracket",self.h_source.h_get_eof());
								} else if(self.h_tokens[self.h_offset][0]==24){
									self.h_offset+=1;
								} else return self.h_error("Expected a closing bracket",self.h_tokens[self.h_offset]);
								self.h_out_node=[gml_node.ds_map,l_d4,l_node,self.h_out_node];
								break;
							case 35:
								if(self.h_build_expr(0))return true;
								l_node2=self.h_out_node;
								if(self.h_offset>=self.h_length){
									return self.h_error_at("Expected a comma",self.h_source.h_get_eof());
								} else if(self.h_tokens[self.h_offset][0]==5){
									self.h_offset+=1;
								} else return self.h_error("Expected a comma",self.h_tokens[self.h_offset]);
								if(self.h_build_expr(0))return true;
								if(self.h_offset>=self.h_length){
									return self.h_error_at("Expected a closing bracket",self.h_source.h_get_eof());
								} else if(self.h_tokens[self.h_offset][0]==24){
									self.h_offset+=1;
								} else return self.h_error("Expected a closing bracket",self.h_tokens[self.h_offset]);
								self.h_out_node=[gml_node.ds_grid,l_d4,l_node,l_node2,self.h_out_node];
								break;
							case 36:
								if(self.h_build_expr(0))return true;
								if(self.h_offset>=self.h_length){
									return self.h_error_at("Expected a closing bracket",self.h_source.h_get_eof());
								} else if(self.h_tokens[self.h_offset][0]==24){
									self.h_offset+=1;
								} else return self.h_error("Expected a closing bracket",self.h_tokens[self.h_offset]);
								self.h_out_node=[gml_node.key_id,l_d4,l_node,self.h_out_node];
								break;
							case 64:
								if(self.h_build_expr(0))return true;
								if(self.h_offset>=self.h_length)return self.h_error_at("Expected comma or a closing bracket",self.h_source.h_get_eof());
								switch(self.h_tokens[self.h_offset][0]){
									case gml_token.comma:
										self.h_offset+=1;
										l_node2=self.h_out_node;
										if(self.h_build_expr(0))return true;
										if(self.h_offset>=self.h_length){
											return self.h_error_at("Expected a closing bracket",self.h_source.h_get_eof());
										} else if(self.h_tokens[self.h_offset][0]==24){
											self.h_offset+=1;
										} else return self.h_error("Expected a closing bracket",self.h_tokens[self.h_offset]);
										self.h_out_node=[gml_node.raw_id2d,l_d4,l_node,l_node2,self.h_out_node];
										break;
									case gml_token.sqb_close:
										self.h_offset+=1;
										self.h_out_node=[gml_node.raw_id,l_d4,l_node,self.h_out_node];
										break;
									default:self.h_expect("comma or a closing bracket",self.h_tokens[self.h_offset]);
								}
								break;
							case 0:l_proc=false;break;
							default:return self.h_error("Unknown accessor",l_tk);
						}
						if(!l_proc){
							l_proc=true;
							if(self.h_build_expr(0))return true;
							if(self.h_offset>=self.h_length)return self.h_error_at("Expected comma or a closing bracket",self.h_source.h_get_eof());
							switch(self.h_tokens[self.h_offset][0]){
								case gml_token.comma:
									self.h_offset+=1;
									l_node2=self.h_out_node;
									if(self.h_build_expr(0))return true;
									if(self.h_offset>=self.h_length){
										return self.h_error_at("Expected a closing bracket",self.h_source.h_get_eof());
									} else if(self.h_tokens[self.h_offset][0]==24){
										self.h_offset+=1;
									} else return self.h_error("Expected a closing bracket",self.h_tokens[self.h_offset]);
									self.h_out_node=[gml_node.index2d,l_d4,l_node,l_node2,self.h_out_node];
									break;
								case gml_token.sqb_close:
									self.h_offset+=1;
									self.h_out_node=[gml_node.index,l_d4,l_node,self.h_out_node];
									break;
								default:self.h_expect("comma or a closing bracket",self.h_tokens[self.h_offset]);
							}
						}
					} else return self.h_error_at("Unexpected `[`",l_d4);
					break;
				case gml_token.bin_op:
					if((l_flags&1)==0){
						if(self.h_build_ops(l_tk[1],l_tk[2]))return true;
						l_flags|=2;
					} else l_proc=false;
					break;
				case gml_token.set_op:
					var l__g5=l_tk[2];
					if(l__g5==-1){
						var l_p1=l_tk[1];
						if((l_flags&4)!=0){
							l_node=self.h_out_node;
							self.h_offset+=1;
							if(self.h_build_expr(0))return true;
							self.h_out_node=[gml_node.set_op,l_p1,-1,l_node,self.h_out_node];
							l_proc=false;
						} else if((l_flags&1)==0){
							if(self.h_build_ops(l_p1,64))return true;
							l_flags|=2;
						} else l_proc=false;
					} else {
						var l_o1=l__g5;
						var l_p2=l_tk[1];
						if((l_flags&4)!=0){
							l_node=self.h_out_node;
							self.h_offset+=1;
							if(self.h_build_expr(0))return true;
							self.h_out_node=[gml_node.set_op,l_p2,l_o1,l_node,self.h_out_node];
						}
						l_proc=false;
					}
					break;
				case gml_token.null_co:
					if((l_flags&1)==0){
						l_node=self.h_out_node;
						self.h_offset+=1;
						if(self.h_build_expr(0))return true;
						l_flags|=2;
						self.h_out_node=[gml_node.null_co,l_tk[1],l_node,self.h_out_node];
					} else l_proc=false;
					break;
				case gml_token.null_co_set:
					var l_p4=l_tk[1];
					if((l_flags&4)!=0){
						l_node=self.h_out_node;
						self.h_offset+=1;
						if(self.h_build_expr(0))return true;
						self.h_out_node=[gml_node.set_op,l_p4,-1,gml_node_tools_clone(l_node),self.h_out_node];
						l_node2=[gml_node.undefined_hx,l_p4];
						l_node=[gml_node.bin_op,l_p4,64,l_node,l_node2];
						self.h_out_node=[gml_node.if_then,l_p4,l_node,self.h_out_node,undefined];
					}
					l_proc=false;
					break;
				case gml_token.qmark:
					if((l_flags&1)==0){
						self.h_offset+=1;
						l_node=self.h_out_node;
						if(self.h_build_expr(0))return true;
						l_node2=self.h_out_node;
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected an else-colon",self.h_source.h_get_eof());
						} else if(self.h_tokens[self.h_offset][0]==7){
							self.h_offset+=1;
						} else return self.h_error("Expected an else-colon",self.h_tokens[self.h_offset]);
						if(self.h_build_expr(0))return true;
						self.h_out_node=[gml_node.ternary,l_tk[1],l_node,l_node2,self.h_out_node];
					} else l_proc=false;
					break;
				default:l_proc=false;
			}
		}
		return false;
	}
	static h_build_line_inner=function(l_reqStatement){
		if(self.h_offset>=self.h_length)return self.h_error_at("Expected a statement",self.h_source.h_get_eof());
		var l_tk=self.h_tokens[self.h_offset++];
		var l_tk2,l_proc,l_sep,l_x,l_x1,l_x2,l_nodes,l_i,l_s,l_d;
		var l_unknown=false;
		switch(l_tk[0]){
			case gml_token.ident:
				if(l_tk[2]=="static"){
					var l_d=l_tk[1];
					var l__g=self.h_tokens[self.h_offset];
					if((l__g[0]==12)){
						l_nodes=[];
						l_proc=true;
						while(l_proc&&self.h_offset<self.h_length){
							l_tk2=self.h_tokens[self.h_offset++];
							switch(l_tk2[0]){
								case gml_token.keyword:if(l_tk2[2]==2)var l_d1=l_tk2[1]; else return self.h_expect("a static variable name",l_tk2);break;
								case gml_token.ident:
									var l_id=l_tk2[2];
									if(self.h_offset>=self.h_length)return self.h_error_at("Expected a static variable value",self.h_source.h_get_eof());
									l_tk=self.h_tokens[self.h_offset];
									if(self.h_offset>=self.h_length){
										return self.h_error_at("Expected a static variable value",self.h_source.h_get_eof());
									} else {
										var l__g=self.h_tokens[self.h_offset];
										if(l__g[0]==20){
											if(l__g[2]==-1)self.h_offset+=1; else return self.h_error("Expected a static variable value",self.h_tokens[self.h_offset]);
										} else return self.h_error("Expected a static variable value",self.h_tokens[self.h_offset]);
									}
									if(self.h_build_expr(0))return true;
									var l_scr=self.h_current_script_ref;
									if(variable_struct_exists(l_scr.h_static_map,l_id))return self.h_error("Re-declaration of static variable "+l_id,l_tk2);
									array_push(l_scr.h_static_names,l_id);
									variable_struct_set(l_scr.h_static_map,l_id,l_scr.h_static_count++);
									array_push(l_scr.h_static_init,[gml_node.static_set,l_tk2[1],l_id,self.h_out_node,true]);
									array_push(l_scr.h_static_values,undefined);
									if(self.h_offset<self.h_length)switch(self.h_tokens[self.h_offset][0]){
										case gml_token.comma:self.h_offset+=1;break;
										case gml_token.semico:
											self.h_offset+=1;
											l_proc=false;
											break;
										default:l_proc=false;
									}
									break;
								default:return self.h_expect("a static variable name",l_tk2);
							}
						}
						if(array_length(l_nodes)!=1)self.h_out_node=[gml_node.block,l_d,l_nodes]; else self.h_out_node=l_nodes[0];
					} else l_unknown=true;
				} else l_unknown=true;
				break;
			case gml_token.keyword:
				var l__g=l_tk[1];
				switch(l_tk[2]){
					case 1:
						l_d=l__g;
						l_nodes=[];
						l_x1=[gml_node.block,l_d,l_nodes];
						while(self.h_offset<self.h_length){
							l_tk2=self.h_tokens[self.h_offset++];
							if(l_tk2[0]==12){
								l_d=l_tk2[1];
								l_s=l_tk2[2];
								array_push(self.h_global_vars,l_s);
								l_i=array_length(self.h_macro_names);
								self.h_macro_names[@l_i]=l_s;
								self.h_macro_nodes[@l_i]=new gml_macro(l_s,[gml_node.global_hx,l_d,l_s],true,false);
								var l__g1=self.h_tokens[self.h_offset];
								if(l__g1[0]==20){
									if(l__g1[2]==-1){
										self.h_offset+=1;
										if(self.h_build_expr(0))return true;
										l_x=[gml_node.global_set,l_d,l_s,self.h_out_node];
										array_push(l_nodes,l_x);
									}
								}
								if(self.h_tokens[self.h_offset][0]==5){
									self.h_offset+=1;
									continue;
								}
							} else return self.h_error("Expected a global variable name.",l_tk2);
							break;
						}
						self.h_out_node=l_x1;
						break;
					case 2:
						var l_d=l__g;
						l_nodes=[];
						l_proc=true;
						while(l_proc&&self.h_offset<self.h_length){
							l_tk2=self.h_tokens[self.h_offset++];
							switch(l_tk2[0]){
								case gml_token.keyword:if(l_tk2[2]==2)var l_d1=l_tk2[1]; else return self.h_expect("a variable name",l_tk2);break;
								case gml_token.ident:
									if(self.h_offset>=self.h_length)return self.h_error_at("Expected a variable value",self.h_source.h_get_eof());
									l_tk=self.h_tokens[self.h_offset];
									if(l_tk[0]==20){
										if(l_tk[2]==-1){
											self.h_offset+=1;
											if(self.h_build_expr(0))return true;
										} else self.h_out_node=undefined;
									} else self.h_out_node=undefined;
									array_push(l_nodes,[gml_node.var_decl,l_tk2[1],l_tk2[2],self.h_out_node]);
									if(self.h_offset<self.h_length)switch(self.h_tokens[self.h_offset][0]){
										case gml_token.comma:self.h_offset+=1;break;
										case gml_token.semico:
											self.h_offset+=1;
											l_proc=false;
											break;
										default:l_proc=false;
									}
									break;
								default:return self.h_expect("a variable name",l_tk2);
							}
						}
						if(array_length(l_nodes)!=1)self.h_out_node=[gml_node.block,l_d,l_nodes]; else self.h_out_node=l_nodes[0];
						break;
					case 3:
						var l_e;
						var l__g1=self.h_tokens[self.h_offset];
						if(l__g1[0]==12){
							var l_d1=l__g1[1];
							var l_s1=l__g1[2];
							self.h_offset+=1;
							l_e=new gml_enum(l_s1,l_d1);
						} else return self.h_error("Expected an enum name",self.h_tokens[self.h_offset]);
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected enum block",self.h_source.h_get_eof());
						} else if(self.h_tokens[self.h_offset][0]==25){
							self.h_offset+=1;
						} else return self.h_error("Expected enum block",self.h_tokens[self.h_offset]);
						l_proc=true;
						l_sep=true;
						while(self.h_offset<self.h_length&&l_proc){
							var l__g1=self.h_tokens[self.h_offset];
							switch(l__g1[0]){
								case gml_token.cub_close:
									self.h_offset+=1;
									l_proc=false;
									break;
								case gml_token.comma:
									if(l_sep){
										return self.h_error("Unexpected comma",self.h_tokens[self.h_offset]);
									} else {
										self.h_offset+=1;
										l_sep=true;
									}
									break;
								case gml_token.ident:
									if(l_sep){
										self.h_offset+=1;
										var l__g3=self.h_tokens[self.h_offset];
										if(l__g3[0]==20){
											if(l__g3[2]==-1){
												self.h_offset+=1;
												if(self.h_build_expr(0))return true;
											} else self.h_out_node=undefined;
										} else self.h_out_node=undefined;
										var l_ec=new gml_enum_ctr(l__g1[2],l__g1[1],self.h_out_node);
										array_push(l_e.h_ctr_list,l_ec);
										variable_struct_set(l_e.h_ctr_map,l_ec.h_name,l_ec);
										l_sep=false;
									} else return self.h_expect("a comma or a closing bracket",self.h_tokens[self.h_offset]);
									break;
								default:return self.h_expect("a comma, enum entry, or closing bracket",self.h_tokens[self.h_offset]);
							}
						}
						if(l_proc)return self.h_error("Unclosed enum-block",l_tk);
						array_push(self.h_enums,l_e);
						self.h_out_node=[gml_node.block,l__g,[]];
						break;
					case 4:
						if(self.h_build_expr(0))return true;
						l_x1=self.h_out_node;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected a then-expression",self.h_source.h_get_eof());
						var l__g1=self.h_tokens[self.h_offset];
						if(l__g1[0]==11){
							if(l__g1[2]==5)self.h_offset+=1;
						}
						if(self.h_build_line())return true;
						l_x2=self.h_out_node;
						l_i=self.h_offset;
						if(self.h_offset<self.h_length){
							var l__g1=self.h_tokens[self.h_offset];
							if(l__g1[0]==11){
								if(l__g1[2]==6){
									self.h_offset+=1;
									if(self.h_build_line())return true;
									l_x=self.h_out_node;
								} else {
									self.h_offset=l_i;
									l_x=undefined;
								}
							} else {
								self.h_offset=l_i;
								l_x=undefined;
							}
						} else {
							self.h_offset=l_i;
							l_x=undefined;
						}
						self.h_out_node=[gml_node.if_then,l__g,l_x1,l_x2,l_x];
						break;
					case 7:
						var l_d=l__g;
						if(self.h_build_expr(0))return true;
						l_x1=self.h_out_node;
						var l_cc=[];
						var l_c=undefined;
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected switch-block body",self.h_source.h_get_eof());
						} else if(self.h_tokens[self.h_offset][0]==25){
							self.h_offset+=1;
						} else return self.h_error("Expected switch-block body",self.h_tokens[self.h_offset]);
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected switch-block contents",self.h_source.h_get_eof());
						var l__g1=self.h_tokens[self.h_offset];
						if(l__g1[0]==11)switch(l__g1[2]){
							case 8:case 9:break;
							default:return self.h_expect("`case` or `default`",self.h_tokens[self.h_offset]);
						} else return self.h_expect("`case` or `default`",self.h_tokens[self.h_offset]);
						l_proc=true;
						l_x2=undefined;
						l_nodes=undefined;
						var l_pre=[];
						while(self.h_offset<self.h_length&&l_proc){
							var l__g1=self.h_tokens[self.h_offset];
							switch(l__g1[0]){
								case gml_token.cub_close:
									self.h_offset+=1;
									l_proc=false;
									break;
								case gml_token.keyword:
									switch(l__g1[2]){
										case 8:
											self.h_offset+=1;
											if(self.h_build_expr(0))return true;
											if(self.h_offset>=self.h_length){
												return self.h_error_at("Expected a colon",self.h_source.h_get_eof());
											} else if(self.h_tokens[self.h_offset][0]==7){
												self.h_offset+=1;
											} else return self.h_error("Expected a colon",self.h_tokens[self.h_offset]);
											l_nodes=[self.h_out_node];
											while(self.h_offset<self.h_length){
												var l__g5=self.h_tokens[self.h_offset];
												if(l__g5[0]==11){
													if(l__g5[2]==8){
														self.h_offset+=1;
														if(self.h_build_expr(0))return true;
														if(self.h_offset>=self.h_length){
															return self.h_error_at("Expected a colon",self.h_source.h_get_eof());
														} else if(self.h_tokens[self.h_offset][0]==7){
															self.h_offset+=1;
														} else return self.h_error("Expected a colon",self.h_tokens[self.h_offset]);
														array_push(l_nodes,self.h_out_node);
														continue;
													}
												}
												break;
											}
											l_c={values:l_nodes,expr:undefined,pre:l_pre}
											array_push(l_cc,l_c);
											l_nodes=[];
											l_pre=[];
											l_c.expr=[gml_node.block,l__g1[1],l_nodes];
											break;
										case 9:
											self.h_offset+=1;
											if(self.h_offset>=self.h_length){
												return self.h_error_at("Expected a colon",self.h_source.h_get_eof());
											} else if(self.h_tokens[self.h_offset][0]==7){
												self.h_offset+=1;
											} else return self.h_error("Expected a colon",self.h_tokens[self.h_offset]);
											l_nodes=[];
											l_x2=[gml_node.block,l__g1[1],l_nodes];
											break;
										default:
											if(self.h_build_line())return true;
											array_push(l_nodes,self.h_out_node);
									}
									break;
								default:
									if(self.h_build_line())return true;
									array_push(l_nodes,self.h_out_node);
							}
						}
						if(l_proc)return self.h_error_at("Unclosed switch-block",l_d);
						self.h_out_node=[gml_node.switch_hx,l_d,l_x1,l_cc,l_x2];
						break;
					case 14:
						var l_d=l__g;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected for-loop header",self.h_source.h_get_eof());
						if(self.h_tokens[self.h_offset][0]==21){
							self.h_offset+=1;
							l_proc=true;
						} else l_proc=false;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected for-loop init",self.h_source.h_get_eof());
						if(self.h_tokens[self.h_offset][0]==4){
							self.h_offset+=1;
							l_x=[gml_node.block,l_d,[]];
						} else {
							if(self.h_build_line_inner(true))return true;
							l_x=self.h_out_node;
							if(self.h_tokens[self.h_offset][0]==4)self.h_offset+=1;
						}
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected for-loop condition",self.h_source.h_get_eof());
						if(self.h_tokens[self.h_offset][0]==4){
							self.h_offset+=1;
							l_x1=[gml_node.boolean,l_d,true];
						} else {
							if(self.h_build_expr(0))return true;
							l_x1=self.h_out_node;
							if(self.h_offset>=self.h_length)return self.h_error_at("Expected for-loop post-action",self.h_source.h_get_eof());
							if(self.h_tokens[self.h_offset][0]==4)self.h_offset+=1;
						}
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected for-loop post-action",self.h_source.h_get_eof());
						if(l_proc){
							if(self.h_tokens[self.h_offset][0]==22){
								self.h_offset+=1;
								l_proc=false;
								l_x2=[gml_node.block,l_d,[]];
							} else {
								if(self.h_build_line())return true;
								l_x2=self.h_out_node;
							}
						} else {
							if(self.h_build_line())return true;
							l_x2=self.h_out_node;
						}
						if(l_proc){
							if(self.h_tokens[self.h_offset][0]==22)self.h_offset+=1; else return self.h_expect("a closing parenthesis",self.h_tokens[self.h_offset]);
						}
						if(self.h_build_line())return true;
						self.h_out_node=[gml_node.for_hx,l_d,l_x,l_x1,l_x2,self.h_out_node];
						break;
					case 11:
						if(self.h_build_expr(0))return true;
						l_x1=self.h_out_node;
						if(self.h_build_line())return true;
						self.h_out_node=[gml_node.while_hx,l__g,l_x1,self.h_out_node];
						break;
					case 10:
						if(self.h_build_expr(0))return true;
						l_x1=self.h_out_node;
						if(self.h_build_line())return true;
						self.h_out_node=[gml_node.repeat_hx,l__g,l_x1,self.h_out_node];
						break;
					case 13:
						var l_d=l__g;
						if(self.h_build_line())return true;
						l_x1=self.h_out_node;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected a `while` or `until`",self.h_source.h_get_eof());
						var l__g1=self.h_tokens[self.h_offset];
						if(l__g1[0]==11)switch(l__g1[2]){
							case 11:
								self.h_offset+=1;
								if(self.h_build_expr(0))return true;
								self.h_out_node=[gml_node.do_while,l_d,l_x1,self.h_out_node];
								break;
							case 12:
								self.h_offset+=1;
								if(self.h_build_expr(0))return true;
								self.h_out_node=[gml_node.do_until,l_d,l_x1,self.h_out_node];
								break;
							default:return self.h_expect("a `while` or `until`",self.h_tokens[self.h_offset]);
						} else return self.h_expect("a `while` or `until`",self.h_tokens[self.h_offset]);
						break;
					case 15:
						if(self.h_build_expr(0))return true;
						l_x1=self.h_out_node;
						if(self.h_build_line())return true;
						self.h_out_node=[gml_node.with_hx,l__g,l_x1,self.h_out_node];
						break;
					case 17:self.h_out_node=[gml_node.break_hx,l__g];break;
					case 16:self.h_out_node=[gml_node.continue_hx,l__g];break;
					case 19:self.h_out_node=[gml_node.exit_hx,l__g];break;
					case 18:
						var l_d=l__g;
						if(self.h_offset<self.h_length){
							var l__g1=self.h_tokens[self.h_offset];
							switch(l__g1[0]){
								case gml_token.semico:self.h_out_node=[gml_node.exit_hx,l__g1[1]];break;
								case gml_token.cub_close:self.h_out_node=[gml_node.exit_hx,l__g1[1]];break;
								default:
									if(self.h_build_expr(0))return true;
									self.h_out_node=[gml_node.return_hx,l_d,self.h_out_node];
							}
						} else self.h_out_node=[gml_node.exit_hx,l_d];
						break;
					case 29:
						if(self.h_build_expr(0))return true;
						self.h_out_node=[gml_node.delete_hx,l__g,self.h_out_node];
						break;
					case 20:
						if(self.h_build_expr(0))return true;
						self.h_out_node=[gml_node.wait,l__g,self.h_out_node];
						break;
					case 28:self.h_out_node=[gml_node.debugger,l__g];break;
					case 21:
						if(self.h_build_line())return true;
						l_x1=self.h_out_node;
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected a catch-block",self.h_source.h_get_eof());
						} else {
							var l__g1=self.h_tokens[self.h_offset];
							if(l__g1[0]==11){
								if(l__g1[2]==22)self.h_offset+=1; else return self.h_error("Expected a catch-block",self.h_tokens[self.h_offset]);
							} else return self.h_error("Expected a catch-block",self.h_tokens[self.h_offset]);
						}
						if(self.h_tokens[self.h_offset][0]==21){
							self.h_offset+=1;
							l_proc=true;
						} else l_proc=false;
						if(self.h_offset>=self.h_length){
							return self.h_error_at("Expected a capture variable name",self.h_source.h_get_eof());
						} else {
							var l__g1=self.h_tokens[self.h_offset];
							if(l__g1[0]==12){
								self.h_offset+=1;
								l_s=l__g1[2];
							} else return self.h_error("Expected a capture variable name",self.h_tokens[self.h_offset]);
						}
						if(l_proc){
							if(self.h_offset>=self.h_length){
								return self.h_error_at("Expected a closing parenthesis",self.h_source.h_get_eof());
							} else if(self.h_tokens[self.h_offset][0]==22){
								self.h_offset+=1;
							} else return self.h_error("Expected a closing parenthesis",self.h_tokens[self.h_offset]);
						}
						if(self.h_build_line())return true;
						self.h_out_node=[gml_node.try_catch,l__g,l_x1,l_s,self.h_out_node];
						break;
					case 23:
						if(self.h_build_expr(0))return true;
						self.h_out_node=[gml_node.throw_hx,l__g,self.h_out_node];
						break;
					default:l_unknown=true;
				}
				break;
			case gml_token.macro_start:
				var l__g=self.h_tokens[self.h_offset++];
				if(l__g[0]==12){
					var l_s1=l__g[2];
					var l_add;
					if(self.h_tokens[self.h_offset][0]==7){
						self.h_offset+=1;
						l_add=l_s1==live_config;
						var l__g=self.h_tokens[self.h_offset++];
						if(l__g[0]==12)l_s1=l__g[2]; else return self.h_error("Expected a macro name",self.h_tokens[self.h_offset]);
					} else l_add=true;
					if(self.h_build_expr(0))return true;
					if(l_add){
						var l_i1=gml_std_gml_internal_ArrayImpl_indexOf(self.h_macro_names,l_s1);
						if(l_i1<0){
							l_i1=array_length(self.h_macro_names);
							self.h_macro_names[@l_i1]=l_s1;
						}
						self.h_macro_nodes[@l_i1]=new gml_macro(l_s1,self.h_out_node,true,gml_node_tools_is_statement(self.h_out_node));
					}
					self.h_out_node=[gml_node.block,l_tk[1],[]];
				} else return self.h_error("Expected a macro name",self.h_tokens[self.h_offset]);
				break;
			case gml_token.cub_open:
				var l_start=l_tk[1];
				if(!l_reqStatement)switch(self.h_tokens[self.h_offset][0]){
					case gml_token.cstring:
						self.h_offset-=1;
						return self.h_build_expr(0);
					case gml_token.ident:
						if(self.h_offset+1<self.h_length){
							if(self.h_tokens[self.h_offset+1][0]==7){
								self.h_offset-=1;
								return self.h_build_expr(0);
							}
						}
						break;
				}
				l_proc=true;
				l_nodes=[];
				while(l_proc&&self.h_offset<self.h_length){
					if(self.h_tokens[self.h_offset][0]==26){
						self.h_offset+=1;
						l_proc=false;
					} else {
						if(self.h_build_line())return true;
						array_push(l_nodes,self.h_out_node);
					}
				}
				if(l_proc)return self.h_error_at("Expected a closing bracket.",l_start);
				self.h_out_node=[gml_node.block,l_start,l_nodes];
				break;
			default:l_unknown=true;
		}
		if(l_unknown){
			self.h_offset-=1;
		} else {
			gml_builder_build_line_is_stat=true;
			gml_builder_build_line_is_expr=false;
		}
		if(l_unknown){
			var l_flags=4;
			if(l_reqStatement)l_flags|=1;
			if(self.h_build_expr(l_flags))return true;
			gml_builder_build_line_is_stat=gml_node_tools_is_statement(self.h_out_node);
			gml_builder_build_line_is_expr=true;
			if(l_reqStatement&&!gml_builder_build_line_is_stat)return self.h_expect_node("a statement",self.h_out_node);
		}
		return false;
	}
	static h_build_line=function(l_reqStatement){
		if(l_reqStatement==undefined)l_reqStatement=true;
		if(false)show_debug_message(argument[0]);
		if(self.h_build_line_inner(l_reqStatement))return true;
		while(self.h_offset<self.h_length){
			if(self.h_tokens[self.h_offset][0]==4){
				self.h_offset+=1;
				continue;
			}
			break;
		}
		return false;
	}
	static h_build_top_level_script=function(l_name,l_namedArgs,l_namedArgc,l_isFunc,l_prefixStatements){
		return self.h_build_top_level_script_body(self.h_add_script(l_name,l_namedArgs,l_namedArgc,l_isFunc,l_prefixStatements));
	}
	static h_add_script=function(l_name,l_namedArgs,l_namedArgc,l_isFunc,l_prefixStatements){
		var l_scr=new gml_script(self.h_source,l_name,(self.h_offset>=self.h_length?self.h_source.h_get_eof():self.h_tokens[self.h_offset][1]));
		if(l_namedArgs==undefined)l_namedArgs={}
		l_scr.h_named_args=l_namedArgs;
		l_scr.h_arguments=l_namedArgc;
		l_scr.h_is_function=l_isFunc;
		l_scr.h_prefix_statements=l_prefixStatements;
		array_push(self.h_scripts,l_scr);
		return l_scr;
	}
	static h_build_top_level_script_body=function(l_scr){
		if(compile_groups_gml_compile_group_static_has_statics){
			var l_fn=variable_struct_get(gml_func_map,l_scr.h_name);
			if(l_fn!=undefined)l_scr.h_script_id=l_fn.h_raw_func;
		}
		var l_prefixStatements=l_scr.h_prefix_statements;
		l_scr.h_prefix_statements=undefined;
		var l__scriptName=self.h_current_script;
		var l__scriptRef=self.h_current_script_ref;
		self.h_current_script=l_scr.h_name;
		self.h_current_script_ref=l_scr;
		var l_nodes;
		if(l_scr.h_is_function){
			if(self.h_build_line())return true;
			var l_scrNode=self.h_out_node;
			if(l_prefixStatements!=undefined){
				array_push(l_prefixStatements,l_scrNode);
				l_scrNode=[gml_node.block,gml_std_haxe_enum_tools_getParameter(l_scrNode,0),l_prefixStatements];
			}
			l_scr.h_node=l_scrNode;
			l_scr=self.h_scripts[0];
			var l__g=l_scr.h_node;
			if(l__g[0]==95)l_nodes=l__g[2]; else l_nodes=[l_scr.h_node];
		} else if(l_prefixStatements!=undefined){
			l_nodes=l_prefixStatements;
		} else l_nodes=[];
		while(self.h_offset<self.h_length){
			var l__g=self.h_tokens[self.h_offset];
			switch(l__g[0]){
				case gml_token.header:break;
				case gml_token.keyword:
					if(l__g[2]!=24){
						if(self.h_build_line())return true;
						array_push(l_nodes,self.h_out_node);
						continue;
					}
					break;
				default:
					if(self.h_build_line())return true;
					array_push(l_nodes,self.h_out_node);
					continue;
			}
			break;
		}
		if(array_length(l_nodes)>1){
			l_scr.h_node=[gml_node.block,gml_std_haxe_enum_tools_getParameter(l_nodes[0],0),l_nodes];
		} else if(array_length(l_nodes)==1){
			l_scr.h_node=l_nodes[0];
		} else l_scr.h_node=[gml_node.block,self.h_source.h_get_eof(),l_nodes];
		self.h_current_script=l__scriptName;
		self.h_current_script_ref=l__scriptRef;
		return false;
	}
	static h_build_script_args=function(){
		var l_nextArgs={}
		var l_nextArgc=0;
		var l_proc=true;
		var l_nextPrefix=undefined;
		if(self.h_offset>=self.h_length)return self.h_error_at("Expected script arguments",self.h_source.h_get_eof());
		var l__g=self.h_tokens[self.h_offset];
		if((l__g[0]==22)){
			self.h_offset+=1;
		} else while(l_proc&&self.h_offset<self.h_length){
			var l__g=self.h_tokens[self.h_offset];
			if(l__g[0]==12){
				var l_argName=l__g[2];
				var l_nextArg=l_argName;
				if(variable_struct_exists(l_nextArgs,l_nextArg))return self.h_error("An argument named "+l_nextArg+" is already defined at position "+gml_std_Std_stringify(variable_struct_get(l_nextArgs,l_nextArg)),self.h_tokens[self.h_offset]);
				var l_argIndex=l_nextArgc++;
				variable_struct_set(l_nextArgs,l_argName,l_argIndex);
				self.h_offset+=1;
				var l__g2=self.h_tokens[self.h_offset];
				if(l__g2[0]==20){
					if(l__g2[2]==-1){
						var l_defPos=l__g2[1];
						self.h_offset+=1;
						if(self.h_build_expr(0))return true;
						var l_ifNode=[gml_node.if_then,l_defPos,[gml_node.bin_op,l_defPos,64,[gml_node.arg_const,l_defPos,l_argIndex],[gml_node.undefined_hx,l_defPos]],[gml_node.set_op,l_defPos,-1,[gml_node.arg_const,l_defPos,l_argIndex],self.h_out_node],undefined];
						if(l_nextPrefix==undefined)l_nextPrefix=[];
						array_push(l_nextPrefix,l_ifNode);
					}
				}
				switch(self.h_tokens[self.h_offset][0]){
					case gml_token.par_close:
						self.h_offset+=1;
						l_proc=false;
						break;
					case gml_token.comma:self.h_offset+=1;break;
					default:return self.h_expect("a comma or closing parenthesis in script arguments",self.h_tokens[self.h_offset]);
				}
			} else return self.h_expect("an argument",self.h_tokens[self.h_offset]);
		}
		self.h_build_script_args_map=l_nextArgs;
		self.h_build_script_args_argc=l_nextArgc;
		self.h_build_script_args_prefix=l_nextPrefix;
		return false;
	}
	static h_build_script_args_prefix=undefined; /// @is {array<ast_GmlNode>}
	static h_build_script_args_map=undefined; /// @is {tools_Dictionary<int>}
	static h_build_script_args_argc=undefined; /// @is {int}
	static h_build_inherit=function(){
		if(self.h_offset>=self.h_length)return self.h_error_at("Expected a parent function name",self.h_source.h_get_eof());
		var l_tk=self.h_tokens[self.h_offset++];
		switch(l_tk[0]){
			case gml_token.ident:
				self.h_build_inherit_is_global=false;
				self.h_build_inherit_parent=l_tk[2];
				break;
			case gml_token.keyword:
				if(l_tk[2]==0){
					if(self.h_offset>=self.h_length){
						return self.h_error_at("Expected a `.` after `global.`",self.h_source.h_get_eof());
					} else if(self.h_tokens[self.h_offset][0]==6){
						self.h_offset+=1;
					} else return self.h_error("Expected a `.` after `global.`",self.h_tokens[self.h_offset]);
					if(self.h_offset>=self.h_length){
						return self.h_error_at("Expected a global variable name",self.h_source.h_get_eof());
					} else {
						var l__g=self.h_tokens[self.h_offset];
						if(l__g[0]==12){
							self.h_offset+=1;
							self.h_build_inherit_is_global=true;
							self.h_build_inherit_parent=l__g[2];
						} else return self.h_error("Expected a global variable name",self.h_tokens[self.h_offset]);
					}
				} else return self.h_expect("a parent function name",l_tk);
				break;
			default:return self.h_expect("a parent function name",l_tk);
		}
		if(self.h_offset>=self.h_length){
			return self.h_error_at("Expected an opening `(` for inheritance call",self.h_source.h_get_eof());
		} else if(self.h_tokens[self.h_offset][0]==21){
			self.h_offset+=1;
		} else return self.h_error("Expected an opening `(` for inheritance call",self.h_tokens[self.h_offset]);
		if(self.h_build_script_args())return true;
		return false;
	}
	static h_build_inherit_is_global=undefined; /// @is {bool}
	static h_build_inherit_parent=undefined; /// @is {string}
	static h_build_loop=function(l_first){
		if(self.h_build_top_level_script(l_first,undefined,0,false,undefined))return true;
		var l_hasFirstFunc=false;
		while(self.h_offset<self.h_length){
			var l_tk=self.h_tokens[self.h_offset];
			switch(l_tk[0]){
				case gml_token.header:
					self.h_offset+=1;
					var l_nextName=l_tk[2];
					var l_nextArgs=undefined;
					var l_nextArgc=0;
					var l_nextPrefix=undefined;
					if(!(l_tk[3]||self.h_offset>=self.h_length)){
						var l__g1=self.h_tokens[self.h_offset];
						if((l__g1[0]==21)){
							self.h_offset+=1;
							if(self.h_build_script_args())return true;
							l_nextArgs=self.h_build_script_args_map;
							l_nextArgc=self.h_build_script_args_argc;
							l_nextPrefix=self.h_build_script_args_prefix;
							self.h_build_script_args_map=undefined;
						}
					}
					if(self.h_build_top_level_script(l_nextName,l_nextArgs,l_nextArgc,false,l_nextPrefix))return true;
					break;
				case gml_token.keyword:
					if(l_tk[2]==24){
						self.h_offset+=1;
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected a function name",self.h_source.h_get_eof());
						var l_nextName1;
						l_tk=self.h_tokens[self.h_offset];
						if(l_tk[0]==12){
							l_nextName1=l_tk[2];
							self.h_offset+=1;
						} else if(l_hasFirstFunc){
							return self.h_expect("a function name",l_tk);
						} else {
							l_hasFirstFunc=true;
							l_nextName1=l_first;
						}
						if(self.h_offset>=self.h_length)return self.h_error_at("Expected an opening `(`",self.h_source.h_get_eof());
						l_tk=self.h_tokens[self.h_offset++];
						if(!(l_tk[0]==21))return self.h_expect("an opening `(`",l_tk);
						if(self.h_build_script_args())return true;
						var l_nextArgs1=self.h_build_script_args_map;
						self.h_build_script_args_map=undefined;
						var l_scr=self.h_add_script(l_nextName1,l_nextArgs1,self.h_build_script_args_argc,true,self.h_build_script_args_prefix);
						if(self.h_offset<self.h_length){
							l_tk=self.h_tokens[self.h_offset];
							if((l_tk[0]==7)){
								self.h_offset+=1;
								l_scr.h_is_constructor=true;
								if(self.h_build_inherit())return true;
								l_scr.h_parent_name=self.h_build_inherit_parent;
								l_scr.h_parent_is_global=self.h_build_inherit_is_global;
								l_scr.h_parent_argc=self.h_build_script_args_argc;
								self.h_build_script_args_map=undefined;
							} else {
								var l_tmp3;
								if(l_tk[0]==12)l_tmp3=l_tk[2]=="constructor"; else l_tmp3=false;
								if(l_tmp3){
									self.h_offset+=1;
									l_scr.h_is_constructor=true;
								}
							}
						}
						if(self.h_build_top_level_script_body(l_scr))return true;
					} else return self.h_expect("A script declaration",l_tk);
					break;
				default:return self.h_expect("A script declaration",l_tk);
			}
		}
		return false;
	}
	static h_program=undefined; /// @is {gml_program}
	self.h_build_inherit_parent=undefined;
	self.h_build_inherit_is_global=false;
	self.h_build_script_args_argc=0;
	self.h_build_script_args_map=undefined;
	self.h_build_script_args_prefix=[];
	self.h_current_script_ref=undefined;
	self.h_current_script=undefined;
	self.h_error_text=undefined;
	self.h_global_vars=[];
	self.h_macro_nodes=[];
	self.h_macro_names=[];
	self.h_enums=[];
	self.h_scripts=[];
	self.h_offset=0;
	self.h_program=l_pg;
	self.h_source=l_src;
	var l_parser=l_src.h_parser;
	if(l_parser!=undefined&&l_parser.h_tokens!=undefined){
		self.h_tokens=l_parser.h_tokens;
		self.h_length=l_parser.h_token_count;
	} else {
		l_parser=new gml_parser(l_src);
		l_src.h_parser=l_parser;
		self.h_tokens=l_parser.h_run();
		if(self.h_tokens!=undefined){
			self.h_length=l_parser.h_token_count;
		} else {
			self.h_error_text=gml_parser_error_text;
			self.h_error_pos=gml_parser_error_pos;
		}
	}
	static __class__=mt_gml_builder;
}

if(live_enabled)
function gml_std_Type_getEnumConstructs(l_e){
	// gml_std_Type_getEnumConstructs(e:Enum<any>)->array<string>
	/// @ignore
	return gml_std_gml_internal_ArrayImpl_copy(l_e.h_constructors);
}

if(live_enabled)
function gml_std_Type_enumConstructor(l_e){
	// gml_std_Type_enumConstructor(e:any)->string
	/// @ignore
	var l_et,l_i;
	var l_isStruct1=is_struct(l_e);
	if(l_isStruct1){
		l_et=l_e.__enum__;
		l_i=l_e.__enumIndex__;
	} else return string(l_e);
	var l_cs=l_et.h_constructors;
	if(l_cs!=undefined&&l_i>=0&&l_i<array_length(l_cs)){
		return l_cs[l_i];
	} else {
		if(l_isStruct1){
			var l_s=instanceof(l_e);
			if(string_copy(l_s,1,3)=="mc_")l_s=string_delete(l_s,1,3);
			l_i=string_length(l_et.h_name);
			if(string_copy(l_s,1,l_i)==l_et.h_name&&string_ord_at(l_s,l_i+1)==95)l_s=string_delete(l_s,1,l_i+1);
			return l_s;
		}
		return string(l_e);
	}
}

if(live_enabled)
function gml_std_Type_enumParameters(l_e){
	// gml_std_Type_enumParameters(e:any)->array<any>
	/// @ignore
	var l_n,l_r;
	if(is_struct(l_e)){
		var l_fields=l_e.__enumParams__;
		l_n=array_length(l_fields);
		l_r=array_create(l_n);
		var l_i=-1;
		while(++l_i<l_n){
			l_r[@l_i]=variable_struct_get(l_e,l_fields[l_i]);
		}
		return l_r;
	}
	if(is_array(l_e)){
		var l_m=l_e;
		l_n=array_length(l_m)-1;
		l_r=array_create(l_n);
		array_copy(l_r,0,l_m,1,l_n);
		return l_r;
	} else return [];
}

if(live_enabled)
function gml_std_Type_enumIndex(l_e){
	// gml_std_Type_enumIndex(e:any)->int
	/// @ignore
	if(is_struct(l_e)){
		return l_e.__enumIndex__;
	} else if(is_array(l_e)){
		return l_e[0];
	} else return l_e;
}

if(live_enabled)
function gml_std_StringTools_startsWith(l_s,l_start){
	// gml_std_StringTools_startsWith(s:string, start:string)->bool
	/// @ignore
	var l_n=string_length(l_start);
	return string_length(l_s)>=l_n&&string_copy(l_s,1,l_n)==l_start;
}

if(live_enabled)
function gml_std_StringTools_endsWith(l_s,l_end){
	// gml_std_StringTools_endsWith(s:string, end:string)->bool
	/// @ignore
	var l_n=string_length(l_s);
	var l_i=string_length(l_end);
	return l_n>=l_i&&string_copy(l_s,l_n+1-l_i,l_i)==l_end;
}

if(live_enabled)
function gml_std_StringTools_trim(l_s){
	// gml_std_StringTools_trim(s:string)->string
	/// @ignore
	var l_char;
	var l_len=string_length(l_s);
	var l_till=l_len;
	while(l_till>0){
		l_char=string_ord_at(l_s,l_till);
		if(l_char==32||l_char>8&&l_char<14)l_till--; else break;
	}
	if(l_till<l_len)l_s=string_copy(l_s,1,l_till);
	var l_start=1;
	while(l_start<=l_till){
		l_char=string_ord_at(l_s,l_start);
		if(l_char==32||l_char>8&&l_char<14)l_start++; else break;
	}
	if(l_start>1)l_s=string_delete(l_s,1,l_start-1);
	return l_s;
}

if(live_enabled)
function compile_groups_gml_compile_group_literal_proc_lf(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_literal_proc_lf(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_instStack=l_scope[6];
	var l_inst=l_instStack[l_instStack[0]];
	if(instanceof(l_inst)=="instance")l_inst=l_inst.id;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_inst;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_literal_proc_lf1(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_literal_proc_lf1(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_instStack=l_scope[6];
	var l_inst=l_instStack[l_instStack[0]-1];
	if(instanceof(l_inst)=="instance")l_inst=l_inst.id;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_inst;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_literal_proc(l_q,l_actions,l_out){
	// compile_groups_gml_compile_group_literal_proc(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.undefined_hx:if(l_out)ds_list_add(l_actions,gml_action_undefined_hx(l__g[1]));break;
		case gml_node.number:if(l_out)ds_list_add(l_actions,gml_action_number(l__g[1],l__g[2]));break;
		case gml_node.cstring:if(l_out)ds_list_add(l_actions,gml_action_cstring(l__g[1],l__g[2]));break;
		case gml_node.boolean:if(l_out)ds_list_add(l_actions,gml_action_const(l__g[1],bool(l__g[2])));break;
		case gml_node.const:if(l_out)ds_list_add(l_actions,gml_action_const(l__g[1],variable_struct_get(gml_const_val,l__g[2])));break;
		case gml_node.other_const:if(l_out)ds_list_add(l_actions,gml_action_const(l__g[1],l__g[2]));break;
		case gml_node.self_hx:
			var l_d=l__g[1];
			if(l_out){
				if(gml_compile_curr_program.h_get_source(l_d[0]).h_version.h_int_self)ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self",{},compile_groups_gml_compile_group_literal_proc_lf)); else ds_list_add(l_actions,gml_action_self_hx(l_d));
			}
			break;
		case gml_node.other_hx:
			var l_d=l__g[1];
			if(l_out){
				if(gml_compile_curr_program.h_get_source(l_d[0]).h_version.h_int_self)ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"other",{},compile_groups_gml_compile_group_literal_proc_lf1)); else ds_list_add(l_actions,gml_action_other_hx(l_d));
			}
			break;
		case gml_node.global_ref:if(l_out)ds_list_add(l_actions,gml_action_number(l__g[1],-5));break;
		case gml_node.script:ds_list_add(l_actions,gml_action_func_literal(l__g[1],l__g[2].h_name,false));break;
		case gml_node.native_script:ds_list_add(l_actions,gml_action_const(l__g[1],l__g[3]));break;
		case gml_node.array_decl:
			var l_w=l__g[2];
			compile_gml_compile_args_proc(l_actions,l_w);
			ds_list_add(l_actions,gml_action_array_decl(l__g[1],array_length(l_w)));
			break;
		case gml_node.object_decl:
			var l_w=l__g[3];
			var l_fields=[];
			for(var l_i=0,l__g2=array_length(l_w);l_i<l__g2;l_i++){
				var l_x=l_w[l_i];
				if(gml_compile_node(l_w[l_i],l_actions,true))return true;
				var l__g3=l_x;
				var l_bindFunc;
				l_bindFunc=(l__g3[0]==32);
				array_push(l_fields,{name:l__g[2][l_i],bindFunc:l_bindFunc});
			}
			ds_list_add(l_actions,gml_action_object_decl(l__g[1],l_fields));
			break;
		default:return undefined;
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_literal_init(){
	// compile_groups_gml_compile_group_literal_init()
	/// @ignore
	gml_compile_set_handlers(compile_groups_gml_compile_group_literal_proc,["undefined","number","cstring","const","other_const","boolean","self","other","global_ref","script","native_script","array_decl","object_decl"]);
}

if(live_enabled)/// @interface {gml_action}
function mc_gml_action()constructor{
	/// @hint {array} gml_action:__enumParams__
	/// @hint {int} gml_action:__enumIndex__
	static getIndex=method(undefined,gml_std_enum_getIndex);
	static toString=method(undefined,gml_std_enum_toString);
	static __enum__=mt_gml_action;
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_discard():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=0;
}

if(live_enabled)
function gml_action_discard(l_h_d){
	// gml_action_discard(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_discard();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_dup():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=1;
}

if(live_enabled)
function gml_action_dup(l_h_d){
	// gml_action_dup(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_dup();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_dup2x():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=2;
}

if(live_enabled)
function gml_action_dup2x(l_h_d){
	// gml_action_dup2x(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_dup2x();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_dup3x():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=3;
}

if(live_enabled)
function gml_action_dup3x(l_h_d){
	// gml_action_dup3x(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_dup3x();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_dup_in():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_z
	static __enumParams__=["h_d","h_z"];
	static __enumIndex__=4;
}

if(live_enabled)
function gml_action_dup_in(l_h_d,l_h_z){
	// gml_action_dup_in(h_d:gml_pos, h_z:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_dup_in();
	l_this.h_d=l_h_d;
	l_this.h_z=l_h_z;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_undefined_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=5;
}

if(live_enabled)
function gml_action_undefined_hx(l_h_d){
	// gml_action_undefined_hx(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_undefined_hx();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_number():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {number} :h_f
	static __enumParams__=["h_d","h_f"];
	static __enumIndex__=6;
}

if(live_enabled)
function gml_action_number(l_h_d,l_h_f){
	// gml_action_number(h_d:gml_pos, h_f:number)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_number();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_cstring():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_s
	static __enumParams__=["h_d","h_s"];
	static __enumIndex__=7;
}

if(live_enabled)
function gml_action_cstring(l_h_d,l_h_s){
	// gml_action_cstring(h_d:gml_pos, h_s:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_cstring();
	l_this.h_d=l_h_d;
	l_this.h_s=l_h_s;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_array_decl():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_size
	static __enumParams__=["h_d","h_size"];
	static __enumIndex__=8;
}

if(live_enabled)
function gml_action_array_decl(l_h_d,l_h_size){
	// gml_action_array_decl(h_d:gml_pos, h_size:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_array_decl();
	l_this.h_d=l_h_d;
	l_this.h_size=l_h_size;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_object_decl():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {array<any>} :h_fields
	static __enumParams__=["h_d","h_fields"];
	static __enumIndex__=9;
}

if(live_enabled)
function gml_action_object_decl(l_h_d,l_h_fields){
	// gml_action_object_decl(h_d:gml_pos, h_fields:array<any>)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_object_decl();
	l_this.h_d=l_h_d;
	l_this.h_fields=l_h_fields;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_const():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_v
	static __enumParams__=["h_d","h_v"];
	static __enumIndex__=10;
}

if(live_enabled)
function gml_action_const(l_h_d,l_h_v){
	// gml_action_const(h_d:gml_pos, h_v:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_const();
	l_this.h_d=l_h_d;
	l_this.h_v=l_h_v;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_self_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=11;
}

if(live_enabled)
function gml_action_self_hx(l_h_d){
	// gml_action_self_hx(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_self_hx();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_other_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=12;
}

if(live_enabled)
function gml_action_other_hx(l_h_d){
	// gml_action_other_hx(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_other_hx();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_local_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_i
	/// @hint {string} :h_name
	static __enumParams__=["h_d","h_i","h_name"];
	static __enumIndex__=13;
}

if(live_enabled)
function gml_action_local_hx(l_h_d,l_h_i,l_h_name){
	// gml_action_local_hx(h_d:gml_pos, h_i:int, h_name:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_local_hx();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	l_this.h_name=l_h_name;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_local_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_i
	/// @hint {string} :h_name
	static __enumParams__=["h_d","h_i","h_name"];
	static __enumIndex__=14;
}

if(live_enabled)
function gml_action_local_set(l_h_d,l_h_i,l_h_name){
	// gml_action_local_set(h_d:gml_pos, h_i:int, h_name:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_local_set();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	l_this.h_name=l_h_name;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_local_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {int} :h_i
	/// @hint {string} :h_name
	static __enumParams__=["h_d","h_o","h_i","h_name"];
	static __enumIndex__=15;
}

if(live_enabled)
function gml_action_local_aop(l_h_d,l_h_o,l_h_i,l_h_name){
	// gml_action_local_aop(h_d:gml_pos, h_o:gml_op, h_i:int, h_name:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_local_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_i=l_h_i;
	l_this.h_name=l_h_name;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_global_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_fd"];
	static __enumIndex__=16;
}

if(live_enabled)
function gml_action_global_hx(l_h_d,l_h_fd){
	// gml_action_global_hx(h_d:gml_pos, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_global_hx();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_global_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_fd"];
	static __enumIndex__=17;
}

if(live_enabled)
function gml_action_global_set(l_h_d,l_h_fd){
	// gml_action_global_set(h_d:gml_pos, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_global_set();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_global_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_o","h_fd"];
	static __enumIndex__=18;
}

if(live_enabled)
function gml_action_global_aop(l_h_d,l_h_o,l_h_fd){
	// gml_action_global_aop(h_d:gml_pos, h_o:gml_op, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_global_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_fd"];
	static __enumIndex__=19;
}

if(live_enabled)
function gml_action_field(l_h_d,l_h_fd){
	// gml_action_field(h_d:gml_pos, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_field();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_field_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_fd"];
	static __enumIndex__=20;
}

if(live_enabled)
function gml_action_field_set(l_h_d,l_h_fd){
	// gml_action_field_set(h_d:gml_pos, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_field_set();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_field_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_o","h_fd"];
	static __enumIndex__=21;
}

if(live_enabled)
function gml_action_field_aop(l_h_d,l_h_o,l_h_fd){
	// gml_action_field_aop(h_d:gml_pos, h_o:gml_op, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_field_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {api_ApiFastFieldGetter} :h_getter
	/// @hint {api_ApiFastFieldSetter} :h_setter
	static __enumParams__=["h_d","h_o","h_getter","h_setter"];
	static __enumIndex__=22;
}

if(live_enabled)
function gml_action_fast_field_aop(l_h_d,l_h_o,l_h_getter,l_h_setter){
	// gml_action_fast_field_aop(h_d:gml_pos, h_o:gml_op, h_getter:api_ApiFastFieldGetter, h_setter:api_ApiFastFieldSetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_getter=l_h_getter;
	l_this.h_setter=l_h_setter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_self_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_fd"];
	static __enumIndex__=23;
}

if(live_enabled)
function gml_action_self_field(l_h_d,l_h_fd){
	// gml_action_self_field(h_d:gml_pos, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_self_field();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_self_field_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_fd"];
	static __enumIndex__=24;
}

if(live_enabled)
function gml_action_self_field_set(l_h_d,l_h_fd){
	// gml_action_self_field_set(h_d:gml_pos, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_self_field_set();
	l_this.h_d=l_h_d;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_self_field_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_o","h_fd"];
	static __enumIndex__=25;
}

if(live_enabled)
function gml_action_self_field_aop(l_h_d,l_h_o,l_h_fd){
	// gml_action_self_field_aop(h_d:gml_pos, h_o:gml_op, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_self_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_self_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {api_ApiFastFieldGetter} :h_getter
	static __enumParams__=["h_d","h_getter"];
	static __enumIndex__=26;
}

if(live_enabled)
function gml_action_fast_self_field(l_h_d,l_h_getter){
	// gml_action_fast_self_field(h_d:gml_pos, h_getter:api_ApiFastFieldGetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_self_field();
	l_this.h_d=l_h_d;
	l_this.h_getter=l_h_getter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_self_field_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {api_ApiFastFieldSetter} :h_setter
	static __enumParams__=["h_d","h_setter"];
	static __enumIndex__=27;
}

if(live_enabled)
function gml_action_fast_self_field_set(l_h_d,l_h_setter){
	// gml_action_fast_self_field_set(h_d:gml_pos, h_setter:api_ApiFastFieldSetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_self_field_set();
	l_this.h_d=l_h_d;
	l_this.h_setter=l_h_setter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_self_field_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {api_ApiFastFieldGetter} :h_getter
	/// @hint {api_ApiFastFieldSetter} :h_setter
	static __enumParams__=["h_d","h_o","h_getter","h_setter"];
	static __enumIndex__=28;
}

if(live_enabled)
function gml_action_fast_self_field_aop(l_h_d,l_h_o,l_h_getter,l_h_setter){
	// gml_action_fast_self_field_aop(h_d:gml_pos, h_o:gml_op, h_getter:api_ApiFastFieldGetter, h_setter:api_ApiFastFieldSetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_self_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_getter=l_h_getter;
	l_this.h_setter=l_h_setter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_local_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_localIndex
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_localIndex","h_fd"];
	static __enumIndex__=29;
}

if(live_enabled)
function gml_action_local_field(l_h_d,l_h_localIndex,l_h_fd){
	// gml_action_local_field(h_d:gml_pos, h_localIndex:int, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_local_field();
	l_this.h_d=l_h_d;
	l_this.h_localIndex=l_h_localIndex;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_local_field_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_localIndex
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_localIndex","h_fd"];
	static __enumIndex__=30;
}

if(live_enabled)
function gml_action_local_field_set(l_h_d,l_h_localIndex,l_h_fd){
	// gml_action_local_field_set(h_d:gml_pos, h_localIndex:int, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_local_field_set();
	l_this.h_d=l_h_d;
	l_this.h_localIndex=l_h_localIndex;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_local_field_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_localIndex
	/// @hint {gml_op} :h_o
	/// @hint {string} :h_fd
	static __enumParams__=["h_d","h_localIndex","h_o","h_fd"];
	static __enumIndex__=31;
}

if(live_enabled)
function gml_action_local_field_aop(l_h_d,l_h_localIndex,l_h_o,l_h_fd){
	// gml_action_local_field_aop(h_d:gml_pos, h_localIndex:int, h_o:gml_op, h_fd:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_local_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_localIndex=l_h_localIndex;
	l_this.h_o=l_h_o;
	l_this.h_fd=l_h_fd;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_local_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_localIndex
	/// @hint {api_ApiFastFieldGetter} :h_getter
	static __enumParams__=["h_d","h_localIndex","h_getter"];
	static __enumIndex__=32;
}

if(live_enabled)
function gml_action_fast_local_field(l_h_d,l_h_localIndex,l_h_getter){
	// gml_action_fast_local_field(h_d:gml_pos, h_localIndex:int, h_getter:api_ApiFastFieldGetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_local_field();
	l_this.h_d=l_h_d;
	l_this.h_localIndex=l_h_localIndex;
	l_this.h_getter=l_h_getter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_local_field_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_localIndex
	/// @hint {api_ApiFastFieldSetter} :h_setter
	static __enumParams__=["h_d","h_localIndex","h_setter"];
	static __enumIndex__=33;
}

if(live_enabled)
function gml_action_fast_local_field_set(l_h_d,l_h_localIndex,l_h_setter){
	// gml_action_fast_local_field_set(h_d:gml_pos, h_localIndex:int, h_setter:api_ApiFastFieldSetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_local_field_set();
	l_this.h_d=l_h_d;
	l_this.h_localIndex=l_h_localIndex;
	l_this.h_setter=l_h_setter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fast_local_field_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_localIndex
	/// @hint {gml_op} :h_o
	/// @hint {api_ApiFastFieldGetter} :h_getter
	/// @hint {api_ApiFastFieldSetter} :h_setter
	static __enumParams__=["h_d","h_localIndex","h_o","h_getter","h_setter"];
	static __enumIndex__=34;
}

if(live_enabled)
function gml_action_fast_local_field_aop(l_h_d,l_h_localIndex,l_h_o,l_h_getter,l_h_setter){
	// gml_action_fast_local_field_aop(h_d:gml_pos, h_localIndex:int, h_o:gml_op, h_getter:api_ApiFastFieldGetter, h_setter:api_ApiFastFieldSetter)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fast_local_field_aop();
	l_this.h_d=l_h_d;
	l_this.h_localIndex=l_h_localIndex;
	l_this.h_o=l_h_o;
	l_this.h_getter=l_h_getter;
	l_this.h_setter=l_h_setter;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_index():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=35;
}

if(live_enabled)
function gml_action_index(l_h_d){
	// gml_action_index(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_index();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_index_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=36;
}

if(live_enabled)
function gml_action_index_set(l_h_d){
	// gml_action_index_set(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_index_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_index_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	static __enumParams__=["h_d","h_o"];
	static __enumIndex__=37;
}

if(live_enabled)
function gml_action_index_aop(l_h_d,l_h_o){
	// gml_action_index_aop(h_d:gml_pos, h_o:gml_op)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_index_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_index2d():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=38;
}

if(live_enabled)
function gml_action_index2d(l_h_d){
	// gml_action_index2d(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_index2d();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_index2d_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=39;
}

if(live_enabled)
function gml_action_index2d_set(l_h_d){
	// gml_action_index2d_set(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_index2d_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_index2d_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	static __enumParams__=["h_d","h_o"];
	static __enumIndex__=40;
}

if(live_enabled)
function gml_action_index2d_aop(l_h_d,l_h_o){
	// gml_action_index2d_aop(h_d:gml_pos, h_o:gml_op)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_index2d_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_env():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_f
	static __enumParams__=["h_d","h_f"];
	static __enumIndex__=41;
}

if(live_enabled)
function gml_action_env(l_h_d,l_h_f){
	// gml_action_env(h_d:gml_pos, h_f:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_env();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_env_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_f
	/// @hint {gml_type_check} :h_ch
	static __enumParams__=["h_d","h_f","h_ch"];
	static __enumIndex__=42;
}

if(live_enabled)
function gml_action_env_set(l_h_d,l_h_f,l_h_ch){
	// gml_action_env_set(h_d:gml_pos, h_f:any, h_ch:gml_type_check)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_env_set();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	l_this.h_ch=l_h_ch;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_env_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {any} :h_f
	static __enumParams__=["h_d","h_o","h_f"];
	static __enumIndex__=43;
}

if(live_enabled)
function gml_action_env_aop(l_h_d,l_h_o,l_h_f){
	// gml_action_env_aop(h_d:gml_pos, h_o:gml_op, h_f:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_env_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_env1d():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_f
	static __enumParams__=["h_d","h_f"];
	static __enumIndex__=44;
}

if(live_enabled)
function gml_action_env1d(l_h_d,l_h_f){
	// gml_action_env1d(h_d:gml_pos, h_f:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_env1d();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_env1d_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_f
	/// @hint {gml_type_check} :h_ch
	static __enumParams__=["h_d","h_f","h_ch"];
	static __enumIndex__=45;
}

if(live_enabled)
function gml_action_env1d_set(l_h_d,l_h_f,l_h_ch){
	// gml_action_env1d_set(h_d:gml_pos, h_f:any, h_ch:gml_type_check)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_env1d_set();
	l_this.h_d=l_h_d;
	l_this.h_f=l_h_f;
	l_this.h_ch=l_h_ch;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_env1d_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {any} :h_f
	static __enumParams__=["h_d","h_o","h_f"];
	static __enumIndex__=46;
}

if(live_enabled)
function gml_action_env1d_aop(l_h_d,l_h_o,l_h_f){
	// gml_action_env1d_aop(h_d:gml_pos, h_o:gml_op, h_f:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_env1d_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_f=l_h_f;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_ds_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {int} :h_argc
	/// @hint {any} :h_get
	/// @hint {any} :h_set
	/// @hint {bool} :h_out
	static __enumParams__=["h_d","h_o","h_argc","h_get","h_set","h_out"];
	static __enumIndex__=47;
}

if(live_enabled)
function gml_action_ds_aop(l_h_d,l_h_o,l_h_argc,l_h_get,l_h_set,l_h_out){
	// gml_action_ds_aop(h_d:gml_pos, h_o:gml_op, h_argc:int, h_get:any, h_set:any, h_out:bool)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_ds_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_argc=l_h_argc;
	l_this.h_get=l_h_get;
	l_this.h_set=l_h_set;
	l_this.h_out=l_h_out;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_const():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_i
	static __enumParams__=["h_d","h_i"];
	static __enumIndex__=48;
}

if(live_enabled)
function gml_action_arg_const(l_h_d,l_h_i){
	// gml_action_arg_const(h_d:gml_pos, h_i:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_const();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_const_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_i
	static __enumParams__=["h_d","h_i"];
	static __enumIndex__=49;
}

if(live_enabled)
function gml_action_arg_const_set(l_h_d,l_h_i){
	// gml_action_arg_const_set(h_d:gml_pos, h_i:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_const_set();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_const_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	/// @hint {int} :h_i
	static __enumParams__=["h_d","h_o","h_i"];
	static __enumIndex__=50;
}

if(live_enabled)
function gml_action_arg_const_aop(l_h_d,l_h_o,l_h_i){
	// gml_action_arg_const_aop(h_d:gml_pos, h_o:gml_op, h_i:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_const_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_index():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=51;
}

if(live_enabled)
function gml_action_arg_index(l_h_d){
	// gml_action_arg_index(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_index();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_index_set():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=52;
}

if(live_enabled)
function gml_action_arg_index_set(l_h_d){
	// gml_action_arg_index_set(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_index_set();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_index_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	static __enumParams__=["h_d","h_o"];
	static __enumIndex__=53;
}

if(live_enabled)
function gml_action_arg_index_aop(l_h_d,l_h_o){
	// gml_action_arg_index_aop(h_d:gml_pos, h_o:gml_op)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_index_aop();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_arg_count():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=54;
}

if(live_enabled)
function gml_action_arg_count(l_h_d){
	// gml_action_arg_count(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_arg_count();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_add_int():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_i
	static __enumParams__=["h_d","h_i"];
	static __enumIndex__=55;
}

if(live_enabled)
function gml_action_add_int(l_h_d,l_h_i){
	// gml_action_add_int(h_d:gml_pos, h_i:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_add_int();
	l_this.h_d=l_h_d;
	l_this.h_i=l_h_i;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_equ_op():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=56;
}

if(live_enabled)
function gml_action_equ_op(l_h_d){
	// gml_action_equ_op(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_equ_op();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_neq_op():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=57;
}

if(live_enabled)
function gml_action_neq_op(l_h_d){
	// gml_action_neq_op(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_neq_op();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_concat():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=58;
}

if(live_enabled)
function gml_action_concat(l_h_d){
	// gml_action_concat(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_concat();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_bin_op():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_o
	static __enumParams__=["h_d","h_o"];
	static __enumIndex__=59;
}

if(live_enabled)
function gml_action_bin_op(l_h_d,l_h_o){
	// gml_action_bin_op(h_d:gml_pos, h_o:gml_op)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_bin_op();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_un_op():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {ast_GmlUnOp} :h_o
	static __enumParams__=["h_d","h_o"];
	static __enumIndex__=60;
}

if(live_enabled)
function gml_action_un_op(l_h_d,l_h_o){
	// gml_action_un_op(h_d:gml_pos, h_o:ast_GmlUnOp)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_un_op();
	l_this.h_d=l_h_d;
	l_this.h_o=l_h_o;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_in():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {bool} :h_not
	static __enumParams__=["h_d","h_not"];
	static __enumIndex__=61;
}

if(live_enabled)
function gml_action_in(l_h_d,l_h_not){
	// gml_action_in(h_d:gml_pos, h_not:bool)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_in();
	l_this.h_d=l_h_d;
	l_this.h_not=l_h_not;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_in_const():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_field
	/// @hint {bool} :h_not
	static __enumParams__=["h_d","h_field","h_not"];
	static __enumIndex__=62;
}

if(live_enabled)
function gml_action_in_const(l_h_d,l_h_field,l_h_not){
	// gml_action_in_const(h_d:gml_pos, h_field:string, h_not:bool)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_in_const();
	l_this.h_d=l_h_d;
	l_this.h_field=l_h_field;
	l_this.h_not=l_h_not;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_script():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_script} :h_script
	/// @hint {int} :h_argc
	static __enumParams__=["h_d","h_script","h_argc"];
	static __enumIndex__=63;
}

if(live_enabled)
function gml_action_call_script(l_h_d,l_h_script,l_h_argc){
	// gml_action_call_script(h_d:gml_pos, h_script:gml_script, h_argc:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_script();
	l_this.h_d=l_h_d;
	l_this.h_script=l_h_script;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_script_id():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_argc
	static __enumParams__=["h_d","h_argc"];
	static __enumIndex__=64;
}

if(live_enabled)
function gml_action_call_script_id(l_h_d,l_h_argc){
	// gml_action_call_script_id(h_d:gml_pos, h_argc:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_script_id();
	l_this.h_d=l_h_d;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_script_with_array():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=65;
}

if(live_enabled)
function gml_action_call_script_with_array(l_h_d){
	// gml_action_call_script_with_array(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_script_with_array();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_argc
	/// @hint {array<gml_type_check>} :h_args
	/// @hint {gml_type_check} :h_rest
	/// @hint {data_GmlFuncFlags} :h_inst
	/// @hint {bool} :h_out
	static __enumParams__=["h_d","h_func","h_argc","h_args","h_rest","h_inst","h_out"];
	static __enumIndex__=66;
}

if(live_enabled)
function gml_action_call_func(l_h_d,l_h_func,l_h_argc,l_h_args,l_h_rest,l_h_inst,l_h_out){
	// gml_action_call_func(h_d:gml_pos, h_func:any, h_argc:int, h_args:array<gml_type_check>, h_rest:gml_type_check, h_inst:data_GmlFuncFlags, h_out:bool)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_argc=l_h_argc;
	l_this.h_args=l_h_args;
	l_this.h_rest=l_h_rest;
	l_this.h_inst=l_h_inst;
	l_this.h_out=l_h_out;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func0():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=67;
}

if(live_enabled)
function gml_action_call_func0(l_h_d,l_h_func){
	// gml_action_call_func0(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func0();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func0o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=68;
}

if(live_enabled)
function gml_action_call_func0o(l_h_d,l_h_func){
	// gml_action_call_func0o(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func0o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func1():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=69;
}

if(live_enabled)
function gml_action_call_func1(l_h_d,l_h_func){
	// gml_action_call_func1(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func1();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func1o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=70;
}

if(live_enabled)
function gml_action_call_func1o(l_h_d,l_h_func){
	// gml_action_call_func1o(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func1o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func2():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=71;
}

if(live_enabled)
function gml_action_call_func2(l_h_d,l_h_func){
	// gml_action_call_func2(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func2();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func2o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=72;
}

if(live_enabled)
function gml_action_call_func2o(l_h_d,l_h_func){
	// gml_action_call_func2o(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func2o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func3():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=73;
}

if(live_enabled)
function gml_action_call_func3(l_h_d,l_h_func){
	// gml_action_call_func3(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func3();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func3o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=74;
}

if(live_enabled)
function gml_action_call_func3o(l_h_d,l_h_func){
	// gml_action_call_func3o(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func3o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func4():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=75;
}

if(live_enabled)
function gml_action_call_func4(l_h_d,l_h_func){
	// gml_action_call_func4(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func4();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func4o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	static __enumParams__=["h_d","h_func"];
	static __enumIndex__=76;
}

if(live_enabled)
function gml_action_call_func4o(l_h_d,l_h_func){
	// gml_action_call_func4o(h_d:gml_pos, h_func:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func4o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local0():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=77;
}

if(live_enabled)
function gml_action_call_func_with_local0(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local0(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local0();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local0o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=78;
}

if(live_enabled)
function gml_action_call_func_with_local0o(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local0o(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local0o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local1():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=79;
}

if(live_enabled)
function gml_action_call_func_with_local1(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local1(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local1();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local1o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=80;
}

if(live_enabled)
function gml_action_call_func_with_local1o(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local1o(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local1o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local2():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=81;
}

if(live_enabled)
function gml_action_call_func_with_local2(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local2(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local2();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local2o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=82;
}

if(live_enabled)
function gml_action_call_func_with_local2o(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local2o(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local2o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local3():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=83;
}

if(live_enabled)
function gml_action_call_func_with_local3(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local3(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local3();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local3o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=84;
}

if(live_enabled)
function gml_action_call_func_with_local3o(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local3o(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local3o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local4():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=85;
}

if(live_enabled)
function gml_action_call_func_with_local4(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local4(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local4();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_func_with_local4o():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_func
	/// @hint {int} :h_local
	static __enumParams__=["h_d","h_func","h_local"];
	static __enumIndex__=86;
}

if(live_enabled)
function gml_action_call_func_with_local4o(l_h_d,l_h_func,l_h_local){
	// gml_action_call_func_with_local4o(h_d:gml_pos, h_func:any, h_local:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_func_with_local4o();
	l_this.h_d=l_h_d;
	l_this.h_func=l_h_func;
	l_this.h_local=l_h_local;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_call_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_field
	/// @hint {int} :h_argc
	static __enumParams__=["h_d","h_field","h_argc"];
	static __enumIndex__=87;
}

if(live_enabled)
function gml_action_call_field(l_h_d,l_h_field,l_h_argc){
	// gml_action_call_field(h_d:gml_pos, h_field:string, h_argc:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_call_field();
	l_this.h_d=l_h_d;
	l_this.h_field=l_h_field;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_construct():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_argc
	static __enumParams__=["h_d","h_argc"];
	static __enumIndex__=88;
}

if(live_enabled)
function gml_action_construct(l_h_d,l_h_argc){
	// gml_action_construct(h_d:gml_pos, h_argc:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_construct();
	l_this.h_d=l_h_d;
	l_this.h_argc=l_h_argc;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_func_literal():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_name
	/// @hint {bool} :h_unbound
	static __enumParams__=["h_d","h_name","h_unbound"];
	static __enumIndex__=89;
}

if(live_enabled)
function gml_action_func_literal(l_h_d,l_h_name,l_h_unbound){
	// gml_action_func_literal(h_d:gml_pos, h_name:string, h_unbound:bool)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_func_literal();
	l_this.h_d=l_h_d;
	l_this.h_name=l_h_name;
	l_this.h_unbound=l_h_unbound;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_jump():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=90;
}

if(live_enabled)
function gml_action_jump(l_h_d,l_h_p){
	// gml_action_jump(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_jump();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_jump_if():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=91;
}

if(live_enabled)
function gml_action_jump_if(l_h_d,l_h_p){
	// gml_action_jump_if(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_jump_if();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_jump_unless():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=92;
}

if(live_enabled)
function gml_action_jump_unless(l_h_d,l_h_p){
	// gml_action_jump_unless(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_jump_unless();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_jump_placeholder():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=93;
}

if(live_enabled)
function gml_action_jump_placeholder(l_h_d){
	// gml_action_jump_placeholder(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_jump_placeholder();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_bool_and():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=94;
}

if(live_enabled)
function gml_action_bool_and(l_h_d,l_h_p){
	// gml_action_bool_and(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_bool_and();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_bool_or():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=95;
}

if(live_enabled)
function gml_action_bool_or(l_h_d,l_h_p){
	// gml_action_bool_or(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_bool_or();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_null_co():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=96;
}

if(live_enabled)
function gml_action_null_co(l_h_d,l_h_p){
	// gml_action_null_co(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_null_co();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_switch_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {vm_GmlValueMap<int>} :h_jumptable
	/// @hint {int} :h_defaultPos
	static __enumParams__=["h_d","h_jumptable","h_defaultPos"];
	static __enumIndex__=97;
}

if(live_enabled)
function gml_action_switch_hx(l_h_d,l_h_jumptable,l_h_defaultPos){
	// gml_action_switch_hx(h_d:gml_pos, h_jumptable:vm_GmlValueMap<int>, h_defaultPos:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_switch_hx();
	l_this.h_d=l_h_d;
	l_this.h_jumptable=l_h_jumptable;
	l_this.h_defaultPos=l_h_defaultPos;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_switch_case():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=98;
}

if(live_enabled)
function gml_action_switch_case(l_h_d,l_h_p){
	// gml_action_switch_case(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_switch_case();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_repeat_jump():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=99;
}

if(live_enabled)
function gml_action_repeat_jump(l_h_d,l_h_p){
	// gml_action_repeat_jump(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_repeat_jump();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_repeat_pre():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=100;
}

if(live_enabled)
function gml_action_repeat_pre(l_h_d,l_h_p){
	// gml_action_repeat_pre(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_repeat_pre();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_with_pre():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=101;
}

if(live_enabled)
function gml_action_with_pre(l_h_d){
	// gml_action_with_pre(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_with_pre();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_with_next():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=102;
}

if(live_enabled)
function gml_action_with_next(l_h_d,l_h_p){
	// gml_action_with_next(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_with_next();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_with_post():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=103;
}

if(live_enabled)
function gml_action_with_post(l_h_d){
	// gml_action_with_post(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_with_post();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_break_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_lp
	static __enumParams__=["h_d","h_lp"];
	static __enumIndex__=104;
}

if(live_enabled)
function gml_action_break_hx(l_h_d,l_h_lp){
	// gml_action_break_hx(h_d:gml_pos, h_lp:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_break_hx();
	l_this.h_d=l_h_d;
	l_this.h_lp=l_h_lp;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_continue_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_lp
	static __enumParams__=["h_d","h_lp"];
	static __enumIndex__=105;
}

if(live_enabled)
function gml_action_continue_hx(l_h_d,l_h_lp){
	// gml_action_continue_hx(h_d:gml_pos, h_lp:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_continue_hx();
	l_this.h_d=l_h_d;
	l_this.h_lp=l_h_lp;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_return_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=106;
}

if(live_enabled)
function gml_action_return_hx(l_h_d){
	// gml_action_return_hx(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_return_hx();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_return_const():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {any} :h_val
	static __enumParams__=["h_d","h_val"];
	static __enumIndex__=107;
}

if(live_enabled)
function gml_action_return_const(l_h_d,l_h_val){
	// gml_action_return_const(h_d:gml_pos, h_val:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_return_const();
	l_this.h_d=l_h_d;
	l_this.h_val=l_h_val;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_result():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=108;
}

if(live_enabled)
function gml_action_result(l_h_d){
	// gml_action_result(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_result();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_try_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_hdl
	static __enumParams__=["h_d","h_hdl"];
	static __enumIndex__=109;
}

if(live_enabled)
function gml_action_try_hx(l_h_d,l_h_hdl){
	// gml_action_try_hx(h_d:gml_pos, h_hdl:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_try_hx();
	l_this.h_d=l_h_d;
	l_this.h_hdl=l_h_hdl;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_catch_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_v
	static __enumParams__=["h_d","h_v"];
	static __enumIndex__=110;
}

if(live_enabled)
function gml_action_catch_hx(l_h_d,l_h_v){
	// gml_action_catch_hx(h_d:gml_pos, h_v:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_catch_hx();
	l_this.h_d=l_h_d;
	l_this.h_v=l_h_v;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_finally_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_p
	static __enumParams__=["h_d","h_p"];
	static __enumIndex__=111;
}

if(live_enabled)
function gml_action_finally_hx(l_h_d,l_h_p){
	// gml_action_finally_hx(h_d:gml_pos, h_p:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_finally_hx();
	l_this.h_d=l_h_d;
	l_this.h_p=l_h_p;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_throw_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=112;
}

if(live_enabled)
function gml_action_throw_hx(l_h_d){
	// gml_action_throw_hx(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_throw_hx();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_wait():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=113;
}

if(live_enabled)
function gml_action_wait(l_h_d){
	// gml_action_wait(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_wait();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_fork():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {bool} :h_out
	static __enumParams__=["h_d","h_out"];
	static __enumIndex__=114;
}

if(live_enabled)
function gml_action_fork(l_h_d,l_h_out){
	// gml_action_fork(h_d:gml_pos, h_out:bool)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_fork();
	l_this.h_d=l_h_d;
	l_this.h_out=l_h_out;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_ensure_array_for_local():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_ind
	static __enumParams__=["h_d","h_ind"];
	static __enumIndex__=115;
}

if(live_enabled)
function gml_action_ensure_array_for_local(l_h_d,l_h_ind){
	// gml_action_ensure_array_for_local(h_d:gml_pos, h_ind:int)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_ensure_array_for_local();
	l_this.h_d=l_h_d;
	l_this.h_ind=l_h_ind;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_ensure_array_for_global():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_name
	static __enumParams__=["h_d","h_name"];
	static __enumIndex__=116;
}

if(live_enabled)
function gml_action_ensure_array_for_global(l_h_d,l_h_name){
	// gml_action_ensure_array_for_global(h_d:gml_pos, h_name:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_ensure_array_for_global();
	l_this.h_d=l_h_d;
	l_this.h_name=l_h_name;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_ensure_array_for_field():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_field
	static __enumParams__=["h_d","h_field"];
	static __enumIndex__=117;
}

if(live_enabled)
function gml_action_ensure_array_for_field(l_h_d,l_h_field){
	// gml_action_ensure_array_for_field(h_d:gml_pos, h_field:string)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_ensure_array_for_field();
	l_this.h_d=l_h_d;
	l_this.h_field=l_h_field;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_ensure_array_for_index():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=118;
}

if(live_enabled)
function gml_action_ensure_array_for_index(l_h_d){
	// gml_action_ensure_array_for_index(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_ensure_array_for_index();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_ensure_array_for_index2d():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=119;
}

if(live_enabled)
function gml_action_ensure_array_for_index2d(l_h_d){
	// gml_action_ensure_array_for_index2d(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_ensure_array_for_index2d();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_alarm():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=120;
}

if(live_enabled)
function gml_action_alarm(l_h_d){
	// gml_action_alarm(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_alarm();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_alarm_set_hx():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	static __enumParams__=["h_d"];
	static __enumIndex__=121;
}

if(live_enabled)
function gml_action_alarm_set_hx(l_h_d){
	// gml_action_alarm_set_hx(h_d:gml_pos)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_alarm_set_hx();
	l_this.h_d=l_h_d;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_alarm_aop():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_op
	static __enumParams__=["h_d","h_op"];
	static __enumIndex__=122;
}

if(live_enabled)
function gml_action_alarm_aop(l_h_d,l_h_op){
	// gml_action_alarm_aop(h_d:gml_pos, h_op:gml_op)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_alarm_aop();
	l_this.h_d=l_h_d;
	l_this.h_op=l_h_op;
	return l_this
}

if(live_enabled)
/// @implements {gml_action}
function mc_gml_action_closure():mc_gml_action()constructor{
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_tag
	/// @hint {any} :h_ctx
	/// @hint {any} :h_fn
	static __enumParams__=["h_d","h_tag","h_ctx","h_fn"];
	static __enumIndex__=123;
}

if(live_enabled)
function gml_action_closure(l_h_d,l_h_tag,l_h_ctx,l_h_fn){
	// gml_action_closure(h_d:gml_pos, h_tag:string, h_ctx:any, h_fn:any)->gml_action
	/// @ignore
	var l_this=new mc_gml_action_closure();
	l_this.h_d=l_h_d;
	l_this.h_tag=l_h_tag;
	l_this.h_ctx=l_h_ctx;
	l_this.h_fn=l_h_fn;
	return l_this
}

if(live_enabled)
function compile_gml_compile_args_get_simple(l_q){
	// compile_gml_compile_args_get_simple(q:ast_GmlNode)->bool
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.field:
			if(l__g[2][0]==14){
				var l__field=l__g[3];
				var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l__field);
				if(l_fastGetter!=undefined){
					compile_gml_compile_args_get_simple_val=l_fastGetter;
					compile_gml_compile_args_get_simple_kind=3;
				} else {
					compile_gml_compile_args_get_simple_val=l__field;
					compile_gml_compile_args_get_simple_kind=2;
				}
			} else if(gml_compile_const_val_of(l_q)){
				compile_gml_compile_args_get_simple_val=gml_compile_const_val_of_val;
				compile_gml_compile_args_get_simple_kind=0;
			} else return false;
			break;
		case gml_node.local_hx:
			compile_gml_compile_args_get_simple_val=variable_struct_get(gml_compile_curr_script.h_local_map,l__g[2]);
			compile_gml_compile_args_get_simple_kind=1;
			break;
		default:
			if(gml_compile_const_val_of(l_q)){
				compile_gml_compile_args_get_simple_val=gml_compile_const_val_of_val;
				compile_gml_compile_args_get_simple_kind=0;
			} else return false;
	}
	return true;
}

if(live_enabled)
function compile_gml_compile_args_proc_lf(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_args_proc_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_arr=self.values;
	var l_count=self.count;
	var l_i=l_st[0];
	var l_next=l_i+l_count;
	while(l_next>=array_length(l_st)){
		l_st[@array_length(l_st)*2]=0;
	}
	array_copy(l_st,l_i+1,l_arr,0,l_count);
	l_st[@0]=l_next;
	return 0;
}

if(live_enabled)
function compile_gml_compile_args_proc_lf1(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_args_proc_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_params=self.params;
	var l_kinds=self.kinds;
	var l_locals=l_scope[4];
	var l_self1;
	if(self.usesSelf){
		var l_this1=l_scope[6];
		l_self1=l_this1[l_this1[0]];
	} else l_self1=undefined;
	var l_count=self.count;
	var l_i=l_st[0];
	var l_next=l_i+l_count;
	while(l_next>=array_length(l_st)){
		l_st[@array_length(l_st)*2]=0;
	}
	l_st[@0]=l_next;
	var l_k=0;
	for(var l__=0;l__<l_count;l__++){
		l_i++;
		var l_v;
		switch(l_kinds[l_k]){
			case 1:l_v=l_locals[l_params[l_k]];break;
			case 0:l_v=l_params[l_k];break;
			case 3:l_v=l_params[l_k](l_self1);break;
			case 2:
				var l_field=l_params[l_k];
				var l_val=variable_struct_get(l_self1,l_field);
				if(l_val==undefined){
					if(!variable_struct_exists(l_self1,l_field)){
						if(is_numeric(l_self1)){
							if(object_exists(l_self1)){
								gml_thread_error(gml_std_Std_stringify(l_self1)+" ("+object_get_name(l_self1)+") does not have a variable `"+l_field+"`.");
							} else if(instance_exists(l_self1)){
								gml_thread_error(gml_std_Std_stringify(l_self1)+" ("+object_get_name(l_self1.object_index)+") does not have a variable `"+l_field+"`.");
							} else gml_thread_error(gml_value_dump(l_self1)+" does not have a variable `"+l_field+"`.");
						} else if(typeof(l_self1)=="ref"){
							if(instance_exists(l_self1))gml_thread_error(gml_std_Std_stringify(l_self1)+" ("+object_get_name(l_self1.object_index)+") does not have a variable `"+l_field+"`."); else gml_thread_error(gml_value_dump(l_self1)+" does not have a variable `"+l_field+"`.");
						} else gml_thread_error(gml_value_dump(l_self1)+" does not have a variable `"+l_field+"`.");
					}
				}
				l_v=l_val;
				break;
		}
		l_st[@l_i]=l_v;
		l_k++;
	}
	return 0;
}

if(live_enabled)
function compile_gml_compile_args_proc(l_actions,l_nodes,l_start,l_end){
	// compile_gml_compile_args_proc(actions:gml_action_list, nodes:array<ast_GmlNode>, start:int = 0, ?end:int)->bool
	/// @ignore
	if(l_start==undefined)l_start=0;
	if(false)show_debug_message(argument[3]);
	if(l_end==undefined)l_end=array_length(l_nodes);
	var l_i=l_start;
	while(l_i<l_end){
		var l_q=l_nodes[l_i];
		if(!compile_gml_compile_args_get_simple(l_q)){
			if(gml_compile_node(l_q,l_actions,true))return true;
			l_i++;
			continue;
		}
		var l_kind=compile_gml_compile_args_get_simple_kind;
		var l_count=1;
		var l_kinds=[l_kind];
		var l_params=[compile_gml_compile_args_get_simple_val];
		var l_allConsts=l_kind==0;
		var l_usesLocals=l_kind==1;
		var l_usesSelf=l_kind==2||l_kind==3;
		while(l_i+l_count<l_end){
			if(!compile_gml_compile_args_get_simple(l_nodes[l_i+l_count]))break;
			l_kind=compile_gml_compile_args_get_simple_kind;
			array_push(l_params,compile_gml_compile_args_get_simple_val);
			array_push(l_kinds,l_kind);
			if(l_kind!=0){
				l_allConsts=false;
				switch(l_kind){
					case 1:l_usesLocals=true;break;
					case 2:case 3:l_usesSelf=true;break;
				}
			}
			l_count++;
		}
		var l_d=gml_std_haxe_enum_tools_getParameter(l_q,0);
		if(l_count==1){
			if(gml_compile_node(l_q,l_actions,true))return true;
		} else if(l_allConsts){
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"...push(consts)",{values:l_params,count:l_count},compile_gml_compile_args_proc_lf));
		} else ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"...push(simple)",{
			params:l_params,
			kinds:l_kinds,
			count:l_count,
			usesLocals:l_usesLocals,
			usesSelf:l_usesSelf
		},compile_gml_compile_args_proc_lf1));
		l_i+=l_count;
	}
	return false;
}

if(live_enabled)
function gml_func_copy(l_to,l_from,l_note){
	// gml_func_copy(to:string, from:string, ?note:string)
	/// @ignore
	if(false)show_debug_message(argument[2]);
	var l_f0=variable_struct_get(gml_func_map,l_from);
	if(l_f0==undefined)show_error("Can't find "+l_from+" to add an alias for.",true);
	variable_struct_set(gml_func_map,l_to,l_f0.h_copy(l_to));
	var l_tmp=l_note!=undefined&&l_note!="";
}

if(live_enabled)
function gml_var_add(l_signature,l_func){
	// gml_var_add(signature:string, func:any)
	/// @ignore
	var l_v=new api_api_var();
	l_v.h_set(l_signature,l_func);
	variable_struct_set(api_api_var_map,l_v.h_name,l_v);
}

if(live_enabled)
function gml_remove_var(l_name){
	// gml_remove_var(name:string)->bool
	/// @ignore
	if(variable_struct_get(api_api_var_map,l_name)==undefined){
		return false;
	} else {
		variable_struct_remove(api_api_var_map,l_name);
		return true;
	}
}

if(live_enabled)
function gml_const_add(l_name,l_value){
	// gml_const_add(name:string, value:any)
	/// @ignore
	var l_s=l_name+" = "+gml_value_print(l_value);
	variable_struct_set(gml_const_map,l_name,true);
	variable_struct_set(gml_const_val,l_name,l_value);
}

if(live_enabled)
function gml_remove_const(l_name){
	// gml_remove_const(name:string)->bool
	/// @ignore
	if(variable_struct_exists(gml_const_map,l_name)){
		variable_struct_remove(gml_const_map,l_name);
		variable_struct_remove(gml_const_val,l_name);
		return true;
	} else return false;
}

if(live_enabled)
function gml_asset_add(l_name,l_index){
	// gml_asset_add(name:string, index:int)
	/// @ignore
	variable_struct_set(gml_asset_index,l_name,l_index);
}

if(live_enabled)
function compile_gml_compile_call_func_proc_lf(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_call_func_proc_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_argc=self.argc;
	var l_i=l_st[0]-l_argc;
	l_st[@0]=l_i;
	l_th.h_result=undefined;
	var l_pr=self.func(l_th,l_scope,l_st,l_i+1,l_argc);
	if(l_pr!=3){
		l_scope[@2]+=1;
		var l_i=l_st[0]+1;
		if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
		l_st[@l_i]=l_th.h_result;
		l_st[@0]=l_i;
	}
	return l_pr;
}

if(live_enabled)
function compile_gml_compile_call_func_proc_lf1(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_call_func_proc_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_argc=self.argc;
	var l_i=l_st[0]-l_argc;
	l_st[@0]=l_i;
	return self.func(l_th,l_scope,l_st,l_i+1,l_argc);
}

if(live_enabled)
function compile_gml_compile_call_func_proc(l_actions,l_d,l_fn,l_args1,l_out){
	// compile_gml_compile_call_func_proc(actions:gml_action_list, d:gml_pos, fn:gml_func, args:array<ast_GmlNode>, out:bool)->bool
	/// @ignore
	var l_fname=l_fn.h_name;
	var l_argc=array_length(l_args1);
	var l_func=l_fn.h_func;
	var l_funcFlags=l_fn.h_call_type;
	var l_i;
	if(l_funcFlags==undefined)l_funcFlags=0;
	if(l_func==-1)return gml_compile_error("Function `"+l_fname+"` is pointing at an invalid script.",l_d);
	var l_startArg=0;
	var l_firstArgVar=-1;
	if(l_funcFlags==0&&l_argc>0&&l_argc<=5){
		var l__g=l_args1[0];
		if(l__g[0]==43){
			l_firstArgVar=variable_struct_get(gml_compile_curr_script.h_local_map,l__g[2]);
			l_startArg++;
		}
	}
	compile_gml_compile_args_proc(l_actions,l_args1,l_startArg);
	if(l_funcFlags==-5){
		ds_list_add(l_actions,gml_action_call_func(l_d,l_func,l_argc,l_fn.h_arg_type_checks,l_fn.h_rest_type_check,l_funcFlags,false));
		if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
		return false;
	}
	if(l_funcFlags==-7){
		if(l_out){
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"action call",{func:l_func,argc:l_argc},compile_gml_compile_call_func_proc_lf));
			ds_list_add(l_actions,gml_action_result(l_d));
		} else ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"action call",{func:l_func,argc:l_argc},compile_gml_compile_call_func_proc_lf1));
		return false;
	}
	if(l_firstArgVar>=0)switch(l_argc){
		case 1:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func_with_local0o(l_d,l_func,l_firstArgVar));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func_with_local0(l_d,l_func,l_firstArgVar));
				return false;
			}
		case 2:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func_with_local1o(l_d,l_func,l_firstArgVar));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func_with_local1(l_d,l_func,l_firstArgVar));
				return false;
			}
		case 3:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func_with_local2o(l_d,l_func,l_firstArgVar));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func_with_local2(l_d,l_func,l_firstArgVar));
				return false;
			}
		case 4:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func_with_local3o(l_d,l_func,l_firstArgVar));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func_with_local3(l_d,l_func,l_firstArgVar));
				return false;
			}
		case 5:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func_with_local4o(l_d,l_func,l_firstArgVar));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func_with_local4(l_d,l_func,l_firstArgVar));
				return false;
			}
	}
	if(l_funcFlags==0&&l_argc<=4)switch(l_argc){
		case 0:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func0o(l_d,l_func));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func0(l_d,l_func));
				return false;
			}
		case 1:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func1o(l_d,l_func));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func1(l_d,l_func));
				return false;
			}
		case 2:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func2o(l_d,l_func));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func2(l_d,l_func));
				return false;
			}
		case 3:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func3o(l_d,l_func));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func3(l_d,l_func));
				return false;
			}
		case 4:
			if(l_out){
				ds_list_add(l_actions,gml_action_call_func4o(l_d,l_func));
				return false;
			} else {
				ds_list_add(l_actions,gml_action_call_func4(l_d,l_func));
				return false;
			}
	}
	ds_list_add(l_actions,gml_action_call_func(l_d,l_func,l_argc,l_fn.h_arg_type_checks,l_fn.h_rest_type_check,l_funcFlags,l_out));
	return false;
}

if(live_enabled)
function vm_v2_gml_action_closure_bind(l_d,l_tag,l_ctx,l_handler){
	// vm_v2_gml_action_closure_bind(d:gml_pos, tag:string, ctx:T, handler:vm_v2_GmlActionClosureFunc<T>)->gml_action
	/// @ignore
	return gml_action_closure(l_d,l_tag,l_ctx,method(l_ctx,l_handler));
}

if(live_enabled)
function compile_gml_compile_adjfix_proc_lf(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_adjfix_proc_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_locals=l_scope[4];
	var l_tmp=self.ind;
	var l_v=l_locals[l_tmp]+1;
	l_locals[@l_tmp]=l_v;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_adjfix_proc_lf1(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_adjfix_proc_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_locals=l_scope[4];
	var l_tmp=self.ind;
	var l_v=l_locals[l_tmp]-1;
	l_locals[@l_tmp]=l_v;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_adjfix_proc_lf2(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_adjfix_proc_lf2(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_locals=l_scope[4];
	var l_tmp=self.ind;
	var l_tmp1=l_locals[l_tmp];
	l_locals[@l_tmp]=(l_tmp1+1);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_tmp1;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_adjfix_proc_lf3(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_adjfix_proc_lf3(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_locals=l_scope[4];
	var l_tmp=self.ind;
	var l_tmp1=l_locals[l_tmp];
	l_locals[@l_tmp]=(l_tmp1-1);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_tmp1;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_adjfix_proc(l_d,l_x,l_isPrefix,l_inc,l_actions,l_out){
	// compile_gml_compile_adjfix_proc(d:gml_pos, x:ast_GmlNode, isPrefix:bool, inc:bool, actions:gml_action_list, out:bool)->bool
	/// @ignore
	var l_diff=(l_inc?1:-1);
	var l_fget,l_fset;
	var l__g=l_x;
	switch(l__g[0]){
		case gml_node.local_hx:
			var l_localInd=variable_struct_get(gml_compile_curr_script.h_local_map,l__g[2]);
			if(l_isPrefix){
				if(l_inc){
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(++local)",{ind:l_localInd},compile_gml_compile_adjfix_proc_lf));
					return false;
				} else {
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(--local)",{ind:l_localInd},compile_gml_compile_adjfix_proc_lf1));
					return false;
				}
			} else if(l_inc){
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(local++)",{ind:l_localInd},compile_gml_compile_adjfix_proc_lf2));
				return false;
			} else {
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(local--)",{ind:l_localInd},compile_gml_compile_adjfix_proc_lf3));
				return false;
			}
		case gml_node.static_hx:return compile_groups_gml_compile_group_static_proc_static_adjfix(l_actions,l_d,l__g[2],l_isPrefix,l_inc);
		case gml_node.script_static:return compile_groups_gml_compile_group_static_proc_script_static_adjfix(l_actions,l_d,l__g[2],l__g[3],l_isPrefix,l_inc);
		case gml_node.global_hx:
			var l_s=l__g[2];
			ds_list_add(l_actions,gml_action_global_hx(l_d,l_s));
			if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			if(l_out)ds_list_add(l_actions,gml_action_dup(l_d));
			if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			ds_list_add(l_actions,gml_action_global_set(l_d,l_s));
			break;
		case gml_node.field:
			var l_obj=l__g[2];
			var l_field=l__g[3];
			if(gml_compile_node(l_obj,l_actions,true))return true;
			var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_field);
			var l_fastSetter=gml_compile_curr_program.h_get_fast_setter_after_getter(l_field);
			if(l_fastGetter!=undefined&&l_fastSetter!=undefined){
				ds_list_add(l_actions,gml_action_dup(l_d));
				ds_list_add(l_actions,gml_action_call_func1o(l_d,l_fastGetter));
				if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,2));
				if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				ds_list_add(l_actions,gml_action_call_func2(l_d,l_fastSetter));
			} else {
				ds_list_add(l_actions,gml_action_dup(l_d));
				ds_list_add(l_actions,gml_action_field(l_d,l_field));
				if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,2));
				if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				ds_list_add(l_actions,gml_action_field_set(l_d,l_field));
			}
			break;
		case gml_node.index:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,gml_action_dup2x(l_d));
			ds_list_add(l_actions,gml_action_index(l_d));
			if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,3));
			if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			ds_list_add(l_actions,gml_action_index_set(l_d));
			break;
		case gml_node.raw_id:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,gml_action_dup2x(l_d));
			ds_list_add(l_actions,gml_action_index(l_d));
			if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,3));
			if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			ds_list_add(l_actions,gml_action_index_set(l_d));
			break;
		case gml_node.index2d:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_dup3x(l_d));
			ds_list_add(l_actions,gml_action_index2d(l_d));
			if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,4));
			if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			ds_list_add(l_actions,gml_action_index2d_set(l_d));
			break;
		case gml_node.raw_id2d:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_dup3x(l_d));
			ds_list_add(l_actions,gml_action_index2d(l_d));
			if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,4));
			if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
			ds_list_add(l_actions,gml_action_index2d_set(l_d));
			break;
		case gml_node.key_id:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			l_fget=variable_struct_get(gml_func_map,"variable_struct_get");
			l_fset=variable_struct_get(gml_func_map,"variable_struct_set");
			if(l_fget!=undefined&&l_fset!=undefined){
				ds_list_add(l_actions,gml_action_dup2x(l_d));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fget.h_func,2,l_fget.h_arg_type_checks,l_fget.h_rest_type_check,0,true));
				if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,3));
				if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fset.h_func,3,l_fset.h_arg_type_checks,l_fset.h_rest_type_check,0,false));
				return false;
			} else return gml_compile_error("Operation not supported - requires variable_struct_get and variable_struct_set functions.",l_d);
		case gml_node.ds_list:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			l_fget=variable_struct_get(gml_func_map,"ds_list_find_value");
			l_fset=variable_struct_get(gml_func_map,"ds_list_set");
			if(l_fget!=undefined&&l_fset!=undefined){
				ds_list_add(l_actions,gml_action_dup2x(l_d));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fget.h_func,2,l_fget.h_arg_type_checks,l_fget.h_rest_type_check,0,true));
				if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,3));
				if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fset.h_func,3,l_fset.h_arg_type_checks,l_fset.h_rest_type_check,0,false));
				return false;
			} else return gml_compile_error("Operation not supported - requires ds_list_find_value and ds_list_set functions.",l_d);
		case gml_node.ds_map:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			l_fget=variable_struct_get(gml_func_map,"ds_map_find_value");
			l_fset=variable_struct_get(gml_func_map,"ds_map_set");
			if(l_fget!=undefined&&l_fset!=undefined){
				ds_list_add(l_actions,gml_action_dup2x(l_d));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fget.h_func,2,l_fget.h_arg_type_checks,l_fget.h_rest_type_check,0,true));
				if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,3));
				if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fset.h_func,3,l_fset.h_arg_type_checks,l_fset.h_rest_type_check,0,false));
				return false;
			} else return gml_compile_error("Operation not supported - requires ds_map_find_value and ds_map_set functions.",l_d);
		case gml_node.ds_grid:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			l_fget=variable_struct_get(gml_func_map,"ds_grid_get");
			l_fset=variable_struct_get(gml_func_map,"ds_grid_set");
			if(l_fget!=undefined&&l_fset!=undefined){
				ds_list_add(l_actions,gml_action_dup3x(l_d));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fget.h_func,3,l_fget.h_arg_type_checks,l_fget.h_rest_type_check,0,true));
				if(l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				if(l_out)ds_list_add(l_actions,gml_action_dup_in(l_d,4));
				if(!l_isPrefix)ds_list_add(l_actions,gml_action_add_int(l_d,l_diff));
				ds_list_add(l_actions,gml_action_call_func(l_d,l_fset.h_func,4,l_fset.h_arg_type_checks,l_fset.h_rest_type_check,0,false));
				return false;
			} else return gml_compile_error("Operation not supported - requires ds_grid_get and ds_grid_set functions.",l_d);
		default:return gml_compile_error("Can't apply "+((l_isPrefix?"prefix":"postfix"))+((l_inc?"++":"--"))+" to "+gml_std_Type_enumConstructor(l_x),l_d);
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_has_statics_init(){
	// compile_groups_gml_compile_group_static_has_statics_init()->bool
	/// @ignore
	try{
		if(false){
			self.static_get = undefined;
			self.static_set = undefined;
		}
		return static_get!=undefined;
	}catch(l__g){
		
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_no_static_writes(l_d){
	// compile_groups_gml_compile_group_static_no_static_writes(d:ast_GmlNodeData)->bool
	/// @ignore
	return gml_compile_error("Cannot modify static variables in a constructor",l_d);
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_lf(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=variable_struct_get(static_get(self.gmlScript),self.name);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_lf1(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=variable_struct_get(static_get(self.gmlScript),self.name);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_lf2(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_lf2(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=static_get(self.gmlScript);
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	variable_struct_set(l_this1,self.name,l_r);
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_lf3(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_lf3(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=static_get(self.gmlScript);
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	variable_struct_set(l_this1,self.name,l_r);
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_lf4(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_lf4(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_statics=static_get(self.gmlScript);
	variable_struct_set(l_statics,self.name,self.op(variable_struct_get(l_statics,self.name),gml_stack_pop(l_st)));
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_lf5(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_lf5(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_statics=static_get(self.gmlScript);
	variable_struct_set(l_statics,self.name,self.op(variable_struct_get(l_statics,self.name),gml_stack_pop(l_st)));
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static(l_q,l_actions,l_out,l_gmlScript){
	// compile_groups_gml_compile_group_static_proc_dot_static(q:ast_GmlNode, actions:gml_action_list, out:bool, gmlScript:script)->bool?
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.static_hx:ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"script.static[]",{gmlScript:l_gmlScript,name:l__g[2]},compile_groups_gml_compile_group_static_proc_dot_static_lf1));break;
		case gml_node.script_static:ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"script.static[]",{gmlScript:l_gmlScript,name:l__g[3]},compile_groups_gml_compile_group_static_proc_dot_static_lf));break;
		case gml_node.static_set:
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"script.static[] = pop()",{gmlScript:l_gmlScript,name:l__g[2]},compile_groups_gml_compile_group_static_proc_dot_static_lf2));
			break;
		case gml_node.script_static_set:
			if(gml_compile_node(l__g[4],l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"script.static[] = pop()",{gmlScript:l_gmlScript,name:l__g[3]},compile_groups_gml_compile_group_static_proc_dot_static_lf3));
			break;
		case gml_node.static_aop:
			if(gml_compile_node(l__g[4],l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"script.static[] op= pop()",{gmlScript:l_gmlScript,name:l__g[2],op:gml_op_apply_fns[l__g[3]]},compile_groups_gml_compile_group_static_proc_dot_static_lf4));
			break;
		case gml_node.script_static_aop:
			if(gml_compile_node(l__g[5],l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"script.static[] op= pop()",{gmlScript:l_gmlScript,name:l__g[3],op:gml_op_apply_fns[l__g[4]]},compile_groups_gml_compile_group_static_proc_dot_static_lf5));
			break;
		default:return undefined;
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_statics=static_get(self.gmlScript);
	var l_val=variable_struct_get(l_statics,self.name)+self.delta;
	variable_struct_set(l_statics,self.name,l_val);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_val;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf1(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_statics=static_get(self.gmlScript);
	var l_val=variable_struct_get(l_statics,self.name);
	variable_struct_set(l_statics,self.name,(l_val+self.delta));
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_val;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_adjfix(l_actions,l_d,l_s,l_isPrefix,l_inc,l_gmlScript){
	// compile_groups_gml_compile_group_static_proc_dot_static_adjfix(actions:gml_action_list, d:gml_pos, s:string, isPrefix:bool, inc:bool, gmlScript:script)->bool
	/// @ignore
	var l_ctx={gmlScript:l_gmlScript,name:l_s,delta:(l_inc?1:-1)}
	if(l_isPrefix)ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,(l_inc?"push(++static)":"push(--static)"),l_ctx,compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf)); else ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,(l_inc?"push(static++)":"push(static--)"),l_ctx,compile_groups_gml_compile_group_static_proc_dot_static_adjfix_lf1));
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_lf(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=self.values[self.ind];
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_lf1(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	self.values[@self.ind]=l_r;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_lf2(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_lf2(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=self.values;
	l_v[@self.ind]=self.op(self.values[self.ind],gml_stack_pop(l_st));
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static(l_q,l_actions,l_out){
	// compile_groups_gml_compile_group_static_proc_static(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l__this=gml_compile_curr_script;
	if(!l__this.h_is_constructor&&l__this.h_script_id!=-1)return compile_groups_gml_compile_group_static_proc_dot_static(l_q,l_actions,l_out,gml_compile_curr_script.h_script_id);
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.static_hx:ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l__g[1],"static[]",{ind:variable_struct_get(gml_compile_curr_script.h_static_map,l__g[2]),values:gml_compile_curr_script.h_static_values},compile_groups_gml_compile_group_static_proc_static_lf));break;
		case gml_node.static_set:
			var l_d=l__g[1];
			var l_val=l__g[3];
			var l_isInit=l__g[4];
			if(gml_compile_curr_script.h_is_constructor&&!l_isInit)return compile_groups_gml_compile_group_static_no_static_writes(l_d);
			if(l_isInit){
				var l__g1=l_val;
				if(l__g1[0]==32){
					if(l__g1[3]==false)gml_std_haxe_enum_tools_setTo(l_val,[gml_node.func_literal,l__g1[1],l__g1[2],true]);
				}
			}
			if(gml_compile_node(l_val,l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"static[] = pop()",{ind:variable_struct_get(gml_compile_curr_script.h_static_map,l__g[2]),values:gml_compile_curr_script.h_static_values},compile_groups_gml_compile_group_static_proc_static_lf1));
			break;
		case gml_node.static_aop:
			var l_d=l__g[1];
			if(gml_compile_curr_script.h_is_constructor)return compile_groups_gml_compile_group_static_no_static_writes(l_d);
			if(gml_compile_node(l__g[4],l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"static[] op= pop()",{ind:variable_struct_get(gml_compile_curr_script.h_static_map,l__g[2]),values:gml_compile_curr_script.h_static_values,op:gml_op_apply_fns[l__g[3]]},compile_groups_gml_compile_group_static_proc_static_lf2));
			break;
		default:return undefined;
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_adjfix_lf(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_adjfix_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=++self.values[@self.ind];
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_adjfix_lf1(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_adjfix_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=--self.values[@self.ind];
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_adjfix_lf2(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_adjfix_lf2(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=self.values[@self.ind]++;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_adjfix_lf3(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_adjfix_lf3(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=self.values[@self.ind]--;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_adjfix(l_actions,l_d,l_s,l_isPrefix,l_inc){
	// compile_groups_gml_compile_group_static_proc_static_adjfix(actions:gml_action_list, d:gml_pos, s:string, isPrefix:bool, inc:bool)->bool
	/// @ignore
	var l__this=gml_compile_curr_script;
	if(!l__this.h_is_constructor&&l__this.h_script_id!=-1)return compile_groups_gml_compile_group_static_proc_dot_static_adjfix(l_actions,l_d,l_s,l_isPrefix,l_inc,gml_compile_curr_script.h_script_id);
	if(gml_compile_curr_script.h_is_constructor)return compile_groups_gml_compile_group_static_no_static_writes(l_d);
	var l_ctx={ind:variable_struct_get(gml_compile_curr_script.h_static_map,l_s),name:l_s,values:gml_compile_curr_script.h_static_values}
	if(l_isPrefix){
		if(l_inc)ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(++static)",l_ctx,compile_groups_gml_compile_group_static_proc_static_adjfix_lf)); else ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(--static)",l_ctx,compile_groups_gml_compile_group_static_proc_static_adjfix_lf1));
	} else if(l_inc){
		ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(static++)",l_ctx,compile_groups_gml_compile_group_static_proc_static_adjfix_lf2));
	} else ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(static--)",l_ctx,compile_groups_gml_compile_group_static_proc_static_adjfix_lf3));
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_script_static(l_q,l_actions,l_out){
	// compile_groups_gml_compile_group_static_proc_script_static(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l_scrName;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.script_static:l_scrName=l__g[2];break;
		case gml_node.script_static_set:l_scrName=l__g[2];break;
		case gml_node.script_static_aop:l_scrName=l__g[2];break;
		default:return undefined;
	}
	return compile_groups_gml_compile_group_static_proc_dot_static(l_q,l_actions,l_out,asset_get_index(l_scrName));
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_script_static_adjfix(l_actions,l_d,l_scrName,l_s,l_isPrefix,l_inc){
	// compile_groups_gml_compile_group_static_proc_script_static_adjfix(actions:gml_action_list, d:gml_pos, scrName:string, s:string, isPrefix:bool, inc:bool)->bool
	/// @ignore
	return compile_groups_gml_compile_group_static_proc_dot_static_adjfix(l_actions,l_d,l_s,l_isPrefix,l_inc,asset_get_index(l_scrName));
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_init_lf(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_init_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(variable_struct_names_count(static_get(self.gmlScript))!=0){
		l_scope[@2]=self.dest;
		return 2;
	} else return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_init_lf1(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_dot_static_init_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=l_scope[6];
	static_set(l_this1[l_this1[0]],static_get(self.gmlScript));
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_dot_static_init(l_actions,l_initArr,l_gmlScript){
	// compile_groups_gml_compile_group_static_proc_dot_static_init(actions:gml_action_list, initArr:array<ast_GmlNode>, gmlScript:script)->bool
	/// @ignore
	ds_list_add(l_actions,undefined);
	var l_start=ds_list_size(l_actions)-1;
	var l__g=0;
	while(l__g<array_length(l_initArr)){
		var l_item=l_initArr[l__g];
		l__g++;
		if(gml_compile_node(l_item,l_actions,false))return true;
	}
	ds_list_set(l_actions,l_start,vm_v2_gml_action_closure_bind(gml_compile_curr_script.h_pos,"if script_static jump",{gmlScript:l_gmlScript,dest:ds_list_size(l_actions)},compile_groups_gml_compile_group_static_proc_dot_static_init_lf));
	if(gml_compile_curr_script.h_is_constructor)ds_list_add(l_actions,vm_v2_gml_action_closure_bind(gml_compile_curr_script.h_pos,"static_set(self, script)",{gmlScript:l_gmlScript},compile_groups_gml_compile_group_static_proc_dot_static_init_lf1));
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_init_lf(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_init_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(self.ready[0]){
		l_scope[@2]=self.dest;
		return 2;
	} else {
		self.ready[@0]=true;
		return 0;
	}
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_init_lf1(l_th,l_u,l_scope,l_st){
	// compile_groups_gml_compile_group_static_proc_static_init_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=l_scope[6];
	var l_self1=l_this1[l_this1[0]];
	for(var l_i=0,l__g1=array_length(self.names);l_i<l__g1;l_i++){
		var l_val=self.values[l_i];
		if(is_method(l_val))l_val=live_method(l_self1,l_val);
		variable_struct_set(l_self1,self.names[l_i],l_val);
	}
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_proc_static_init(l_actions){
	// compile_groups_gml_compile_group_static_proc_static_init(actions:gml_action_list)->bool
	/// @ignore
	var l_initArr=gml_compile_curr_script.h_static_init;
	if(array_length(l_initArr)==0)return false;
	var l__this=gml_compile_curr_script;
	if(!l__this.h_is_constructor&&l__this.h_script_id!=-1)return compile_groups_gml_compile_group_static_proc_dot_static_init(l_actions,l_initArr,gml_compile_curr_script.h_script_id);
	ds_list_add(l_actions,undefined);
	var l_start=ds_list_size(l_actions)-1;
	var l__g=0;
	while(l__g<array_length(l_initArr)){
		var l_item=l_initArr[l__g];
		l__g++;
		if(gml_compile_node(l_item,l_actions,false))return true;
	}
	ds_list_set(l_actions,l_start,vm_v2_gml_action_closure_bind(gml_compile_curr_script.h_pos,"if static_ready jump",{ready:gml_compile_curr_script.h_static_ready,dest:ds_list_size(l_actions)},compile_groups_gml_compile_group_static_proc_static_init_lf));
	if(gml_compile_curr_script.h_is_constructor)ds_list_add(l_actions,vm_v2_gml_action_closure_bind(gml_compile_curr_script.h_pos,"copy statics",{names:gml_compile_curr_script.h_static_names,values:gml_compile_curr_script.h_static_values},compile_groups_gml_compile_group_static_proc_static_init_lf1));
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_static_init(){
	// compile_groups_gml_compile_group_static_init()
	/// @ignore
	gml_compile_set_handlers(compile_groups_gml_compile_group_static_proc_static,["static","static_set","static_aop"]);
	gml_compile_set_handlers(compile_groups_gml_compile_group_static_proc_script_static,["script_static","script_static_set","script_static_aop"]);
}

if(live_enabled)
function gml_func()constructor{
	// gml_func()
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_signature=undefined; /// @is {string}
	static h_is_const=undefined; /// @is {bool}
	static h_func=undefined; /// @is {any}
	static h_raw_func=undefined; /// @is {any}
	static h_call_type=undefined; /// @is {data_GmlFuncFlags}
	static h_is_script=undefined; /// @is {bool}
	static h_arg_count=undefined; /// @is {int}
	static h_min_args=undefined; /// @is {int}
	static h_max_args=undefined; /// @is {int}
	static h_arg_type_checks=undefined; /// @is {array<gml_type_check>}
	static h_rest_type_check=undefined; /// @is {gml_type_check}
	static h_copy=function(l_newName){
		var l_f=new gml_func();
		var l_sig=self.h_signature;
		var l_pos=gml_std_string_pos_ext_haxe(l_sig,self.h_name);
		l_sig=gml_std_string_substring(l_sig,0,l_pos)+l_newName+gml_std_string_substring(l_sig,l_pos+string_length(self.h_name));
		l_f.h_name=l_newName;
		l_f.h_signature=l_sig;
		l_f.h_is_const=self.h_is_const;
		l_f.h_func=self.h_func;
		l_f.h_call_type=self.h_call_type;
		l_f.h_arg_count=self.h_arg_count;
		l_f.h_min_args=self.h_min_args;
		l_f.h_max_args=self.h_max_args;
		l_f.h_arg_type_checks=self.h_arg_type_checks;
		l_f.h_rest_type_check=self.h_rest_type_check;
		return l_f;
	}
	static h_init_mystery=function(l_name,l_fn){
		self.h_name=l_name;
		self.h_signature=l_name+"(...)";
		self.h_is_const=false;
		self.h_func=method(undefined,l_fn);
		self.h_raw_func=l_fn;
		self.h_call_type=3;
		self.h_is_script=true;
		self.h_arg_count=-1;
		self.h_min_args=0;
		self.h_max_args=81;
		self.h_arg_type_checks=[];
		self.h_rest_type_check=gml_type_check_any;
	}
	static h_set=function(l_sig,l_func){
		self.h_signature=l_sig;
		var l_parStart=gml_std_string_pos_ext_haxe(l_sig,"(")+1;
		if(l_parStart==0)show_error(self.h_signature+" has no `(`",true);
		var l_parEnd=gml_std_string_pos_ext_haxe(l_sig,")");
		if(l_parEnd<0)show_error(self.h_signature+" has no `)`",true);
		var l_argText=gml_std_StringTools_trim(gml_std_string_substring(l_sig,l_parStart,l_parEnd));
		var l_flags=gml_std_string_substring(l_sig,l_parEnd+1);
		var l_argCount;
		var l_minArgs=-1;
		var l_maxArgs,l_args1,l_argCheck;
		var l_restCheck=gml_type_check_any;
		if(l_argText==""){
			l_argCount=0;
			l_maxArgs=0;
			l_argCheck=[];
			l_args1=undefined;
		} else {
			l_args1=gml_std_string_split(l_argText,",");
			l_argCount=array_length(l_args1);
			l_maxArgs=l_argCount;
			l_argCheck=array_create(l_argCount);
		}
		var l_pos;
		for(var l_i=0,l__g1=l_argCount;l_i<l__g1;l_i++){
			var l_arg=l_args1[l_i];
			var l_opt;
			var l_isRest=false;
			l_pos=gml_std_string_pos_ext_haxe(l_arg,"=");
			if(l_pos>=0){
				l_opt=true;
				l_arg=gml_std_string_substring(l_arg,0,l_pos);
			} else if(gml_std_string_pos_ext_haxe(l_arg,"...")>=0){
				l_isRest=true;
				l_opt=true;
				l_maxArgs=81;
			} else l_opt=false;
			l_pos=gml_std_string_pos_ext_haxe(l_arg,":");
			if(l_pos>=0){
				var l_typeStr=gml_std_StringTools_trim(gml_std_string_substring(l_arg,l_pos+1));
				l_arg=gml_std_string_substring(l_arg,0,l_pos);
				l_argCheck[@l_i]=gml_type_check_any;
			} else l_argCheck[@l_i]=gml_type_check_any;
			if(gml_std_string_pos_ext_haxe(l_arg,"?")>=0||gml_std_string_pos_ext_haxe(l_arg,"[")>=0)l_opt=true;
			if(l_opt){
				l_argCount=-1;
				if(l_minArgs<0)l_minArgs=l_i;
			}
		}
		if(l_argCount<0){
			if(l_minArgs<0)l_minArgs=0;
		} else {
			l_minArgs=l_argCount;
			l_maxArgs=l_argCount;
		}
		l_pos=0;
		var l_inst=0;
		for(var l__=0;l__<3;l__++){
			if(string_ord_at(l_sig,l_pos+1)==58){
				l_pos++;
				l_inst++;
			} else break;
		}
		if(string_ord_at(l_sig,l_pos+1)==36&&string_ord_at(l_sig,l_pos+1+1)==123){
			var l_start=l_pos+2;
			l_pos=gml_std_string_pos_ext_haxe(l_sig,"}",l_pos)+1;
			switch(gml_std_string_substring(l_sig,l_start,l_pos-1)){
				case "raw":l_inst=-5;break;
				case "acall":l_inst=-7;break;
				default:show_error("Unknown meta ${"+gml_std_string_substring(l_sig,l_start,l_pos)+"} in "+l_sig,true);
			}
		}
		var l_name=gml_api_parse_name(l_sig,l_pos);
		var l_rawFunc;
		if(is_method(l_func)){
			l_rawFunc=method_get_index(l_func);
			var l__self=method_get_self(l_func);
			if(l__self!=undefined){
				if(instanceof(l__self)=="instance"||is_numeric(l__self)){
					l_func=method(undefined,l_func);
				} else switch(l_inst){
					case 1:case 2:case 3:show_error("self/other functions cannot have struct bindings in "+l_sig,true);break;
				}
			}
		} else {
			l_rawFunc=l_func;
			l_func=method(undefined,l_func);
			if(l_func>=100000)self.h_is_script=true;
		}
		if(!gml_std_haxe_boot_isJS)ds_map_set(gml_func_name,l_rawFunc,l_name);
		self.h_raw_func=l_rawFunc;
		self.h_name=l_name;
		self.h_func=l_func;
		self.h_call_type=l_inst;
		self.h_is_const=gml_std_string_pos_ext_haxe(l_flags,"#")>=0;
		self.h_arg_count=l_argCount;
		self.h_min_args=l_minArgs;
		self.h_max_args=l_maxArgs;
		self.h_arg_type_checks=l_argCheck;
		self.h_rest_type_check=l_restCheck;
	}
	self.h_is_script=false;
	static __class__=mt_gml_func;
}

if(live_enabled)
function gml_func_add(l_signature,l_func){
	// gml_func_add(signature:string, func:any)
	/// @ignore
	var l_f=new gml_func();
	l_f.h_set(l_signature,l_func);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
}

if(live_enabled)
function gml_func_remove(l_name){
	// gml_func_remove(name:string)->bool
	/// @ignore
	if(variable_struct_get(gml_func_map,l_name)==undefined)return false;
	variable_struct_remove(gml_func_map,l_name);
	return true;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=gml_op_apply_fns[self.op](l_scope[4][self.ind1],l_scope[4][self.ind2]);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf1(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=gml_op_apply_fns[self.op](l_scope[4][self.ind],self.val);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf2(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf2(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=gml_op_apply_fns[self.op](l_scope[4][self.ind],l_st[l_z]);
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf3(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf3(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=gml_op_apply_fns[self.op](self.val,l_scope[4][self.ind]);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf4(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf4(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=gml_op_apply_fns[self.op](l_st[l_z],l_scope[4][self.ind]);
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf5(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf5(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=gml_op_apply_fns[self.op](self.val,l_st[l_z]);
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc_lf6(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_bin_op_proc_lf6(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=gml_op_apply_fns[self.op](l_st[l_z],self.val);
	return 0;
}

if(live_enabled)
function compile_gml_compile_bin_op_proc(l_actions,l_d,l_o,l_a,l_b){
	// compile_gml_compile_bin_op_proc(actions:gml_action_list, d:gml_pos, o:gml_op, a:ast_GmlNode, b:ast_GmlNode)->bool
	/// @ignore
	if(gml_op_is_simple(l_o)){
		var l_ai;
		var l__g=l_a;
		if(l__g[0]==43)l_ai=variable_struct_get(gml_compile_curr_script.h_local_map,l__g[2]); else l_ai=-1;
		var l_bi;
		var l__g=l_b;
		if(l__g[0]==43)l_bi=variable_struct_get(gml_compile_curr_script.h_local_map,l__g[2]); else l_bi=-1;
		if(l_ai>=0){
			if(l_bi>=0){
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(local "+gml_op_to_string(l_o)+" local)",{ind1:l_ai,ind2:l_bi,op:l_o},compile_gml_compile_bin_op_proc_lf));
				return false;
			}
			if(gml_compile_const_val_of(l_b)){
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(local "+gml_op_to_string(l_o)+" const)",{ind:l_ai,val:gml_compile_const_val_of_val,op:l_o},compile_gml_compile_bin_op_proc_lf1));
				return false;
			}
			if(gml_compile_node(l_b,l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(local "+gml_op_to_string(l_o)+" pop())",{ind:l_ai,op:l_o},compile_gml_compile_bin_op_proc_lf2));
			return false;
		}
		if(l_bi>=0){
			if(gml_compile_const_val_of(l_a)){
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(const "+gml_op_to_string(l_o)+" local)",{ind:l_bi,val:gml_compile_const_val_of_val,op:l_o},compile_gml_compile_bin_op_proc_lf3));
				return false;
			}
			if(gml_compile_node(l_a,l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(pop() "+gml_op_to_string(l_o)+" local)",{ind:l_bi,op:l_o},compile_gml_compile_bin_op_proc_lf4));
			return false;
		}
		if(gml_compile_const_val_of(l_a)){
			var l_val=gml_compile_const_val_of_val;
			if(gml_compile_node(l_b,l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(const "+gml_op_to_string(l_o)+" pop())",{val:l_val,op:l_o},compile_gml_compile_bin_op_proc_lf5));
			return false;
		}
		if(gml_compile_const_val_of(l_b)){
			var l_val=gml_compile_const_val_of_val;
			if(gml_compile_node(l_a,l_actions,true))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"push(pop() "+gml_op_to_string(l_o)+" const)",{val:l_val,op:l_o},compile_gml_compile_bin_op_proc_lf6));
			return false;
		}
	}
	var l_p0;
	switch(l_o){
		case 18:
			if(compile_gml_compile_args_proc(l_actions,[l_a,l_b]))return true;
			ds_list_add(l_actions,gml_action_concat(l_d));
			break;
		case 64:
			if(compile_gml_compile_args_proc(l_actions,[l_a,l_b]))return true;
			ds_list_add(l_actions,gml_action_equ_op(l_d));
			break;
		case 65:
			if(compile_gml_compile_args_proc(l_actions,[l_a,l_b]))return true;
			ds_list_add(l_actions,gml_action_neq_op(l_d));
			break;
		case 80:
			if(gml_compile_node(l_a,l_actions,true))return true;
			l_p0=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_bool_and(l_d,0));
			if(gml_compile_node(l_b,l_actions,true))return true;
			ds_list_set(l_actions,l_p0,gml_action_bool_and(l_d,ds_list_size(l_actions)));
			break;
		case 96:
			if(gml_compile_node(l_a,l_actions,true))return true;
			l_p0=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_bool_or(l_d,0));
			if(gml_compile_node(l_b,l_actions,true))return true;
			ds_list_set(l_actions,l_p0,gml_action_bool_or(l_d,ds_list_size(l_actions)));
			break;
		default:
			if(compile_gml_compile_args_proc(l_actions,[l_a,l_b]))return true;
			ds_list_add(l_actions,gml_action_bin_op(l_d,l_o));
	}
	return false;
}

if(live_enabled)
function gml_value_get_type(l_this1){
	// gml_value_get_type(this:any)->string
	/// @ignore
	if(l_this1==undefined){
		return "undefined";
	} else if(is_numeric(l_this1)){
		return "number";
	} else if(is_string(l_this1)){
		return "string";
	} else if(is_struct(l_this1)){
		return "struct";
	} else if(is_array(l_this1)){
		return "array";
	} else return typeof(l_this1);
}

if(live_enabled)
function gml_value_print(l_this1){
	// gml_value_print(this:any)->string
	/// @ignore
	ds_map_clear(vm_value_gml_value_printer_print_refs);
	vm_value_gml_value_printer_print_num=0;
	var l_r=vm_value_gml_value_printer_print_rec(l_this1,0);
	ds_map_clear(vm_value_gml_value_printer_print_refs);
	return l_r;
}

if(live_enabled)
function gml_value_dump(l_this1){
	// gml_value_dump(this:any)->string
	/// @ignore
	if(instanceof(l_this1)=="instance")return "`"+gml_value_print(l_this1)+"` (instance of "+object_get_name(l_this1.object_index)+")";
	return "`"+gml_value_print(l_this1)+"` ("+gml_value_get_type(l_this1)+")";
}

if(live_enabled)
function vm_value_gml_value_printer_print_rec(l_v,l_z){
	// vm_value_gml_value_printer_print_rec(v:any, z:int)->string
	/// @ignore
	var l_r,l_i,l_n;
	var l_id=vm_value_gml_value_printer_print_num++;
	if(l_v==undefined)return "undefined";
	if(is_int64(l_v))return string(l_v);
	if(is_bool(l_v)){
		if(l_v)return "true"; else return "false";
	}
	if(is_numeric(l_v)){
		if(sign(frac(l_v))==0)return string(l_v); else return json_stringify(l_v);
	}
	if(is_string(l_v)){
		return json_stringify(l_v);
	} else if(is_array(l_v)){
		l_r=ds_map_find_value(vm_value_gml_value_printer_print_refs,l_v);
		if(l_r!=undefined)return l_r;
		ds_map_set(vm_value_gml_value_printer_print_refs,l_v,"@"+string(l_id));
		l_n=array_length(l_v);
		if(l_n>0){
			if(++l_z>8)return "[...]";
			l_r="["+vm_value_gml_value_printer_print_rec(l_v[0],l_z);
			for(l_i=1;l_i<l_n;l_i++){
				l_r+=", "+vm_value_gml_value_printer_print_rec(l_v[l_i],l_z);
			}
			return l_r+"]";
		} else return "[]";
	}
	if(instanceof(l_v)=="instance"){
		var l_q=l_v;
		return "instance#"+string(l_q.id)+"("+object_get_name(l_q.object_index)+")";
	}
	return string(l_v);
}

if(live_enabled)
function gml_std_Std_stringify(l_value){
	// gml_std_Std_stringify(value:any)->string
	/// @ignore
	if(l_value==undefined)return "null";
	if(is_string(l_value))return l_value;
	var l_n,l_i,l_s;
	if(is_struct(l_value)){
		var l_e=variable_struct_get(l_value,"__enum__");
		if(l_e==undefined)return string(l_value);
		var l_ects=l_e.h_constructors;
		if(l_ects!=undefined){
			l_i=l_value.__enumIndex__;
			if(l_i>=0&&l_i<array_length(l_ects))l_s=l_ects[l_i]; else l_s="?";
		} else {
			l_s=instanceof(l_value);
			if(string_copy(l_s,1,3)=="mc_")l_s=string_delete(l_s,1,3);
			l_n=string_length(l_e.h_name);
			if(string_copy(l_s,1,l_n)==l_e.h_name)l_s=string_delete(l_s,1,l_n+1);
		}
		l_s+="(";
		var l_fields=l_value.__enumParams__;
		l_n=array_length(l_fields);
		for(l_i=-1;++l_i<l_n;l_s+=gml_std_Std_stringify(variable_struct_get(l_value,l_fields[l_i]))){
			if(l_i>0)l_s+=", ";
		}
		return l_s+")";
	}
	if(is_real(l_value)){
		l_s=string_format(l_value,0,16);
		if(os_browser!=browser_not_a_browser){
			l_n=string_length(l_s);
			l_i=l_n;
			while(l_i>0){
				switch(string_ord_at(l_s,l_i)){
					case 48:
						l_i--;
						continue;
					case 46:l_i--;break;
				}
				break;
			}
		} else {
			l_n=string_byte_length(l_s);
			l_i=l_n;
			while(l_i>0){
				switch(string_byte_at(l_s,l_i)){
					case 48:
						l_i--;
						continue;
					case 46:l_i--;break;
				}
				break;
			}
		}
		return string_copy(l_s,1,l_i);
	}
	return string(l_value);
}

if(live_enabled)
function gml_std_Std_parseFloat(l_s){
	// gml_std_Std_parseFloat(s:string)->number
	/// @ignore
	var l_l=string_length(l_s);
	var l_n=string_length(string_digits(l_s));
	var l_p=string_pos(".",l_s);
	var l_e=string_pos("e",l_s);
	if(l_e==0)l_e=string_pos("E",l_s);
	switch(l_e){
		case 0:break;
		case 1:return NaN;
		case 2:if(l_p>0)return NaN;break;
		default:if(l_p>0&&l_e<l_p)return NaN;
	}
	if(l_e!=0&&l_e<l_l-1)switch(string_ord_at(l_s,l_e+1)){
		case 43:case 45:l_l--;break;
	}
	if(l_n&&l_n==l_l-(string_ord_at(l_s,1)==45)-(l_p!=0)-(l_e!=0))return real(l_s); else return NaN;
}

if(live_enabled)
function gml_std_Std_parseInt(l_value){
	// gml_std_Std_parseInt(value:string)->int?
	/// @ignore
	var l_n=string_length(string_digits(l_value));
	if(l_n&&l_n==string_length(l_value)-(string_ord_at(l_value,1)==45))return real(l_value); else return undefined;
}

if(live_enabled)
function gml_std_string_pos_ext_haxe(l_this,l_needle,l_startPos){
	// gml_std_string_pos_ext_haxe(this:string, needle:string, startPos:int = 0)->int
	/// @ignore
	if(l_startPos==undefined)l_startPos=0;
	if(false)show_debug_message(argument[1]);
	if(l_startPos<=0)return string_pos(l_needle,l_this)-1;
	return string_pos_ext(l_needle,l_this,l_startPos)-1;
}

if(live_enabled)
function gml_std_string_last_pos_haxe(l_this,l_needle,l_startPos){
	// gml_std_string_last_pos_haxe(this:string, needle:string, ?startPos:int)->int
	/// @ignore
	if(false)show_debug_message(argument[1]);
	if(l_startPos==undefined||l_startPos>=string_length(l_this))return string_last_pos(l_needle,l_this)-1;
	return string_last_pos_ext(l_needle,l_this,l_startPos)-1;
}

if(live_enabled)
function gml_std_string_split(l_this,l_del){
	// gml_std_string_split(this:string, del:string)->array<string>
	/// @ignore
	var l_str=l_this;
	var l_num=0;
	var l_arr=array_create(string_count(l_del,l_str)+1);
	for(var l_pos=string_pos(l_del,l_str);l_pos>0;l_pos=string_pos(l_del,l_str)){
		l_arr[@l_num]=string_copy(l_str,1,l_pos-1);
		l_num++;
		l_str=string_delete(l_str,1,l_pos);
	}
	l_arr[@l_num]=l_str;
	return l_arr;
}

if(live_enabled)
function gml_std_string_substr(l_this,l_pos,l_len){
	// gml_std_string_substr(this:string, pos:int, ?len:int)->string
	/// @ignore
	if(false)show_debug_message(argument[1]);
	if(l_pos<0)l_pos+=string_length(l_this);
	if(l_len==undefined)return string_delete(l_this,1,l_pos); else return string_copy(l_this,1+l_pos,l_len);
}

if(live_enabled)
function gml_std_string_substring(l_this,l_start,l_end){
	// gml_std_string_substring(this:string, start:int, ?end:int)->string
	/// @ignore
	if(false)show_debug_message(argument[1]);
	if(l_end==undefined){
		if(l_start>0)return string_delete(l_this,1,l_start); else return l_this;
	}
	if(l_start<0)l_start=0;
	if(l_end<0)l_end=0;
	if(l_start>l_end){
		var l_tmp=l_start;
		l_start=l_end;
		l_end=l_tmp;
	}
	var l_len=string_length(l_this);
	if(l_start>=l_len){
		return "";
	} else if(l_end>=l_len){
		if(l_start>0)return string_delete(l_this,1,l_start); else return l_this;
	} else return string_copy(l_this,l_start+1,l_end-l_start);
}

if(live_enabled)
function gml_op_is_simple(l_this1){
	// gml_op_is_simple(this:int)->bool
	/// @ignore
	switch(l_this1){
		case 18:case 80:case 96:return false;
		default:return true;
	}
}

if(live_enabled)
function gml_op_get_priority(l_op){
	// gml_op_get_priority(op:gml_op)->int
	/// @ignore
	return (l_op>>4);
}

if(live_enabled)
function gml_op_to_string(l_this1){
	// gml_op_to_string(this:int)->string
	/// @ignore
	switch(l_this1){
		case -1:return "";
		case 0:return "*";
		case 1:return "/";
		case 3:return "div";
		case 2:return "%";
		case 16:return "+";
		case 17:return "-";
		case 18:return "+";
		case 32:return "<<";
		case 33:return ">>";
		case 48:return "|";
		case 49:return "&";
		case 50:return "^";
		case 64:return "==";
		case 65:return "!=";
		case 68:return ">";
		case 66:return "<";
		case 69:return ">=";
		case 67:return "<=";
		case 80:return "&&";
		case 96:return "||";
		default:return gml_op_get_name(l_this1);
	}
}

if(live_enabled)
function gml_op_apply_init_lf(l_a,l_b){
	// gml_op_apply_init_lf(a:number, b:number)->number
	/// @ignore
	return l_a+l_b;
}

if(live_enabled)
function gml_op_apply_init_lf1(l_a,l_b){
	// gml_op_apply_init_lf1(a:number, b:number)->number
	/// @ignore
	return l_a-l_b;
}

if(live_enabled)
function gml_op_apply_init_lf2(l_a,l_b){
	// gml_op_apply_init_lf2(a:number, b:number)->number
	/// @ignore
	return l_a*l_b;
}

if(live_enabled)
function gml_op_apply_init_lf3(l_a,l_b){
	// gml_op_apply_init_lf3(a:number, b:number)->number
	/// @ignore
	return l_a/l_b;
}

if(live_enabled)
function gml_op_apply_init_lf4(l_a,l_b){
	// gml_op_apply_init_lf4(a:number, b:number)->number
	/// @ignore
	return l_a%l_b;
}

if(live_enabled)
function gml_op_apply_init_lf5(l_a,l_b){
	// gml_op_apply_init_lf5(a:number, b:number)->number
	/// @ignore
	if(l_b==0&&is_int64(l_b)&&is_int64(l_a))show_error("Division by zero",true);
	return (l_a div l_b);
}

if(live_enabled)
function gml_op_apply_init_lf6(l_a,l_b){
	// gml_op_apply_init_lf6(a:number, b:number)->number
	/// @ignore
	return (l_a&l_b);
}

if(live_enabled)
function gml_op_apply_init_lf7(l_a,l_b){
	// gml_op_apply_init_lf7(a:number, b:number)->number
	/// @ignore
	return (l_a|l_b);
}

if(live_enabled)
function gml_op_apply_init_lf8(l_a,l_b){
	// gml_op_apply_init_lf8(a:number, b:number)->number
	/// @ignore
	return (l_a^l_b);
}

if(live_enabled)
function gml_op_apply_init_lf9(l_a,l_b){
	// gml_op_apply_init_lf9(a:number, b:number)->number
	/// @ignore
	return (l_a<<l_b);
}

if(live_enabled)
function gml_op_apply_init_lf10(l_a,l_b){
	// gml_op_apply_init_lf10(a:number, b:number)->number
	/// @ignore
	return (l_a>>l_b);
}

if(live_enabled)
function gml_op_apply_init_lf11(l_a,l_b){
	// gml_op_apply_init_lf11(a:number, b:number)->number
	/// @ignore
	return l_a==l_b;
}

if(live_enabled)
function gml_op_apply_init_lf12(l_a,l_b){
	// gml_op_apply_init_lf12(a:number, b:number)->number
	/// @ignore
	return l_a!=l_b;
}

if(live_enabled)
function gml_op_apply_init_lf13(l_a,l_b){
	// gml_op_apply_init_lf13(a:number, b:number)->number
	/// @ignore
	return l_a>l_b;
}

if(live_enabled)
function gml_op_apply_init_lf14(l_a,l_b){
	// gml_op_apply_init_lf14(a:number, b:number)->number
	/// @ignore
	return l_a>=l_b;
}

if(live_enabled)
function gml_op_apply_init_lf15(l_a,l_b){
	// gml_op_apply_init_lf15(a:number, b:number)->number
	/// @ignore
	return l_a<l_b;
}

if(live_enabled)
function gml_op_apply_init_lf16(l_a,l_b){
	// gml_op_apply_init_lf16(a:number, b:number)->number
	/// @ignore
	return l_a<=l_b;
}

if(live_enabled)
function gml_op_apply_init_lf17(l_v1,l_v2){
	// gml_op_apply_init_lf17(v:any, v:any)->any
	/// @ignore
	if(!is_string(l_v2))l_v2=gml_value_print(l_v2);
	if(!is_string(l_v1))l_v1=gml_value_print(l_v1);
	return l_v1+l_v2;
}

if(live_enabled)
function gml_op_apply_init_lf18(l_a,l_b){
	// gml_op_apply_init_lf18(a:number, b:number)->int
	/// @ignore
	show_error("No handler for operator "+string(self.ind),true);
	return 0;
}

if(live_enabled)
function gml_op_apply_init(){
	// gml_op_apply_init()->array<function<number;number;number>?>
	/// @ignore
	var l_out=[];
	for(var l__=0,l__g1=96+1;l__<l__g1;l__++){
		array_push(l_out,undefined);
	}
	l_out[@16]=gml_op_apply_init_lf;
	l_out[@17]=gml_op_apply_init_lf1;
	l_out[@0]=gml_op_apply_init_lf2;
	l_out[@1]=gml_op_apply_init_lf3;
	l_out[@2]=gml_op_apply_init_lf4;
	l_out[@3]=gml_op_apply_init_lf5;
	l_out[@49]=gml_op_apply_init_lf6;
	l_out[@48]=gml_op_apply_init_lf7;
	l_out[@50]=gml_op_apply_init_lf8;
	l_out[@32]=gml_op_apply_init_lf9;
	l_out[@33]=gml_op_apply_init_lf10;
	l_out[@64]=gml_op_apply_init_lf11;
	l_out[@65]=gml_op_apply_init_lf12;
	l_out[@68]=gml_op_apply_init_lf13;
	l_out[@69]=gml_op_apply_init_lf14;
	l_out[@66]=gml_op_apply_init_lf15;
	l_out[@67]=gml_op_apply_init_lf16;
	l_out[@18]=gml_op_apply_init_lf17;
	for(var l_oi=0,l__g1=96+1;l_oi<l__g1;l_oi++){
		if(l_out[l_oi]==undefined)l_out[@l_oi]=method({ind:l_oi},gml_op_apply_init_lf18);
	}
	return l_out;
}

if(live_enabled)
function gml_op_get_name(l_this1){
	// gml_op_get_name(this:int)->string
	/// @ignore
	switch(l_this1){
		case 1:return "Div";
		case 2:return "Mod";
		case 7:return "priorities";
		case 16:return "Add";
		case 17:return "Sub";
		case 18:return "Cct";
		case 32:return "Shl";
		case 33:return "Shr";
		case 48:return "Or";
		case 49:return "And";
		case 64:return "EQ";
		case 65:return "NE";
		case 66:return "LT";
		case 67:return "LE";
		case 68:return "GT";
		case 69:return "GE";
		case 80:return "BAnd";
		case 96:return "BOr";
		case 50:return "Xor";
		case 3:return "IDiv";
		case 0:return "Mul";
		case -1:return "Set";
		default:return undefined;
	}
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	delete l_scope[4][self.varind];
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf1(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf1(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_global = global; delete l_global[$ self.varname];
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf2(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf2(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=l_scope[6];
	variable_struct_remove(l_this1[l_this1[0]],self.varname);
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf3(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf3(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	variable_struct_remove(l_r,self.varname);
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf4(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf4(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	delete l_st[l_z][l_st[l_z+1]];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf5(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf5(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	delete l_st[l_z][| l_st[l_z+1]];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf6(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf6(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	delete l_st[l_z][? l_st[l_z+1]];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf7(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf7(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=(l_z-1);
	delete l_st[l_z][# l_st[l_z+1], l_st[l_z+2]];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc_lf8(l_th,l_u,l_scope,l_st){
	// compile_gml_compile_delete_proc_lf8(th:gml_thread, u:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	variable_struct_remove(l_st[l_z],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_gml_compile_delete_proc(l_actions,l_d,l_x){
	// compile_gml_compile_delete_proc(actions:gml_action_list, d:ast_GmlNodeData, x:ast_GmlNode)->bool
	/// @ignore
	var l__g=l_x;
	switch(l__g[0]){
		case gml_node.local_hx:
			var l_s=l__g[2];
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete local",{varname:l_s,varind:variable_struct_get(gml_compile_curr_script.h_local_map,l_s)},compile_gml_compile_delete_proc_lf));
			break;
		case gml_node.global_hx:ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete global",{varname:l__g[2]},compile_gml_compile_delete_proc_lf1));break;
		case gml_node.field:
			var l__g1=l__g[2];
			if(l__g1[0]==14){
				if(gml_compile_node(l_x,l_actions,true))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete self.field",{varname:l__g[3]},compile_gml_compile_delete_proc_lf2));
			} else {
				if(gml_compile_node(l__g1,l_actions,true))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete field",{varname:l__g[3]},compile_gml_compile_delete_proc_lf3));
			}
			break;
		case gml_node.index:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete array index",{},compile_gml_compile_delete_proc_lf4));
			break;
		case gml_node.ds_list:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete list index",{},compile_gml_compile_delete_proc_lf5));
			break;
		case gml_node.ds_map:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete map index",{},compile_gml_compile_delete_proc_lf6));
			break;
		case gml_node.ds_grid:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete grid index",{},compile_gml_compile_delete_proc_lf7));
			break;
		case gml_node.key_id:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"delete struct field",{},compile_gml_compile_delete_proc_lf8));
			break;
		default:return gml_compile_error("Can't delete "+gml_std_Type_enumConstructor(l_x),gml_std_haxe_enum_tools_getParameter(l_x,0));
	}
	return false;
}

if(live_enabled)
function gml_std_haxe_enum_tools_getParameter(l_q,l_i){
	// gml_std_haxe_enum_tools_getParameter(q:any, i:int)->any
	/// @ignore
	if(is_struct(l_q)){
		var l_params=l_q.__enumParams__;
		return variable_struct_get(l_q,l_params[l_i]);
	} else if(is_array(l_q)){
		return l_q[l_i+1];
	} else show_error("Not an EnumValue",true);
}

if(live_enabled)
function gml_std_haxe_enum_tools_getParameterCount(l_q){
	// gml_std_haxe_enum_tools_getParameterCount(q:any)->int
	/// @ignore
	if(is_struct(l_q)){
		return array_length(l_q.__enumParams__);
	} else if(is_array(l_q)){
		return array_length(l_q)-1;
	} else show_error("Not an EnumValue",true);
}

if(live_enabled)
function gml_std_haxe_enum_tools_setParameter(l_q,l_i,l_value){
	// gml_std_haxe_enum_tools_setParameter(q:any, i:int, value:any)
	/// @ignore
	if(is_struct(l_q)){
		var l_params=l_q.__enumParams__;
		variable_struct_set(l_q,l_params[l_i],l_value);
	} else if(is_array(l_q)){
		l_q[@l_i+1]=l_value;
	} else show_error("Not an EnumValue",true);
}

if(live_enabled)
function gml_std_haxe_enum_tools_setTo(l_q,l_v){
	// gml_std_haxe_enum_tools_setTo(q:T, v:T)
	/// @ignore
	if(is_struct(l_q)){
		var l_qp=l_q.__enumParams__;
		var l_vp=l_v.__enumParams__;
		var l_n=array_length(l_qp);
		var l_i=-1;
		while(++l_i<l_n){
			variable_struct_set(l_q,l_qp[l_i],undefined);
		}
		l_i=-1;
		l_n=array_length(l_vp);
		while(++l_i<l_n){
			variable_struct_set(l_q,l_vp[l_i],variable_struct_get(l_v,l_vp[l_i]));
		}
		l_q.__enumParams__=l_vp;
		l_q.__enumIndex__=l_v.__enumIndex__;
	} else if(is_array(l_q)){
		var l_qx=l_q;
		var l_vx=l_v;
		var l_n=array_length(l_vx);
		if(array_length(l_qx)!=l_n)array_resize(l_qx,l_n);
		array_copy(l_qx,0,l_vx,0,l_n);
	} else show_error("Not an EnumValue",true);
}

if(live_enabled)
function gml_node_tools_unpack(l_q){
	// gml_node_tools_unpack(q:ast_GmlNode)->ast_GmlNode
	/// @ignore
	while(l_q!=undefined){
		var l__g=l_q;
		if(l__g[0]==95){
			var l__g2=l__g[2];
			if(array_length(l__g2)==1)l_q=l__g2[0]; else return l_q;
		} else return l_q;
	}
	return l_q;
}

if(live_enabled)
function gml_node_tools_is_statement(l_q){
	// gml_node_tools_is_statement(q:ast_GmlNode)->bool
	/// @ignore
	switch(l_q[0]){
		case gml_node.call:return true;
		case gml_node.set_op:return true;
		case gml_node.var_decl:return true;
		case gml_node.prefix:return true;
		case gml_node.postfix:return true;
		case gml_node.block:return true;
		case gml_node.if_then:return true;
		case gml_node.switch_hx:return true;
		case gml_node.for_hx:return true;
		case gml_node.while_hx:return true;
		case gml_node.repeat_hx:return true;
		case gml_node.do_while:return true;
		case gml_node.do_until:return true;
		case gml_node.with_hx:return true;
		case gml_node.break_hx:return true;
		case gml_node.continue_hx:return true;
		case gml_node.exit_hx:return true;
		case gml_node.return_hx:return true;
		case gml_node.wait:return true;
		case gml_node.debugger:return true;
		case gml_node.try_catch:return true;
		case gml_node.throw_hx:return true;
		default:return false;
	}
}

if(live_enabled)
function gml_node_tools_is_in_block(l_q,l_p){
	// gml_node_tools_is_in_block(q:ast_GmlNode, p:ast_GmlNode)->bool
	/// @ignore
	if(l_p==undefined||l_q==undefined)return false;
	var l__g=l_p;
	switch(l__g[0]){
		case gml_node.block:return true;
		case gml_node.if_then:if(l_q!=l__g[3])return l_q==l__g[4]; else return true;
		case gml_node.while_hx:return l_q==l__g[3];
		case gml_node.do_while:return l_q==l__g[2];
		case gml_node.do_until:return l_q==l__g[2];
		case gml_node.repeat_hx:return l_q==l__g[3];
		case gml_node.with_hx:return l_q==l__g[3];
		case gml_node.for_hx:return (l_q==l__g[2]||l_q==l__g[4])||l_q==l__g[5];
		case gml_node.switch_hx:
			var l__cases=l__g[3];
			if(l_q==l__g[4])return true;
			for(var l_i=0,l__g2=array_length(l__cases);l_i<l__g2;l_i++){
				if(l__cases[l_i].expr==l_q)return true;
			}
			return false;
		case gml_node.try_catch:return l_q==l__g[2];
		default:return false;
	}
}

if(live_enabled)
function gml_node_tools_to_case_value(l_q){
	// gml_node_tools_to_case_value(q:ast_GmlNode)->any
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.number:
			var l_f=l__g[2];
			if(is_real(l_f)&&sign(frac(l_f))!=0)return undefined;
			if(int64(l_f)!=l_f)return undefined;
			return l_f;
		case gml_node.cstring:return l__g[2];
		case gml_node.enum_ctr:return l__g[3].h_value;
		default:return undefined;
	}
}

if(live_enabled)
function gml_node_tools_equals_list(l_a,l_b){
	// gml_node_tools_equals_list(a:array<ast_GmlNode>, b:array<ast_GmlNode>)->bool
	/// @ignore
	var l_n=array_length(l_a);
	if(array_length(l_b)!=l_n)return false;
	var l_i=0;
	while(l_i<l_n){
		if(gml_node_tools_equals(l_a[l_i],l_b[l_i]))l_i++; else return false;
	}
	return true;
}

if(live_enabled)
function gml_node_tools_equals_lf(l__,l_av,l_bv,l_ip){
	// gml_node_tools_equals_lf(_:int, av:any, bv:any, ip:ast_gml_node_def_param)->bool
	/// @ignore
	var l_tmp;
	switch(l_ip.h_type){
		case 0:l_tmp=gml_node_tools_equals(l_av,l_bv);break;
		case 13:l_tmp=l_av==l_bv;break;
		case 1:l_tmp=gml_node_tools_equals_list(l_av,l_bv);break;
		case 5:case 6:case 7:l_tmp=l_av==l_bv;break;
		case 10:case 11:case 12:l_tmp=l_av==l_bv;break;
		case 8:case 9:l_tmp=l_av==l_bv;break;
		case 14:return array_equals(l_av,l_bv);
		case 4:
			var l_cca=l_av;
			var l_ccb=l_bv;
			var l_n=array_length(l_cca);
			var l_i=-1;
			var l_ok=l_n==array_length(l_ccb);
			if(l_ok)while(++l_i<l_n){
				if(!gml_node_tools_equals(l_cca[l_i].expr,l_ccb[l_i].expr)){
					l_ok=false;
					break;
				}
				if(!gml_node_tools_equals_list(l_cca[l_i].values,l_ccb[l_i].values)){
					l_ok=false;
					break;
				}
			}
			l_tmp=l_ok;
			break;
		default:l_tmp=true;
	}
	return !l_tmp;
}

if(live_enabled)
function gml_node_tools_equals(l_a,l_b){
	// gml_node_tools_equals(a:ast_GmlNode, b:ast_GmlNode)->bool
	/// @ignore
	if(l_a==undefined)return l_b==undefined;
	if(l_b==undefined)return false;
	if(l_a[0]!=l_b[0])return false;
	var l_params=ast_gml_node_def_info_array[gml_std_Type_enumIndex(l_a)].h_params;
	var l_result=false;
	for(var l_i=0,l__g1=array_length(l_params);l_i<l__g1;l_i++){
		if(gml_node_tools_equals_lf(l_i,l_a[l_i+1],l_b[l_i+1],l_params[l_i])){
			l_result=true;
			break;
		}
	}
	return !l_result;
}

if(live_enabled)
function gml_node_tools_clone_list(l__arr){
	// gml_node_tools_clone_list(_arr:array<ast_GmlNode>)->array<ast_GmlNode>
	/// @ignore
	if(l__arr==undefined)return undefined;
	var l_arr=gml_std_gml_internal_ArrayImpl_copy(l__arr);
	var l_i=array_length(l_arr);
	while(--l_i>=0){
		l_arr[@l_i]=gml_node_tools_clone(l_arr[l_i]);
	}
	return l_arr;
}

if(live_enabled)
function gml_node_tools_clone_case(l_cc0){
	// gml_node_tools_clone_case(cc:ast_GmlNodeCase)->ast_GmlNodeCase
	/// @ignore
	return {values:gml_node_tools_clone_list(l_cc0.values),expr:gml_node_tools_clone(l_cc0.expr),pre:gml_node_tools_clone_list(l_cc0.pre)}
}

if(live_enabled)
function gml_node_tools_clone(l_q){
	// gml_node_tools_clone(q:ast_GmlNode)->ast_GmlNode
	/// @ignore
	if(l_q==undefined)return undefined;
	var l_ndef=gml_std_gml_internal_ArrayImpl_concatFront(gml_std_Type_enumParameters(l_q),gml_std_Type_enumIndex(l_q));
	var l_params=ast_gml_node_def_info_array[gml_std_Type_enumIndex(l_q)].h_params;
	for(var l_i=0,l__g1=array_length(l_params);l_i<l__g1;l_i++){
		var l_v=l_ndef[l_i+1];
		var l_val;
		switch(l_params[l_i].h_type){
			case 2:l_val=l_v;break;
			case 8:case 9:l_val=l_v;break;
			case 13:l_val=l_v;break;
			case 14:l_val=gml_std_gml_internal_ArrayImpl_copy(l_v);break;
			case 1:l_val=gml_node_tools_clone_list(l_v);break;
			case 0:l_val=gml_node_tools_clone(l_v);break;
			case 5:case 6:case 7:l_val=l_v;break;
			case 10:case 11:case 12:l_val=l_v;break;
			case 3:l_val=gml_node_tools_clone_case(l_v);break;
			case 4:
				var l_cc=gml_std_gml_internal_ArrayImpl_copy(l_v);
				var l_i1=array_length(l_cc);
				while(--l_i1>=0){
					l_cc[@l_i1]=gml_node_tools_clone_case(l_cc[l_i1]);
				}
				l_val=l_cc;
				break;
		}
		l_ndef[@l_i+1]=l_val;
	}
	return l_ndef;
}

if(live_enabled)
function gml_node_tools_seek_all_out(l_q,l_st,l_c,l_si,l_pg){
	// gml_node_tools_seek_all_out(q:ast_GmlNode, st:tools_ArrayList<ast_GmlNode>, c:ast_GmlNodeIter, si:int, pg:gml_program)->bool
	/// @ignore
	var l_w,l_i;
	var l_par=ds_list_find_value(l_st,l_si);
	if(l_par==undefined)return false;
	var l__g=l_par;
	switch(l__g[0]){
		case gml_node.block:
			l_w=l__g[2];
			l_i=array_length(l_w);
			while(--l_i>=0){
				if(l_w[l_i]==l_q)break;
			}
			while(--l_i>=0){
				if(l_c(l_w[l_i],undefined))return true;
			}
			break;
		case gml_node.if_then:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.while_hx:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.do_while:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.do_until:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.repeat_hx:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.for_hx:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.switch_hx:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		case gml_node.with_hx:
			var l_c1=l__g[2];
			if(l_c1!=l_q&&l_c(l_c1,undefined))return true;
			break;
		default:show_error("Can't seekAllOut over "+ast_gml_node_tools_ni_get_pos_string(l_par,l_pg)+" "+gml_std_Type_enumConstructor(l_par),true);
	}
	return gml_node_tools_seek_all_out(l_par,l_st,l_c,l_si+1,l_pg);
}

if(live_enabled)
function gml_node_tools_seek_arr(l_arr,l_fn,l_st){
	// gml_node_tools_seek_arr(arr:array<ast_GmlNode>, fn:ast_GmlNodeIter, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	for(var l_i=0,l__g1=array_length(l_arr);l_i<l__g1;l_i++){
		if(l_fn(l_arr[l_i],undefined))return true;
	}
	return false;
}

if(live_enabled)
function gml_node_tools_seek_or2(l_a,l_b,l_fn,l_st){
	// gml_node_tools_seek_or2(a:ast_GmlNode, b:ast_GmlNode, fn:ast_GmlNodeIter, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	return l_fn(l_a,undefined)||l_fn(l_b,undefined);
}

if(live_enabled)
function gml_node_tools_seek_or3(l_a,l_b,l_c,l_fn,l_st){
	// gml_node_tools_seek_or3(a:ast_GmlNode, b:ast_GmlNode, c:ast_GmlNode, fn:ast_GmlNodeIter, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	return (l_fn(l_a,undefined)||l_fn(l_b,undefined))||l_fn(l_c,undefined);
}

if(live_enabled)
function gml_node_tools_seek_or4(l_a,l_b,l_c,l_d,l_fn,l_st){
	// gml_node_tools_seek_or4(a:ast_GmlNode, b:ast_GmlNode, c:ast_GmlNode, d:ast_GmlNode, fn:ast_GmlNodeIter, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	return (l_fn(l_a,undefined)||l_fn(l_b,undefined)||l_fn(l_c,undefined))||l_fn(l_d,undefined);
}

if(live_enabled)
function gml_node_tools_seek_1or_arr(l_a,l_arr,l_fn,l_st){
	// gml_node_tools_seek_1or_arr(a:ast_GmlNode, arr:array<ast_GmlNode>, fn:ast_GmlNodeIter, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	if(l_fn(l_a,undefined))return true;
	for(var l_i=0,l__g1=array_length(l_arr);l_i<l__g1;l_i++){
		if(l_fn(l_arr[l_i],undefined))return true;
	}
	return false;
}

if(live_enabled)
function gml_node_tools_seek_all(l_q,l_st,l_c,l_pg){
	// gml_node_tools_seek_all(q:ast_GmlNode, st:tools_ArrayList<ast_GmlNode>, c:ast_GmlNodeIter, pg:gml_program)->bool
	/// @ignore
	if(l_st!=undefined)ds_list_insert(l_st,0,l_q);
	var l_r=false;
	var l_x,l_w,l_i,l_n;
	var l_trouble=false;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.ensure_array_for_field:l_r=l_c(l__g[2],undefined);break;
		case gml_node.arg_index:l_r=l_c(l__g[2],undefined);break;
		case gml_node.prefix:l_r=l_c(l__g[2],undefined);break;
		case gml_node.postfix:l_r=l_c(l__g[2],undefined);break;
		case gml_node.delete_hx:l_r=l_c(l__g[2],undefined);break;
		case gml_node.to_bool:l_r=l_c(l__g[2],undefined);break;
		case gml_node.from_bool:l_r=l_c(l__g[2],undefined);break;
		case gml_node.local_set:l_r=l_c(l__g[3],undefined);break;
		case gml_node.local_aop:l_r=l_c(l__g[4],undefined);break;
		case gml_node.static_set:l_r=l_c(l__g[3],undefined);break;
		case gml_node.static_aop:l_r=l_c(l__g[4],undefined);break;
		case gml_node.global_set:l_r=l_c(l__g[3],undefined);break;
		case gml_node.global_aop:l_r=l_c(l__g[4],undefined);break;
		case gml_node.script_static_set:l_r=l_c(l__g[4],undefined);break;
		case gml_node.script_static_aop:l_r=l_c(l__g[5],undefined);break;
		case gml_node.env_set:l_r=l_c(l__g[3],undefined);break;
		case gml_node.env_aop:l_r=l_c(l__g[4],undefined);break;
		case gml_node.wait:l_r=l_c(l__g[2],undefined);break;
		case gml_node.once:l_r=l_c(l__g[2],undefined);break;
		case gml_node.return_hx:l_r=l_c(l__g[2],undefined);break;
		case gml_node.throw_hx:l_r=l_c(l__g[2],undefined);break;
		case gml_node.undefined_hx:l_r=false;break;
		case gml_node.boolean:l_r=false;break;
		case gml_node.number:l_r=false;break;
		case gml_node.cstring:l_r=false;break;
		case gml_node.other_const:l_r=false;break;
		case gml_node.enum_ctr:l_r=false;break;
		case gml_node.ensure_array_for_local:l_r=false;break;
		case gml_node.ensure_array_for_global:l_r=false;break;
		case gml_node.ident:l_r=false;break;
		case gml_node.self_hx:l_r=false;break;
		case gml_node.other_hx:l_r=false;break;
		case gml_node.global_ref:l_r=false;break;
		case gml_node.script:l_r=false;break;
		case gml_node.native_script:l_r=false;break;
		case gml_node.const:l_r=false;break;
		case gml_node.arg_const:l_r=false;break;
		case gml_node.arg_count:l_r=false;break;
		case gml_node.func_literal:l_r=false;break;
		case gml_node.local_hx:l_r=false;break;
		case gml_node.static_hx:l_r=false;break;
		case gml_node.global_hx:l_r=false;break;
		case gml_node.script_static:l_r=false;break;
		case gml_node.env:l_r=false;break;
		case gml_node.fork:l_r=false;break;
		case gml_node.exit_hx:l_r=false;break;
		case gml_node.break_hx:l_r=false;break;
		case gml_node.continue_hx:l_r=false;break;
		case gml_node.debugger:l_r=false;break;
		case gml_node.bin_op:
			switch(l__g[2]){
				case 80:
					var l_a=l__g[3];
					var l_b=l__g[4];
					l_r=l_c(l_a,undefined)&&l_c(l_b,undefined);
					break;
				case 96:l_r=l_c(l__g[3],undefined);break;
				default:l_r=gml_node_tools_seek_or2(l__g[3],l__g[4],l_c,l_st);
			}
			break;
		case gml_node.array_decl:gml_node_tools_seek_arr(l__g[2],l_c,l_st);break;
		case gml_node.object_decl:gml_node_tools_seek_arr(l__g[3],l_c,l_st);break;
		case gml_node.var_decl:
			var l_v=l__g[3];
			l_r=l_v!=undefined&&l_c(l_v,undefined);
			break;
		case gml_node.null_co:l_r=l_c(l__g[2],undefined);break;
		case gml_node.un_op:l_r=l_c(l__g[2],undefined);break;
		case gml_node.block:l_r=gml_node_tools_seek_arr(l__g[2],l_c,l_st);break;
		case gml_node.call:l_r=gml_node_tools_seek_1or_arr(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.call_script_id:l_r=gml_node_tools_seek_1or_arr(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.construct:l_r=gml_node_tools_seek_1or_arr(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.call_script_at:l_r=gml_node_tools_seek_1or_arr(l__g[2],l__g[4],l_c,l_st);break;
		case gml_node.call_field:l_r=gml_node_tools_seek_1or_arr(l__g[2],l__g[4],l_c,l_st);break;
		case gml_node.call_func_at:l_r=gml_node_tools_seek_1or_arr(l__g[2],l__g[4],l_c,l_st);break;
		case gml_node.call_script:l_r=gml_node_tools_seek_arr(l__g[3],l_c,l_st);break;
		case gml_node.call_func:l_r=gml_node_tools_seek_arr(l__g[3],l_c,l_st);break;
		case gml_node.call_script_with_array:
			var l_x1=l__g[2];
			var l_y=l__g[3];
			l_r=l_c(l_x1,undefined)||l_c(l_y,undefined);
			break;
		case gml_node.if_then:
			var l_c1=l__g[2];
			var l_a=l__g[3];
			var l_b=l__g[4];
			l_r=l_c(l_c1,undefined)||l_b!=undefined&&l_c(l_a,undefined)&&l_c(l_b,undefined);
			break;
		case gml_node.ternary:
			var l_c1=l__g[2];
			var l_a=l__g[3];
			var l_b=l__g[4];
			l_r=l_c(l_c1,undefined)||l_c(l_a,undefined)&&l_c(l_b,undefined);
			break;
		case gml_node.for_hx:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,undefined);break;
		case gml_node.while_hx:l_r=l_c(l__g[2],undefined);break;
		case gml_node.with_hx:l_r=l_c(l__g[2],undefined);break;
		case gml_node.do_while:l_r=l_c(l__g[2],undefined);break;
		case gml_node.do_until:l_r=l_c(l__g[2],undefined);break;
		case gml_node.repeat_hx:l_r=l_c(l__g[2],undefined);break;
		case gml_node.switch_hx:
			var l__x=l__g[2];
			var l__cc=l__g[3];
			var l__d=l__g[4];
			if(l_c(l__x,undefined)){
				l_r=true;
			} else {
				l_x=l__d;
				if(l_x!=undefined&&l_c(l_x,undefined)){
					l_n=array_length(l__cc);
					l_i=0;
					while(l_i<l_n){
						if(l_c(l_x,undefined))l_i++; else break;
					}
					l_r=l_i>=l_n;
				} else l_r=false;
			}
			break;
		case gml_node.try_catch:
			var l_x=l__g[2];
			var l_e=l__g[4];
			l_r=l_c(l_x,undefined)||l_c(l_e,undefined);
			break;
		case gml_node.set_op:l_r=gml_node_tools_seek_or2(l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.in:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.env1d:l_r=l_c(l__g[3],undefined);break;
		case gml_node.env1d_set:l_r=gml_node_tools_seek_or2(l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.env1d_aop:l_r=gml_node_tools_seek_or2(l__g[3],l__g[5],l_c,l_st);break;
		case gml_node.alarm:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.alarm_set_hx:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.alarm_aop:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[5],l_c,l_st);break;
		case gml_node.ensure_array_for_index:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.ensure_array_for_index2d:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.index:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.index_set:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.index_aop:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[5],l_c,l_st);break;
		case gml_node.index2d:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.index2d_set:l_r=gml_node_tools_seek_or4(l__g[2],l__g[3],l__g[4],l__g[5],l_c,l_st);break;
		case gml_node.index2d_aop:l_r=gml_node_tools_seek_or4(l__g[2],l__g[3],l__g[4],l__g[6],l_c,l_st);break;
		case gml_node.raw_id:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.raw_id_set:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.raw_id_aop:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[5],l_c,l_st);break;
		case gml_node.raw_id2d:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.raw_id2d_set:l_r=gml_node_tools_seek_or4(l__g[2],l__g[3],l__g[4],l__g[5],l_c,l_st);break;
		case gml_node.raw_id2d_aop:l_r=gml_node_tools_seek_or4(l__g[2],l__g[3],l__g[4],l__g[6],l_c,l_st);break;
		case gml_node.field:l_r=l_c(l__g[2],undefined);break;
		case gml_node.field_set:l_r=gml_node_tools_seek_or2(l__g[2],l__g[4],l_c,l_st);break;
		case gml_node.field_aop:l_r=gml_node_tools_seek_or2(l__g[2],l__g[5],l_c,l_st);break;
		case gml_node.env_fd:l_r=l_c(l__g[2],undefined);break;
		case gml_node.env_fd_set:l_r=gml_node_tools_seek_or2(l__g[2],l__g[4],l_c,l_st);break;
		case gml_node.env_fd_aop:l_r=gml_node_tools_seek_or2(l__g[2],l__g[5],l_c,l_st);break;
		case gml_node.ds_list:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.ds_list_set_hx:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.ds_list_aop:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[5],l_c,l_st);break;
		case gml_node.ds_map:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.ds_map_set_hx:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.ds_map_aop:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[5],l_c,l_st);break;
		case gml_node.ds_grid:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.ds_grid_set_hx:l_r=gml_node_tools_seek_or4(l__g[2],l__g[3],l__g[4],l__g[5],l_c,l_st);break;
		case gml_node.ds_grid_aop:l_r=gml_node_tools_seek_or4(l__g[2],l__g[3],l__g[4],l__g[6],l_c,l_st);break;
		case gml_node.key_id:l_r=gml_node_tools_seek_or2(l__g[2],l__g[3],l_c,l_st);break;
		case gml_node.key_id_set:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[4],l_c,l_st);break;
		case gml_node.key_id_aop:l_r=gml_node_tools_seek_or3(l__g[2],l__g[3],l__g[5],l_c,l_st);break;
	}
	if(l_trouble)show_error("Can't seekAll over "+ast_gml_node_tools_ni_get_pos_string(l_q,l_pg)+" "+gml_std_Type_enumConstructor(l_q),true);
	if(l_st!=undefined)ds_list_delete(l_st,0);
	return false;
}

if(live_enabled)
function gml_node_tools_seek(l_q,l_st,l_c){
	// gml_node_tools_seek(q:ast_GmlNode, st:tools_ArrayList<ast_GmlNode>, c:ast_GmlNodeIter)->bool
	/// @ignore
	if(l_q==undefined)return false;
	if(l_st!=undefined)ds_list_insert(l_st,0,l_q);
	var l_result;
	var l__g=l_q;
	if(l__g[0]==98){
		var l_x=l__g[2];
		var l_m=l__g[3];
		var l_o=l__g[4];
		if(l_c(l_x,l_st)){
			l_result=true;
		} else {
			var l_n=array_length(l_m);
			var l_i;
			for(l_i=0;l_i<l_n;l_i++){
				var l_w=l_m[l_i].values;
				var l_l=array_length(l_w);
				var l_k;
				for(l_k=0;l_k<l_l;l_k++){
					if(l_c(l_w[l_k],l_st))break;
				}
				if(l_k<l_l||l_c(l_m[l_i].expr,l_st))break;
			}
			if(l_i<l_n)l_result=true; else l_result=l_o!=undefined&&l_c(l_o,l_st);
		}
		if(l_st!=undefined)ds_list_delete(l_st,0);
		return l_result;
	}
	var l_inf=ast_gml_node_def_info_array[gml_std_Type_enumIndex(l_q)];
	var l_def=l_q;
	var l_params=l_inf.h_params;
	var l_result1=false;
	for(var l_i=0,l__g1=array_length(l_params);l_i<l__g1;l_i++){
		var l_v=l_def[l_i+1];
		var l_result2;
		switch(l_params[l_i].h_type){
			case 0:l_result2=l_v!=undefined&&l_c(l_v,l_st);break;
			case 1:
				var l_arr=l_v;
				var l_found=false;
				for(var l_i1=0,l__g3=array_length(l_arr);l_i1<l__g3;l_i1++){
					if(l_c(l_arr[l_i1],l_st)){
						l_found=true;
						break;
					}
				}
				l_result2=l_found;
				break;
			default:l_result2=false;
		}
		if(l_result2){
			l_result1=true;
			break;
		}
	}
	l_result=l_result1;
	if(l_st!=undefined)ds_list_delete(l_st,0);
	return l_result;
}

if(live_enabled)
function gml_thread(l_program,l_actions,l_args1,l_locals,l_self1,l_other1,l_offset)constructor{
	// gml_thread(program:gml_program, actions:gml_action_list, args:array<any>, locals:array<any>, ?self:any, ?other:any, offset:int = 0)
	/// @ignore
	static h_result=undefined; /// @is {any}
	static h_status=undefined; /// @is {gml_thread_status}
	static h_callback=undefined; /// @is {function<gml_thread;void>}
	static h_scope=undefined; /// @is {gml_thread_scope}
	static h_wait_time=undefined; /// @is {number}
	static h_time_tag=undefined; /// @is {vm_GmlThreadTimeTag}
	static h_error_text=undefined; /// @is {string}
	static h_error_pos=undefined; /// @is {gml_pos}
	static h_get_error=function(){
		return self.h_error_text;
	}
	static h_get_error_ptr=function(){
		if(self.h_error_pos!=undefined)return gml_pos_to_string(self.h_error_pos,self.h_scope[9]); else return "?";
	}
	static h_get_callstack=function(){
		var l_q=self.h_scope;
		var l_n=0;
		for(var l_qn=l_q;l_qn!=undefined;l_qn=l_qn[10]){
			l_n++;
		}
		var l_arr=array_create(l_n);
		for(var l_i=0;l_i<l_n;l_i++){
			var l_p=l_q[2]-1;
			l_arr[@l_i]=gml_pos_to_string(gml_std_haxe_enum_tools_getParameter(ds_list_find_value(l_q[1],(l_p>0?l_p-1:0)),0),self.h_scope[9]);
			l_q=l_q[10];
		}
		return l_arr;
	}
	static h_stack_error=function(l_pos,l_e){
		var l_text;
		if(is_struct(l_e)&&variable_struct_exists(l_e,"stacktrace")){
			l_text=(variable_struct_exists(l_e,"message")?string(l_e.message):"(error without a message?)");
			var l_st=l_e.stacktrace;
			if(gml_thread_verbose_stack_traces){
				for(var l_i=0,l__g1=array_length(l_st);l_i<l__g1;l_i++){
					var l_js=l_st[l_i];
					if(is_string(l_js)){
						if(gml_std_StringTools_startsWith(l_js,"gml_Script_vm_group_")){
							l_text+="\n called from vm:"+gml_std_string_substring(l_js,string_length("gml_Script_vm_group_"));
						} else if(gml_std_StringTools_startsWith(l_js,"gml_Script_")||gml_std_StringTools_startsWith(l_js,"gml_Object_")){
							l_text+="\n called from "+gml_std_string_substring(l_js,string_length("gml_Script_"));
						} else l_text+="\n called from "+l_js;
					} else l_text+="\n called from "+string(l_js);
				}
			}
		} else l_text=gml_std_Std_stringify(l_e);
		var l_s="[error] "+l_text+"\n called from "+gml_pos_to_string(l_pos,self.h_scope[9]);
		var l_q=self.h_scope;
		if(l_q!=undefined)for(l_q=self.h_scope[10];l_q!=undefined;l_q=l_q[10]){
			var l_p=l_q[2];
			l_s+="\n called from "+gml_pos_to_string(gml_std_haxe_enum_tools_getParameter(ds_list_find_value(l_q[1],(l_p>0?l_p-1:0)),0),self.h_scope[9]);
		}
		return l_s;
	}
	static h_proc_error=function(l_text,l_act){
		var l_pos=gml_std_haxe_enum_tools_getParameter(l_act,0);
		self.h_error_text=self.h_stack_error(l_pos,l_text);
		self.h_error_pos=l_pos;
		self.h_status=4;
		return false;
	}
	static h_proc_error2=function(l_e,l_act){
		var l_pos=gml_std_haxe_enum_tools_getParameter(l_act,0);
		self.h_error_text=self.h_stack_error(l_pos,l_e);
		self.h_error_pos=l_pos;
		self.h_status=4;
		return 1;
	}
	static h_exec=function(){
		var l__gthis=self;
		var l_prevKind=gml_thread_current_kind;
		gml_thread_current_kind=1;
		var l_previous=gml_thread_current;
		gml_thread_current=self;
		var l_stack;
		var l_scope=self.h_scope;
		var l_actions,l_pos,l_len;
		l_actions=l_scope[1];
		l_len=ds_list_size(l_actions);
		l_stack=l_scope[5];
		var l_allowExceptions=gml_thread_allow_exceptions;
		var l__callback;
		self.h_status=1;
		while(true){
			var l_proc;
			var l_act=undefined;
			for(var l_loop=true,l_pos=l_scope[2];l_pos<l_len&&l_loop;l_pos=l_scope[2]){
				if(l_allowExceptions){
					l_act=ds_list_find_value(l_actions,l_pos);
					l_scope[@2]=l_pos+1;
					var l_ar=l_act.__func__(l__gthis,l_act,l_scope,l_stack);
					if(l__gthis.h_status>=4){
						l_loop=false;
					} else if(l_ar==3){
						l_scope=l__gthis.h_scope;
						l_actions=l_scope[1];
						l_len=ds_list_size(l_actions);
						l_stack=l_scope[5];
					}
				} else try{
					l_act=ds_list_find_value(l_actions,l_pos);
					l_scope[@2]=l_pos+1;
					var l_ar1=l_act.__func__(l__gthis,l_act,l_scope,l_stack);
					if(l__gthis.h_status>=4){
						l_loop=false;
					} else if(l_ar1==3){
						l_scope=l__gthis.h_scope;
						l_actions=l_scope[1];
						l_len=ds_list_size(l_actions);
						l_stack=l_scope[5];
					}
				}catch(l__g){
					var l_x=gml_std_haxe_Exception_caught(l__g).h_unwrap();
					l_loop=false;
					if(l_act==undefined){
						self.h_error_pos=l_scope[9].h_sources[0].h_get_eof();
						self.h_error_text=self.h_stack_error(self.h_error_pos,"program is destroyed");
						self.h_status=4;
					} else self.h_proc_error(l_x,l_act);
				}
			}
			if(self.h_status==4){
				l_proc=false;
				while(l_scope!=undefined){
					if(l_scope[8]!=undefined){
						l_scope[@2]=l_scope[8].h_value;
						self.h_status=1;
						break;
					} else {
						l_scope=l_scope[10];
						l_proc=true;
					}
				}
				if(l_scope==undefined){
					self.h_result=undefined;
					l__callback=self.h_callback;
					if(l__callback!=undefined)l__callback(self);
					break;
				} else if(l_proc){
					if(l_scope[7]!=undefined)gml_with_scope_destroy(l_scope[7]);
					l_actions=l_scope[1];
					l_len=ds_list_size(l_actions);
					l_stack=l_scope[5];
				}
			} else if(l_scope[2]>=l_len&&self.h_status==1){
				if(l_scope[7]!=undefined)gml_with_scope_destroy(l_scope[7]);
				delete l_scope[5];
				delete l_scope[6];
				delete l_scope[4];
				l_scope=l_scope[10];
				if(l_scope!=undefined){
					self.h_scope=l_scope;
					l_actions=l_scope[1];
					l_len=ds_list_size(l_actions);
					l_stack=l_scope[5];
				} else {
					self.h_status=3;
					l__callback=self.h_callback;
					if(l__callback!=undefined)l__callback(self);
					break;
				}
			} else break;
		}
		gml_thread_current=l_previous;
		gml_thread_current_kind=l_prevKind;
	}
	static h_fork=function(){
		var l_q=self.h_scope;
		var l_q_inst=l_q[6];
		var l_r=new gml_thread(l_q[9],l_q[1],gml_value_list_copy(l_q[3]),gml_value_list_copy(l_q[4]),l_q_inst[l_q_inst[0]],l_q_inst[l_q_inst[0]-1],l_q[2]);
		l_r.h_callback=self.h_callback;
		var l_n=l_r.h_scope;
		l_n[@6]=gml_std_gml_internal_ArrayImpl_copy(l_q_inst);
		l_n[@5]=gml_std_gml_internal_ArrayImpl_copy(l_q[5]);
		l_n[@7]=gml_with_scope_copy(l_q[7]);
		return l_r;
	}
	if(l_offset==undefined)l_offset=0;
	if(false)show_debug_message(argument[6]);
	self.h_error_pos=undefined;
	self.h_error_text=undefined;
	self.h_time_tag=undefined;
	self.h_callback=undefined;
	self.h_status=0;
	self.h_result=undefined;
	self.h_callback=gml_thread_default_callback;
	if(l_self1==undefined)l_self1=live_custom_self;
	if(l_other1==undefined)l_other1=live_custom_other;
	if(l_self1==undefined)l_self1=live_custom_self;
	if(l_other1==undefined)l_other1=live_custom_other;
	self.h_scope=gml_thread_scope_create(l_actions,l_offset,l_args1,l_locals,l_self1,l_other1,undefined,l_program);
	//
}

if(live_enabled)
function gml_thread_error(l_text){
	// gml_thread_error(text:string)->any
	/// @ignore
	show_error(l_text,true);
	return undefined;
}

if(live_enabled)
function compile_groups_gml_compile_group_ds_proc(l_q,l_actions,l_out){
	// compile_groups_gml_compile_group_ds_proc(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l_fn,l_fn2;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.ds_list:
			l_fn=variable_struct_get(gml_func_map,"ds_list_find_value");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_list_set_hx:
			l_fn=variable_struct_get(gml_func_map,"ds_list_set");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3],l__g[4]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_list_aop:
			var l_args1=[l__g[2],l__g[3],l__g[5]];
			l_fn=variable_struct_get(gml_func_map,"ds_list_find_value");
			l_fn2=variable_struct_get(gml_func_map,"ds_list_set");
			if(l_fn!=undefined&&l_fn2!=undefined){
				compile_gml_compile_args_proc(l_actions,l_args1);
				ds_list_add(l_actions,gml_action_ds_aop(l__g[1],l__g[4],array_length(l_args1),l_fn.h_func,l_fn2.h_func,l_out));
				return false;
			} else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_map:
			l_fn=variable_struct_get(gml_func_map,"ds_map_find_value");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_map_set_hx:
			l_fn=variable_struct_get(gml_func_map,"ds_map_set");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3],l__g[4]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_map_aop:
			var l_args1=[l__g[2],l__g[3],l__g[5]];
			l_fn=variable_struct_get(gml_func_map,"ds_map_find_value");
			l_fn2=variable_struct_get(gml_func_map,"ds_map_set");
			if(l_fn!=undefined&&l_fn2!=undefined){
				compile_gml_compile_args_proc(l_actions,l_args1);
				ds_list_add(l_actions,gml_action_ds_aop(l__g[1],l__g[4],array_length(l_args1),l_fn.h_func,l_fn2.h_func,l_out));
				return false;
			} else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.key_id:
			l_fn=variable_struct_get(gml_func_map,"variable_struct_get");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.key_id_set:
			l_fn=variable_struct_get(gml_func_map,"variable_struct_set");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3],l__g[4]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.key_id_aop:
			var l_args1=[l__g[2],l__g[3],l__g[5]];
			l_fn=variable_struct_get(gml_func_map,"variable_struct_get");
			l_fn2=variable_struct_get(gml_func_map,"variable_struct_set");
			if(l_fn!=undefined&&l_fn2!=undefined){
				compile_gml_compile_args_proc(l_actions,l_args1);
				ds_list_add(l_actions,gml_action_ds_aop(l__g[1],l__g[4],array_length(l_args1),l_fn.h_func,l_fn2.h_func,l_out));
				return false;
			} else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_grid:
			l_fn=variable_struct_get(gml_func_map,"ds_grid_get");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3],l__g[4]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_grid_set_hx:
			l_fn=variable_struct_get(gml_func_map,"ds_grid_set");
			if(l_fn!=undefined)return compile_gml_compile_call_func_proc(l_actions,l__g[1],l_fn,[l__g[2],l__g[3],l__g[4],l__g[5]],l_out); else return gml_compile_error("Accessor not supported",l__g[1]);
		case gml_node.ds_grid_aop:
			var l_args1=[l__g[2],l__g[3],l__g[4],l__g[6]];
			l_fn=variable_struct_get(gml_func_map,"ds_grid_get");
			l_fn2=variable_struct_get(gml_func_map,"ds_grid_set");
			if(l_fn!=undefined&&l_fn2!=undefined){
				compile_gml_compile_args_proc(l_actions,l_args1);
				ds_list_add(l_actions,gml_action_ds_aop(l__g[1],l__g[5],array_length(l_args1),l_fn.h_func,l_fn2.h_func,l_out));
				return false;
			} else return gml_compile_error("Accessor not supported",l__g[1]);
		default:return undefined;
	}
}

if(live_enabled)
function compile_groups_gml_compile_group_ds_init(){
	// compile_groups_gml_compile_group_ds_init()
	/// @ignore
	gml_compile_set_handlers(compile_groups_gml_compile_group_ds_proc,["ds_list","ds_list_set","ds_list_aop","ds_map","ds_map_set","ds_map_aop","ds_grid","ds_grid_set","ds_grid_aop","key_id","key_id_set","key_id_aop"]);
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=l_scope[4][self.ind][(l_st[l_z]|0)];
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf1(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf1(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	var l_this1=l_scope[6];
	l_st[@l_z]=self.func(l_this1[l_this1[0]])[l_st[l_z]];
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf2(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf2(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	var l_this1=l_scope[6];
	l_st[@l_z]=variable_struct_get(l_this1[l_this1[0]],self.field)[l_st[l_z]];
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf3(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf3(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=l_scope[4][self.ind][(l_st[l_z]|0)];
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf4(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf4(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	var l_this1=l_scope[6];
	l_st[@l_z]=self.func(l_this1[l_this1[0]])[l_st[l_z]];
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf5(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf5(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	var l_this1=l_scope[6];
	l_st[@l_z]=variable_struct_get(l_this1[l_this1[0]],self.field)[l_st[l_z]];
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf6(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf6(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_scope[4][self.ind][@l_st[l_z]]=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf7(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf7(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_this2=self.func(l_this1[l_this1[0]]);
	l_this2[@l_st[l_z]]=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf8(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf8(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_arr=variable_struct_get(l_this1[l_this1[0]],self.field);
	l_arr[@l_st[l_z]]=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf9(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf9(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_scope[4][self.ind][@l_st[l_z]]=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf10(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf10(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_this2=self.func(l_this1[l_this1[0]]);
	l_this2[@l_st[l_z]]=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf11(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf11(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_arr=variable_struct_get(l_this1[l_this1[0]],self.field);
	l_arr[@l_st[l_z]]=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf12(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf12(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_w=l_scope[4][self.ind];
	var l_k=l_st[l_z];
	l_w[@l_k]=gml_op_apply_fns[self.op](l_w[l_k],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf13(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf13(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_w=self.func(l_this1[l_this1[0]]);
	var l_k=l_st[l_z];
	l_w[@l_k]=gml_op_apply_fns[self.op](l_w[l_k],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf14(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf14(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_w=variable_struct_get(l_this1[l_this1[0]],self.field);
	var l_k=l_st[l_z];
	l_w[@l_k]=gml_op_apply_fns[self.op](l_w[l_k],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf15(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf15(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_w=l_scope[4][self.ind];
	var l_k=l_st[l_z];
	l_w[@l_k]=gml_op_apply_fns[self.op](l_w[l_k],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf16(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf16(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_w=self.func(l_this1[l_this1[0]]);
	var l_k=l_st[l_z];
	l_w[@l_k]=gml_op_apply_fns[self.op](l_w[l_k],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc_lf17(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_array_proc_lf17(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_this1=l_scope[6];
	var l_w=variable_struct_get(l_this1[l_this1[0]],self.field);
	var l_k=l_st[l_z];
	l_w[@l_k]=gml_op_apply_fns[self.op](l_w[l_k],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_proc(l_q,l_actions,l_out){
	// compile_groups_gml_compile_group_array_proc(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.index:
			var l_d=l__g[1];
			var l_arr=l__g[2];
			var l_ind=l__g[3];
			var l_i;
			var l__g1=l_arr;
			if(l__g1[0]==43)l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]); else l_i=-1;
			if(l_i>=0){
				if(gml_compile_node(l_ind,l_actions,true))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local[]",{ind:l_i},compile_groups_gml_compile_group_array_proc_lf3));
				return false;
			}
			var l__g1=l_arr;
			if(l__g1[0]==55){
				if(l__g1[2][0]==14){
					var l_s=l__g1[3];
					if(gml_compile_node(l_ind,l_actions,true))return true;
					var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
					if(l_fastGetter!=undefined){
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.fast_field[]",{func:l_fastGetter},compile_groups_gml_compile_group_array_proc_lf4));
						return false;
					} else {
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.field[]",{field:l_s},compile_groups_gml_compile_group_array_proc_lf5));
						return false;
					}
				}
			}
			if(compile_gml_compile_args_proc(l_actions,[l_arr,l_ind]))return true;
			ds_list_add(l_actions,gml_action_index(l_d));
			break;
		case gml_node.raw_id:
			var l_d=l__g[1];
			var l_arr=l__g[2];
			var l_ind=l__g[3];
			var l_i;
			var l__g1=l_arr;
			if(l__g1[0]==43)l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]); else l_i=-1;
			if(l_i>=0){
				if(gml_compile_node(l_ind,l_actions,true))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local[]",{ind:l_i},compile_groups_gml_compile_group_array_proc_lf));
				return false;
			}
			var l__g1=l_arr;
			if(l__g1[0]==55){
				if(l__g1[2][0]==14){
					var l_s=l__g1[3];
					if(gml_compile_node(l_ind,l_actions,true))return true;
					var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
					if(l_fastGetter!=undefined){
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.fast_field[]",{func:l_fastGetter},compile_groups_gml_compile_group_array_proc_lf1));
						return false;
					} else {
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.field[]",{field:l_s},compile_groups_gml_compile_group_array_proc_lf2));
						return false;
					}
				}
			}
			if(compile_gml_compile_args_proc(l_actions,[l_arr,l_ind]))return true;
			ds_list_add(l_actions,gml_action_index(l_d));
			break;
		case gml_node.index_set:
			var l_d=l__g[1];
			var l_arr=l__g[2];
			var l_ind=l__g[3];
			var l_val=l__g[4];
			var l_i;
			var l__g1=l_arr;
			if(l__g1[0]==43)l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]); else l_i=-1;
			if(l_i>=0){
				if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local[]=",{ind:l_i},compile_groups_gml_compile_group_array_proc_lf9));
				return false;
			}
			var l__g1=l_arr;
			if(l__g1[0]==55){
				if(l__g1[2][0]==14){
					var l_s=l__g1[3];
					if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
					var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
					if(l_fastGetter!=undefined){
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.fast_field[]=",{func:l_fastGetter},compile_groups_gml_compile_group_array_proc_lf10));
						return false;
					} else {
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.field[]=",{field:l_s},compile_groups_gml_compile_group_array_proc_lf11));
						return false;
					}
				}
			}
			if(compile_gml_compile_args_proc(l_actions,[l_arr,l_ind,l_val]))return true;
			ds_list_add(l_actions,gml_action_index_set(l_d));
			break;
		case gml_node.raw_id_set:
			var l_d=l__g[1];
			var l_arr=l__g[2];
			var l_ind=l__g[3];
			var l_val=l__g[4];
			var l_i;
			var l__g1=l_arr;
			if(l__g1[0]==43)l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]); else l_i=-1;
			if(l_i>=0){
				if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local[]=",{ind:l_i},compile_groups_gml_compile_group_array_proc_lf6));
				return false;
			}
			var l__g1=l_arr;
			if(l__g1[0]==55){
				if(l__g1[2][0]==14){
					var l_s=l__g1[3];
					if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
					var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
					if(l_fastGetter!=undefined){
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.fast_field[]=",{func:l_fastGetter},compile_groups_gml_compile_group_array_proc_lf7));
						return false;
					} else {
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.field[]=",{field:l_s},compile_groups_gml_compile_group_array_proc_lf8));
						return false;
					}
				}
			}
			if(compile_gml_compile_args_proc(l_actions,[l_arr,l_ind,l_val]))return true;
			ds_list_add(l_actions,gml_action_index_set(l_d));
			break;
		case gml_node.index_aop:
			var l_d=l__g[1];
			var l_arr=l__g[2];
			var l_ind=l__g[3];
			var l_op=l__g[4];
			var l_val=l__g[5];
			var l_i;
			var l__g1=l_arr;
			if(l__g1[0]==43)l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]); else l_i=-1;
			if(l_i>=0){
				if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local[]=",{ind:l_i,op:l_op},compile_groups_gml_compile_group_array_proc_lf12));
				return false;
			}
			var l__g1=l_arr;
			if(l__g1[0]==55){
				if(l__g1[2][0]==14){
					var l_s=l__g1[3];
					if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
					var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
					if(l_fastGetter!=undefined){
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.fast_field[]=",{func:l_fastGetter,op:l_op},compile_groups_gml_compile_group_array_proc_lf13));
						return false;
					} else {
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.field[]=",{field:l_s,op:l_op},compile_groups_gml_compile_group_array_proc_lf14));
						return false;
					}
				}
			}
			if(compile_gml_compile_args_proc(l_actions,[l_arr,l_ind,l_val]))return true;
			ds_list_add(l_actions,gml_action_index_aop(l_d,l_op));
			break;
		case gml_node.raw_id_aop:
			var l_d=l__g[1];
			var l_arr=l__g[2];
			var l_ind=l__g[3];
			var l_op=l__g[4];
			var l_val=l__g[5];
			var l_i;
			var l__g1=l_arr;
			if(l__g1[0]==43)l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]); else l_i=-1;
			if(l_i>=0){
				if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local[]=",{ind:l_i,op:l_op},compile_groups_gml_compile_group_array_proc_lf15));
				return false;
			}
			var l__g1=l_arr;
			if(l__g1[0]==55){
				if(l__g1[2][0]==14){
					var l_s=l__g1[3];
					if(compile_gml_compile_args_proc(l_actions,[l_ind,l_val]))return true;
					var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
					if(l_fastGetter!=undefined){
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.fast_field[]=",{func:l_fastGetter,op:l_op},compile_groups_gml_compile_group_array_proc_lf16));
						return false;
					} else {
						ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"self.field[]=",{field:l_s,op:l_op},compile_groups_gml_compile_group_array_proc_lf17));
						return false;
					}
				}
			}
			if(compile_gml_compile_args_proc(l_actions,[l_arr,l_ind,l_val]))return true;
			ds_list_add(l_actions,gml_action_index_aop(l_d,l_op));
			break;
		case gml_node.index2d:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_index2d(l__g[1]));
			break;
		case gml_node.raw_id2d:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_index2d(l__g[1]));
			break;
		case gml_node.index2d_set:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4],l__g[5]]))return true;
			ds_list_add(l_actions,gml_action_index2d_set(l__g[1]));
			break;
		case gml_node.raw_id2d_set:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4],l__g[5]]))return true;
			ds_list_add(l_actions,gml_action_index2d_set(l__g[1]));
			break;
		case gml_node.index2d_aop:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4],l__g[6]]))return true;
			ds_list_add(l_actions,gml_action_index2d_aop(l__g[1],l__g[5]));
			break;
		case gml_node.raw_id2d_aop:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4],l__g[6]]))return true;
			ds_list_add(l_actions,gml_action_index2d_aop(l__g[1],l__g[5]));
			break;
		default:return undefined;
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_array_init(){
	// compile_groups_gml_compile_group_array_init()
	/// @ignore
	gml_compile_set_handlers(compile_groups_gml_compile_group_array_proc,["index","index_set","index_aop","raw_id","raw_id_set","raw_id_aop","index2d","index2d_set","index2d_aop","raw_id2d","raw_id2d_set","raw_id2d_aop"]);
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=self.val;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf1(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf1(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=self.val;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf2(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf2(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]/=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf3(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf3(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=l_scope[4];
	l_this1[@self.ind]=(l_scope[4][self.ind] div self.num);
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf4(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf4(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]-=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf5(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf5(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=(l_scope[4][self.ind]<<self.num);
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf6(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf6(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=(l_scope[4][self.ind]>>self.num);
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf7(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf7(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]|=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf8(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf8(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]&=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf9(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf9(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]^=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf10(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf10(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=l_scope[4][self.ind]==self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf11(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf11(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=l_scope[4][self.ind]!=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf12(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf12(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=l_scope[4][self.ind]<=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf13(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf13(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=l_scope[4][self.ind]>self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf14(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf14(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=l_scope[4][self.ind]>=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf15(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf15(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]=l_scope[4][self.ind]<self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf16(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf16(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]+=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf17(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf17(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]/=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc_lf18(l_th,l_v,l_scope,l_st){
	// compile_groups_gml_compile_group_local_proc_lf18(th:gml_thread, v:vm_v2_gml_action_closure<any>, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[4][@self.ind]*=self.num;
	return 0;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_proc(l_q,l_actions,l_out){
	// compile_groups_gml_compile_group_local_proc(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l_i,l_vi;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.var_decl:
			var l_d=l__g[1];
			var l_s=l__g[2];
			var l_x=l__g[3];
			if(l_x!=undefined){
				l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l_s);
				if(gml_compile_const_val_of(l_x)){
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local = const",{ind:l_i,name:l_s,val:gml_compile_const_val_of_val},compile_groups_gml_compile_group_local_proc_lf));
					return false;
				}
				if(gml_compile_node(l_x,l_actions,true))return true;
				ds_list_add(l_actions,gml_action_local_set(l_d,l_i,l_s));
			}
			break;
		case gml_node.local_hx:
			var l_s=l__g[2];
			ds_list_add(l_actions,gml_action_local_hx(l__g[1],variable_struct_get(gml_compile_curr_script.h_local_map,l_s),l_s));
			break;
		case gml_node.local_set:
			var l_d=l__g[1];
			var l_s=l__g[2];
			var l_x=l__g[3];
			l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l_s);
			if(gml_compile_const_val_of(l_x)){
				ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local = const",{ind:l_i,name:l_s,val:gml_compile_const_val_of_val},compile_groups_gml_compile_group_local_proc_lf1));
				return false;
			}
			if(gml_compile_node(l_x,l_actions,true))return true;
			ds_list_add(l_actions,gml_action_local_set(l_d,l_i,l_s));
			break;
		case gml_node.local_aop:
			var l_d=l__g[1];
			var l_s=l__g[2];
			var l_o=l__g[3];
			var l_x=l__g[4];
			l_i=variable_struct_get(gml_compile_curr_script.h_local_map,l_s);
			if(gml_compile_const_val_of(l_x))switch(l_o){
				case 2:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local %= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf2));
					return false;
				case 3:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local div= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf3));
					return false;
				case 17:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local -= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf4));
					return false;
				case 32:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local <<= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf5));
					return false;
				case 33:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local >>= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf6));
					return false;
				case 48:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local |= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf7));
					return false;
				case 49:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local &= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf8));
					return false;
				case 50:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local ^= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf9));
					return false;
				case 64:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local eq= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf10));
					return false;
				case 65:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local ne= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf11));
					return false;
				case 67:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local le= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf12));
					return false;
				case 68:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local gt= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf13));
					return false;
				case 69:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local ge= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf14));
					return false;
				case 66:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local lt= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf15));
					return false;
				case 16:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local += number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf16));
					return false;
				case 1:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local /= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf17));
					return false;
				case 0:
					ds_list_add(l_actions,vm_v2_gml_action_closure_bind(l_d,"local *= number",{
						ind:l_i,
						name:l_s,
						num:gml_compile_const_val_of_val,
						op:l_o
					},compile_groups_gml_compile_group_local_proc_lf18));
					return false;
			}
			if(gml_compile_node(l_x,l_actions,true))return true;
			ds_list_add(l_actions,gml_action_local_aop(l_d,l_o,variable_struct_get(gml_compile_curr_script.h_local_map,l_s),l_s));
			break;
		default:return undefined;
	}
	return false;
}

if(live_enabled)
function compile_groups_gml_compile_group_local_init(){
	// compile_groups_gml_compile_group_local_init()
	/// @ignore
	gml_compile_set_handlers(compile_groups_gml_compile_group_local_proc,["var_decl","local","local_set","local_aop"]);
}

if(live_enabled)
function gml_stack_push(l_this1,l_v){
	// gml_stack_push(this:array<T>, v:T)
	/// @ignore
	var l_i=l_this1[0]+1;
	if(l_i>=array_length(l_this1))l_this1[@array_length(l_this1)*2]=0;
	l_this1[@l_i]=l_v;
	l_this1[@0]=l_i;
}

if(live_enabled)
function gml_stack_pop(l_this1){
	// gml_stack_pop(this:array<T>)->T
	/// @ignore
	var l_i=l_this1[0];
	var l_r=l_this1[l_i];
	l_this1[@l_i]=0;
	l_this1[@0]=(l_i-1);
	return l_r;
}

if(live_enabled)
function gml_stack_pop_multi(l_this1,l_n){
	// gml_stack_pop_multi(this:array<T>, n:int)->array<T>
	/// @ignore
	var l_arr=[];
	var l_k=l_this1[0]-l_n;
	array_copy(l_arr,0,l_this1,l_k+1,l_n);
	array_copy(l_this1,l_k+1,gml_stack_fill_value_arr,0,l_n);
	l_this1[@0]=l_k;
	return l_arr;
}

if(live_enabled)
function gml_stack_discard(l_this1){
	// gml_stack_discard(this:array<T>)
	/// @ignore
	var l_i=l_this1[0];
	l_this1[@l_i]=0;
	l_this1[@0]=(l_i-1);
}

if(live_enabled)
function gml_stack_discard_multi(l_this1,l_n){
	// gml_stack_discard_multi(this:array<T>, n:int)
	/// @ignore
	var l_i=l_this1[0]-l_n;
	array_copy(l_this1,l_i+1,gml_stack_fill_value_arr,0,l_n);
	l_this1[@0]=l_i;
}

if(live_enabled)
function gml_compile_error(l_text,l_pos){
	// gml_compile_error(text:string, pos:gml_pos)->bool
	/// @ignore
	gml_compile_error_text=gml_pos_to_string(l_pos,gml_compile_curr_program)+" "+l_text;
	gml_compile_error_pos=l_pos;
	return true;
}

if(live_enabled)
function gml_compile_const_val_of(l_q){
	// gml_compile_const_val_of(q:ast_GmlNode)->bool
	/// @ignore
	var l__g=l_q;
	var l_tmp;
	switch(l__g[0]){
		case gml_node.undefined_hx:l_tmp=undefined;break;
		case gml_node.number:l_tmp=l__g[2];break;
		case gml_node.cstring:l_tmp=l__g[2];break;
		case gml_node.other_const:l_tmp=l__g[2];break;
		case gml_node.const:l_tmp=variable_struct_get(gml_const_val,l__g[2]);break;
		default:return false;
	}
	gml_compile_const_val_of_val=l_tmp;
	return true;
}

if(live_enabled)
function gml_compile_set_handlers(l_fn,l_defNames){
	// gml_compile_set_handlers(fn:function<q:ast_GmlNode;actions:gml_action_list;out:bool;bool?>, defNames:array<string>)
	/// @ignore
	var l__g=0;
	while(l__g<array_length(l_defNames)){
		var l_defName=l_defNames[l__g];
		l__g++;
		var l_i=variable_struct_get(gml_compile_def_indexes.h_obj,l_defName);
		if(l_i==undefined)show_error("Couldn't find "+l_defName,true);
		if(gml_compile_handlers[l_i]!=undefined)show_debug_message(("Handler re-definition for "+l_defName));
		gml_compile_handlers[@l_i]=l_fn;
	}
}

if(live_enabled)
function gml_compile_init(){
	// gml_compile_init()->gml_script?
	/// @ignore
	gml_compile_def_indexes=new haxe_ds_string_map();
	var l_names=gml_std_gml_internal_ArrayImpl_copy(g_gml_node_constructors);
	var l__g_current=0;
	var l__g_array=l_names;
	while(l__g_current<array_length(l__g_array)){
		var l_name=l__g_array[l__g_current];
		var l_i=l__g_current++;
		if(gml_std_StringTools_endsWith(l_name,"_hx"))l_name=gml_std_string_substring(l_name,0,string_length(l_name)-3);
		variable_struct_set(gml_compile_def_indexes.h_obj,l_name,l_i);
	}
	gml_compile_handlers=array_create(array_length(l_names),undefined);
	compile_groups_gml_compile_group_literal_init();
	compile_groups_gml_compile_group_ds_init();
	compile_groups_gml_compile_group_array_init();
	compile_groups_gml_compile_group_local_init();
	compile_groups_gml_compile_group_static_init();
	return undefined;
}

if(live_enabled)
function gml_compile_node(l_q,l_actions,l_out){
	// gml_compile_node(q:ast_GmlNode, actions:gml_action_list, out:bool)->bool?
	/// @ignore
	var l_h=gml_compile_handlers[l_q[0]];
	if(l_h!=undefined){
		var l_z=l_h(l_q,l_actions,l_out);
		if(l_z!=undefined)return l_z;
	}
	var l_x,l_x2,l_w,l_i,l_k,l_z,l_n,l_p0,l_p1,l_p2,l_p3,l_pc,l_pb,l_s,l_v,l_d,l_o,l_fn,l_fn2;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.ensure_array_for_local:ds_list_add(l_actions,gml_action_ensure_array_for_local(l__g[1],variable_struct_get(gml_compile_curr_script.h_local_map,l__g[2])));break;
		case gml_node.ensure_array_for_global:ds_list_add(l_actions,gml_action_ensure_array_for_global(l__g[1],l__g[2]));break;
		case gml_node.ensure_array_for_field:
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_ensure_array_for_field(l__g[1],l__g[3]));
			break;
		case gml_node.ensure_array_for_index:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,gml_action_ensure_array_for_index(l__g[1]));
			break;
		case gml_node.ensure_array_for_index2d:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_ensure_array_for_index2d(l__g[1]));
			break;
		case gml_node.in:
			var l__field=l__g[2];
			var l__g1=l__field;
			if(l__g1[0]==3){
				if(gml_compile_node(l__g[3],l_actions,true))return true;
				ds_list_add(l_actions,gml_action_in_const(l__g[1],l__g1[2],l__g[4]));
			} else {
				if(compile_gml_compile_args_proc(l_actions,[l__field,l__g[3]]))return true;
				ds_list_add(l_actions,gml_action_in(l__g[1],l__g[4]));
			}
			break;
		case gml_node.global_hx:ds_list_add(l_actions,gml_action_global_hx(l__g[1],l__g[2]));break;
		case gml_node.global_set:
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_global_set(l__g[1],l__g[2]));
			break;
		case gml_node.global_aop:
			if(gml_compile_node(l__g[4],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_global_aop(l__g[1],l__g[3],l__g[2]));
			break;
		case gml_node.field:
			var l_x1=l__g[2];
			var l_s=l__g[3];
			var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
			var l__g1=l_x1;
			switch(l__g1[0]){
				case gml_node.self_hx:if(l_fastGetter!=undefined)ds_list_add(l_actions,gml_action_fast_self_field(l__g[1],l_fastGetter)); else ds_list_add(l_actions,gml_action_self_field(l__g[1],l_s));break;
				case gml_node.local_hx:
					var l_i1=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]);
					if(l_fastGetter!=undefined)ds_list_add(l_actions,gml_action_fast_local_field(l__g[1],l_i1,l_fastGetter)); else ds_list_add(l_actions,gml_action_local_field(l__g[1],l_i1,l_s));
					break;
				default:
					if(gml_compile_node(l_x1,l_actions,true))return true;
					if(l_fastGetter!=undefined)ds_list_add(l_actions,gml_action_call_func1o(l__g[1],l_fastGetter)); else ds_list_add(l_actions,gml_action_field(l__g[1],l_s));
			}
			break;
		case gml_node.field_set:
			var l_x1=l__g[2];
			var l_s=l__g[3];
			var l_fastSetter=gml_compile_curr_program.h_get_fast_setter(l_s);
			var l__g1=l_x1;
			switch(l__g1[0]){
				case gml_node.self_hx:
					if(gml_compile_node(l__g[4],l_actions,true))return true;
					if(l_fastSetter!=undefined)ds_list_add(l_actions,gml_action_fast_self_field_set(l__g[1],l_fastSetter)); else ds_list_add(l_actions,gml_action_self_field_set(l__g[1],l_s));
					break;
				case gml_node.local_hx:
					var l_i1=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]);
					if(gml_compile_node(l__g[4],l_actions,true))return true;
					if(l_fastSetter!=undefined)ds_list_add(l_actions,gml_action_fast_local_field_set(l__g[1],l_i1,l_fastSetter)); else ds_list_add(l_actions,gml_action_local_field_set(l__g[1],l_i1,l_s));
					break;
				default:
					if(compile_gml_compile_args_proc(l_actions,[l_x1,l__g[4]]))return true;
					if(l_fastSetter!=undefined)ds_list_add(l_actions,gml_action_call_func2(l__g[1],l_fastSetter)); else ds_list_add(l_actions,gml_action_field_set(l__g[1],l_s));
			}
			break;
		case gml_node.field_aop:
			var l_x1=l__g[2];
			var l_s=l__g[3];
			var l_fastGetter=gml_compile_curr_program.h_get_fast_getter(l_s);
			var l_fastSetter=gml_compile_curr_program.h_get_fast_setter_after_getter(l_s);
			var l__g1=l_x1;
			switch(l__g1[0]){
				case gml_node.self_hx:
					if(gml_compile_node(l__g[5],l_actions,true))return true;
					if(l_fastGetter!=undefined&&l_fastSetter!=undefined)ds_list_add(l_actions,gml_action_fast_self_field_aop(l__g[1],l__g[4],l_fastGetter,l_fastSetter)); else ds_list_add(l_actions,gml_action_self_field_aop(l__g[1],l__g[4],l_s));
					break;
				case gml_node.local_hx:
					var l_i1=variable_struct_get(gml_compile_curr_script.h_local_map,l__g1[2]);
					if(gml_compile_node(l__g[5],l_actions,true))return true;
					if(l_fastGetter!=undefined&&l_fastSetter!=undefined)ds_list_add(l_actions,gml_action_fast_local_field_aop(l__g[1],l_i1,l__g[4],l_fastGetter,l_fastSetter)); else ds_list_add(l_actions,gml_action_local_field_aop(l__g[1],l_i1,l__g[4],l_s));
					break;
				default:
					if(compile_gml_compile_args_proc(l_actions,[l_x1,l__g[5]]))return true;
					if(l_fastGetter!=undefined&&l_fastSetter!=undefined)ds_list_add(l_actions,gml_action_fast_field_aop(l__g[1],l__g[4],l_fastGetter,l_fastSetter)); else ds_list_add(l_actions,gml_action_field_aop(l__g[1],l__g[4],l_s));
			}
			break;
		case gml_node.alarm:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3]]))return true;
			ds_list_add(l_actions,gml_action_alarm(l__g[1]));
			break;
		case gml_node.alarm_set_hx:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_alarm_set_hx(l__g[1]));
			break;
		case gml_node.alarm_aop:
			if(compile_gml_compile_args_proc(l_actions,[l__g[2],l__g[3],l__g[5]]))return true;
			ds_list_add(l_actions,gml_action_alarm_aop(l__g[1],l__g[4]));
			break;
		case gml_node.env:ds_list_add(l_actions,gml_action_env(l__g[1],l__g[2].h_func));break;
		case gml_node.env_set:
			var l_av=l__g[2];
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_env_set(l__g[1],l_av.h_func,l_av.h_type_check));
			break;
		case gml_node.env_aop:
			if(gml_compile_node(l__g[4],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_env_aop(l__g[1],l__g[3],l__g[2].h_func));
			break;
		case gml_node.env1d:
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_env1d(l__g[1],l__g[2].h_func));
			break;
		case gml_node.env1d_set:
			var l_av=l__g[2];
			if(compile_gml_compile_args_proc(l_actions,[l__g[3],l__g[4]]))return true;
			ds_list_add(l_actions,gml_action_env1d_set(l__g[1],l_av.h_func,l_av.h_type_check));
			break;
		case gml_node.env1d_aop:
			if(compile_gml_compile_args_proc(l_actions,[l__g[3],l__g[5]]))return true;
			ds_list_add(l_actions,gml_action_env1d_aop(l__g[1],l__g[4],l__g[2].h_func));
			break;
		case gml_node.arg_const:ds_list_add(l_actions,gml_action_arg_const(l__g[1],l__g[2]));break;
		case gml_node.arg_index:
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_arg_index(l__g[1]));
			break;
		case gml_node.arg_count:ds_list_add(l_actions,gml_action_arg_count(l__g[1]));break;
		case gml_node.set_op:
			l_d=l__g[1];
			l_o=l__g[2];
			l_x=l__g[3];
			l_x2=l__g[4];
			var l__g1=l_x;
			switch(l__g1[0]){
				case gml_node.arg_const:
					l_i=l__g1[2];
					if(gml_compile_node(l_x2,l_actions,true))return true;
					if(l_o!=-1)ds_list_add(l_actions,gml_action_arg_const_aop(l_d,l_o,l_i)); else ds_list_add(l_actions,gml_action_arg_const_set(l_d,l_i));
					break;
				case gml_node.arg_index:
					if(gml_compile_node(l__g1[2],l_actions,true))return true;
					if(gml_compile_node(l_x2,l_actions,true))return true;
					if(l_o!=-1)ds_list_add(l_actions,gml_action_arg_index_aop(l_d,l_o)); else ds_list_add(l_actions,gml_action_arg_index_set(l_d));
					break;
				default:return gml_compile_error("Cannot set "+gml_std_Type_enumConstructor(l_x),l_d);
			}
			break;
		case gml_node.bin_op:return compile_gml_compile_bin_op_proc(l_actions,l__g[1],l__g[2],l__g[3],l__g[4]);
		case gml_node.un_op:
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_un_op(l__g[1],l__g[3]));
			break;
		case gml_node.prefix:return compile_gml_compile_adjfix_proc(l__g[1],l__g[2],true,l__g[3],l_actions,l_out);
		case gml_node.postfix:return compile_gml_compile_adjfix_proc(l__g[1],l__g[2],false,l__g[3],l_actions,l_out);
		case gml_node.call_script:
			l_d=l__g[1];
			l_w=l__g[3];
			l_n=array_length(l_w);
			for(l_i=0;l_i<l_n;l_i++){
				if(gml_compile_node(l_w[l_i],l_actions,true))return true;
			}
			ds_list_add(l_actions,gml_action_call_script(l_d,variable_struct_get(gml_compile_curr_program.h_script_map,l__g[2]),l_n));
			if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
			break;
		case gml_node.call_script_id:
			l_d=l__g[1];
			l_w=l__g[3];
			l_n=array_length(l_w);
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			for(l_i=0;l_i<l_n;l_i++){
				if(gml_compile_node(l_w[l_i],l_actions,true))return true;
			}
			ds_list_add(l_actions,gml_action_call_script_id(l_d,l_n));
			if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
			break;
		case gml_node.call_field:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_w=l__g[4];
			l_n=array_length(l_w);
			for(l_i=0;l_i<l_n;l_i++){
				gml_compile_node(l_w[l_i],l_actions,true);
			}
			ds_list_add(l_actions,gml_action_call_field(l_d,l__g[3],l_n));
			if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
			break;
		case gml_node.call_func_at:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_w=l__g[4];
			l_n=array_length(l_w);
			for(l_i=0;l_i<l_n;l_i++){
				gml_compile_node(l_w[l_i],l_actions,true);
			}
			ds_list_add(l_actions,gml_action_call_field(l_d,l__g[3],l_n));
			if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
			break;
		case gml_node.construct:
			l_d=l__g[1];
			l_w=l__g[3];
			l_n=array_length(l_w);
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			for(l_i=0;l_i<l_n;l_i++){
				if(gml_compile_node(l_w[l_i],l_actions,true))return true;
			}
			ds_list_add(l_actions,gml_action_construct(l_d,l_n));
			if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
			break;
		case gml_node.call_script_with_array:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_call_script_with_array(l_d));
			if(l_out)ds_list_add(l_actions,gml_action_result(l_d));
			break;
		case gml_node.call_script_at:
			l_d=l__g[1];
			return gml_compile_error("dot-calls are currently not supported.",l_d);
		case gml_node.call_func:return compile_gml_compile_call_func_proc(l_actions,l__g[1],l__g[2],l__g[3],l_out);
		case gml_node.func_literal:ds_list_add(l_actions,gml_action_func_literal(l__g[1],l__g[2],l__g[3]));break;
		case gml_node.block:
			l_w=l__g[2];
			l_n=array_length(l_w);
			if(l_n>0){
				l_n--;
				for(l_i=0;l_i<l_n;l_i++){
					if(gml_compile_node(l_w[l_i],l_actions,false))return true;
				}
				if(gml_compile_node(l_w[l_i],l_actions,l_out))return true;
			}
			break;
		case gml_node.if_then:
			l_d=l__g[1];
			l_x=l__g[4];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_i=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_jump_unless(l_d,0));
			if(gml_compile_node(l__g[3],l_actions,false))return true;
			if(l_x!=undefined){
				l_n=ds_list_size(l_actions);
				ds_list_add(l_actions,gml_action_jump(l_d,0));
				ds_list_set(l_actions,l_i,gml_action_jump_unless(l_d,ds_list_size(l_actions)));
				if(gml_compile_node(l_x,l_actions,false))return true;
				ds_list_set(l_actions,l_n,gml_action_jump(l_d,ds_list_size(l_actions)));
			} else ds_list_set(l_actions,l_i,gml_action_jump_unless(l_d,ds_list_size(l_actions)));
			break;
		case gml_node.ternary:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_i=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_jump_unless(l_d,0));
			if(gml_compile_node(l__g[3],l_actions,l_out))return true;
			l_n=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_jump(l_d,0));
			ds_list_set(l_actions,l_i,gml_action_jump_unless(l_d,ds_list_size(l_actions)));
			if(gml_compile_node(l__g[4],l_actions,l_out))return true;
			ds_list_set(l_actions,l_n,gml_action_jump(l_d,ds_list_size(l_actions)));
			break;
		case gml_node.null_co:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_i=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_jump_placeholder(l_d));
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			ds_list_set(l_actions,l_i,gml_action_null_co(l_d,ds_list_size(l_actions)));
			if(!l_out)ds_list_add(l_actions,gml_action_discard(l_d));
			break;
		case gml_node.repeat_hx:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_n=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_repeat_pre(l_d,0));
			l_p0=ds_list_size(l_actions);
			l_pc=gml_compile_curr_continue;
			l_pb=gml_compile_curr_break;
			gml_compile_curr_continue=l_p0;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[3],l_actions,false))return true;
			gml_compile_curr_continue=l_pc;
			gml_compile_curr_break=l_pb;
			l_p1=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_repeat_jump(l_d,l_p0));
			l_p2=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_discard(l_d));
			for(l_k=l_p0;l_k<l_p2;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				switch(l__g1.__enumIndex__){
					case 105:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p1));break;
					case 104:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p2));break;
				}
			}
			ds_list_set(l_actions,l_n,gml_action_repeat_pre(l_d,ds_list_size(l_actions)));
			break;
		case gml_node.while_hx:
			l_d=l__g[1];
			l_p0=ds_list_size(l_actions);
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_p1=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_jump_unless(l_d,0));
			l_pc=gml_compile_curr_continue;
			l_pb=gml_compile_curr_break;
			gml_compile_curr_continue=l_p0;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[3],l_actions,false))return true;
			gml_compile_curr_continue=l_pc;
			gml_compile_curr_break=l_pb;
			ds_list_add(l_actions,gml_action_jump(l_d,l_p0));
			l_p2=ds_list_size(l_actions);
			ds_list_set(l_actions,l_p1,gml_action_jump_unless(l_d,l_p2));
			for(l_k=l_p1;l_k<l_p2;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				switch(l__g1.__enumIndex__){
					case 105:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p0));break;
					case 104:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p2));break;
				}
			}
			break;
		case gml_node.do_until:
			l_d=l__g[1];
			l_p0=ds_list_size(l_actions);
			l_pc=gml_compile_curr_continue;
			l_pb=gml_compile_curr_break;
			gml_compile_curr_continue=l_p0;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[2],l_actions,false))return true;
			gml_compile_curr_continue=l_pc;
			gml_compile_curr_break=l_pb;
			l_p1=ds_list_size(l_actions);
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			var l__g1=l_q;
			if((l__g1[0]==102))ds_list_add(l_actions,gml_action_jump_unless(l_d,l_p0)); else ds_list_add(l_actions,gml_action_jump_if(l_d,l_p0));
			l_p2=ds_list_size(l_actions);
			for(l_k=l_p0;l_k<l_p1;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				switch(l__g1.__enumIndex__){
					case 105:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p1));break;
					case 104:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p2));break;
				}
			}
			break;
		case gml_node.do_while:
			l_d=l__g[1];
			l_p0=ds_list_size(l_actions);
			l_pc=gml_compile_curr_continue;
			l_pb=gml_compile_curr_break;
			gml_compile_curr_continue=l_p0;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[2],l_actions,false))return true;
			gml_compile_curr_continue=l_pc;
			gml_compile_curr_break=l_pb;
			l_p1=ds_list_size(l_actions);
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			var l__g1=l_q;
			if((l__g1[0]==102))ds_list_add(l_actions,gml_action_jump_unless(l_d,l_p0)); else ds_list_add(l_actions,gml_action_jump_if(l_d,l_p0));
			l_p2=ds_list_size(l_actions);
			for(l_k=l_p0;l_k<l_p1;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				switch(l__g1.__enumIndex__){
					case 105:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p1));break;
					case 104:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p2));break;
				}
			}
			break;
		case gml_node.for_hx:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,false))return true;
			l_p0=ds_list_size(l_actions);
			if(gml_compile_node(l__g[3],l_actions,true))return true;
			l_p1=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_jump_unless(l_d,0));
			l_pc=gml_compile_curr_continue;
			l_pb=gml_compile_curr_break;
			gml_compile_curr_continue=l_p0;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[5],l_actions,false))return true;
			gml_compile_curr_continue=l_pc;
			gml_compile_curr_break=l_pb;
			l_p2=ds_list_size(l_actions);
			l_pb=gml_compile_curr_break;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[4],l_actions,false))return true;
			gml_compile_curr_break=l_pb;
			ds_list_add(l_actions,gml_action_jump(l_d,l_p0));
			l_p3=ds_list_size(l_actions);
			ds_list_set(l_actions,l_p1,gml_action_jump_unless(l_d,l_p3));
			for(l_k=l_p1;l_k<l_p3;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				switch(l__g1.__enumIndex__){
					case 105:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p2));break;
					case 104:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p3));break;
				}
			}
			break;
		case gml_node.switch_hx:
			var l__cc=l__g[3];
			l_d=l__g[1];
			var l_jt=ds_map_create();
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			l_p0=ds_list_size(l_actions);
			l_n=array_length(l__cc);
			for(l_i=0;l_i<l_n;l_i++){
				var l__cv=l__cc[l_i].values;
				l_z=array_length(l__cv);
				for(l_k=0;l_k<l_z;l_k++){
					if(gml_node_tools_to_case_value(l__cv[l_k])==undefined)break;
				}
				if(l_k<l_z)break;
			}
			if(l_i<l_n){
				var l_caseLabels=[];
				l_pb=gml_compile_curr_break;
				gml_compile_curr_break=l_p0;
				for(l_i=0;l_i<l_n;l_i++){
					var l__cv=l__cc[l_i].values;
					l_z=array_length(l__cv);
					var l_cl1=[];
					for(l_k=0;l_k<l_z;l_k++){
						if(gml_compile_node(l__cv[l_k],l_actions,true))return true;
						l_cl1[@l_k]=ds_list_size(l_actions);
						ds_list_add(l_actions,gml_action_switch_case(l_d,0));
					}
					l_caseLabels[@l_i]=l_cl1;
				}
				ds_list_add(l_actions,gml_action_discard(l_d));
				var l_defCasePos=ds_list_size(l_actions);
				ds_list_add(l_actions,gml_action_jump(l_d,0));
				for(l_i=0;l_i<l_n;l_i++){
					var l_cl1=l_caseLabels[l_i];
					l_z=array_length(l_cl1);
					for(l_k=0;l_k<l_z;l_k++){
						ds_list_set(l_actions,l_cl1[l_k],gml_action_switch_case(l_d,ds_list_size(l_actions)));
					}
					if(gml_compile_node(l__cc[l_i].expr,l_actions,false))return true;
				}
				ds_list_set(l_actions,l_defCasePos,gml_action_jump(l_d,ds_list_size(l_actions)));
				l_x=l__g[4];
				if(l_x!=undefined){
					if(gml_compile_node(l_x,l_actions,false))return true;
				}
				gml_compile_curr_break=l_pb;
			} else {
				ds_list_add(l_actions,gml_action_switch_hx(l_d,l_jt,0));
				l_pb=gml_compile_curr_break;
				gml_compile_curr_break=l_p0;
				l_n=array_length(l__cc);
				for(l_i=0;l_i<l_n;l_i++){
					var l__cv=l__cc[l_i].values;
					l_z=array_length(l__cv);
					for(l_k=0;l_k<l_z;l_k++){
						ds_map_set(l_jt,gml_node_tools_to_case_value(l__cv[l_k]),ds_list_size(l_actions));
					}
					if(gml_compile_node(l__cc[l_i].expr,l_actions,false))return true;
				}
				l_p1=ds_list_size(l_actions);
				l_x=l__g[4];
				if(l_x!=undefined){
					if(gml_compile_node(l_x,l_actions,false))return true;
				}
				gml_compile_curr_break=l_pb;
				ds_list_set(l_actions,l_p0,gml_action_switch_hx(l_d,l_jt,l_p1));
			}
			l_p2=ds_list_size(l_actions);
			for(l_k=l_p0;l_k<l_p2;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				if(l__g1.__enumIndex__==104){
					var l_d1=l__g1.h_d;
					if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l_d1,l_p2));
				}
			}
			break;
		case gml_node.with_hx:
			l_d=l__g[1];
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_with_pre(l_d));
			l_p0=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_with_next(l_d,0));
			l_pc=gml_compile_curr_continue;
			l_pb=gml_compile_curr_break;
			gml_compile_curr_continue=l_p0;
			gml_compile_curr_break=l_p0;
			if(gml_compile_node(l__g[3],l_actions,false))return true;
			gml_compile_curr_continue=l_pc;
			gml_compile_curr_break=l_pb;
			ds_list_add(l_actions,gml_action_jump(l_d,l_p0));
			l_p1=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_with_post(l_d));
			ds_list_set(l_actions,l_p0,gml_action_with_next(l_d,l_p1));
			for(l_k=l_p0;l_k<l_p1;l_k++){
				var l__g1=ds_list_find_value(l_actions,l_k);
				switch(l__g1.__enumIndex__){
					case 105:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p0));break;
					case 104:if(l__g1.h_lp==l_p0)ds_list_set(l_actions,l_k,gml_action_jump(l__g1.h_d,l_p1));break;
				}
			}
			break;
		case gml_node.try_catch:
			l_d=l__g[1];
			l_p0=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_try_hx(l_d,0));
			if(gml_compile_node(l__g[2],l_actions,false))return true;
			l_p1=ds_list_size(l_actions);
			ds_list_add(l_actions,gml_action_finally_hx(l_d,0));
			ds_list_set(l_actions,l_p0,gml_action_try_hx(l_d,ds_list_size(l_actions)));
			ds_list_add(l_actions,gml_action_catch_hx(l_d,variable_struct_get(gml_compile_curr_script.h_local_map,l__g[3])));
			if(gml_compile_node(l__g[4],l_actions,false))return true;
			ds_list_set(l_actions,l_p1,gml_action_finally_hx(l_d,ds_list_size(l_actions)));
			break;
		case gml_node.throw_hx:
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_throw_hx(l__g[1]));
			break;
		case gml_node.break_hx:
			l_d=l__g[1];
			l_i=gml_compile_curr_break;
			if(l_i>=0)ds_list_add(l_actions,gml_action_break_hx(l_d,l_i)); else return gml_compile_error("Cannot `break` here",l_d);
			break;
		case gml_node.continue_hx:
			l_d=l__g[1];
			l_i=gml_compile_curr_continue;
			if(l_i>=0)ds_list_add(l_actions,gml_action_continue_hx(l_d,l_i)); else return gml_compile_error("Cannot `continue` here",l_d);
			break;
		case gml_node.return_hx:
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_return_hx(l__g[1]));
			break;
		case gml_node.exit_hx:
			l_d=l__g[1];
			ds_list_add(l_actions,gml_action_return_const(l_d,gml_compile_curr_program.h_get_source(l_d[0]).h_version.h_default_ret_value));
			break;
		case gml_node.wait:
			if(gml_compile_node(l__g[2],l_actions,true))return true;
			ds_list_add(l_actions,gml_action_wait(l__g[1]));
			break;
		case gml_node.delete_hx:if(compile_gml_compile_delete_proc(l_actions,l__g[1],l__g[2]))return true;break;
		case gml_node.fork:ds_list_add(l_actions,gml_action_fork(l__g[1],l_out));break;
		default:return gml_compile_error("Cannot compile "+gml_std_Type_enumConstructor(l_q),gml_std_haxe_enum_tools_getParameter(l_q,0));
	}
	return false;
}

if(live_enabled)
function gml_compile_add_exit(l_actions){
	// gml_compile_add_exit(actions:gml_action_list)
	/// @ignore
	gml_compile_node([gml_node.exit_hx,gml_compile_curr_script.h_pos],l_actions,false);
}

if(live_enabled)
function gml_compile_script(l_q){
	// gml_compile_script(q:gml_script)->bool
	/// @ignore
	var l_actions=ds_list_create();
	l_q.h_actions=l_actions;
	gml_compile_curr_script=l_q;
	gml_compile_curr_break=-1;
	gml_compile_curr_continue=-1;
	var l_trouble;
	l_trouble=compile_groups_gml_compile_group_static_proc_static_init(l_actions);
	if(!l_trouble)l_trouble=gml_compile_node(l_q.h_node,l_actions,false);
	if(!l_trouble)gml_compile_add_exit(l_actions);
	if(!l_trouble){
		for(var l_i=0,l__g1=ds_list_size(l_actions);l_i<l__g1;l_i++){
			var l_a=ds_list_find_value(l_actions,l_i);
			if(l_a.__enumIndex__==123)l_a.__func__=l_a.h_fn; else l_a.__func__=vm_v2_gml_thread_v2_handlers[l_a.__enumIndex__];
		}
	}
	gml_compile_curr_script=undefined;
	return l_trouble;
}

if(live_enabled)
function gml_compile_program(l_p){
	// gml_compile_program(p:gml_program)->bool
	/// @ignore
	gml_compile_curr_program=l_p;
	var l_arr=l_p.h_script_array;
	var l_i;
	var l_num=array_length(l_arr);
	for(l_i=0;l_i<l_num;l_i++){
		if(gml_compile_script(l_arr[l_i]))break;
	}
	gml_compile_curr_program=undefined;
	return l_i<l_num;
}

if(live_enabled)
function haxe_ds__vector_vector_impl__fill(l_this1,l_v){
	// haxe_ds__vector_vector_impl__fill(this:haxe_ds__Vector_VectorData<T>, v:T)
	/// @ignore
	for(var l_i=0,l__g1=array_length(l_this1);l_i<l__g1;l_i++){
		l_this1[@l_i]=l_v;
	}
}

if(live_enabled)
function api_api_version(l_name)constructor{
	// api_api_version(name:string)
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_has_string_escape_characters=undefined; /// @is {bool}
	static h_has_literal_strings=undefined; /// @is {bool}
	static h_has_template_strings=undefined; /// @is {bool}
	static h_has_js_template_strings=undefined; /// @is {bool}
	static h_has_struct_accessor=undefined; /// @is {bool}
	static h_has_func_literal=undefined; /// @is {bool}
	static h_has_constructor=undefined; /// @is {bool}
	static h_has_try_catch=undefined; /// @is {bool}
	static h_has_value_calls=undefined; /// @is {bool}
	static h_has_delete=undefined; /// @is {bool}
	static h_default_ret_value=undefined; /// @is {any}
	static h_expr_macros=undefined; /// @is {bool}
	static h_int_self=undefined; /// @is {bool}
	static h_script_dot_static=undefined; /// @is {bool}
	static h_has_nameof=undefined; /// @is {bool}
	static h_to_string=function(){
		return "ApiVersion(\""+self.h_name+"\")";
	}
	self.h_has_nameof=false;
	self.h_script_dot_static=false;
	self.h_int_self=false;
	self.h_expr_macros=false;
	self.h_default_ret_value=undefined;
	self.h_has_delete=false;
	self.h_has_value_calls=false;
	self.h_has_try_catch=false;
	self.h_has_constructor=false;
	self.h_has_func_literal=false;
	self.h_has_struct_accessor=false;
	self.h_has_js_template_strings=false;
	self.h_has_template_strings=false;
	self.h_has_literal_strings=false;
	self.h_has_string_escape_characters=false;
	self.h_name=l_name;
	static __class__=mt_api_api_version;
}

if(live_enabled)
function api_api_version_create(l_i){
	// api_api_version_create(i:int)->api_api_version
	/// @ignore
	var l_v=new api_api_version(("v"+string(floor(l_i/10))+"."+string((l_i%10))));
	var l_v2=l_i>=20;
	var l_v23=l_i>=23;
	var l_mod=false;
	l_v.h_int_self=!l_v23;
	l_v.h_has_string_escape_characters=l_v2;
	l_v.h_has_literal_strings=l_v2;
	l_v.h_has_template_strings=l_v23;
	l_v.h_has_js_template_strings=l_mod;
	l_v.h_has_func_literal=l_v23;
	l_v.h_has_struct_accessor=l_v23;
	l_v.h_has_constructor=l_v23;
	l_v.h_has_try_catch=l_v23||l_mod;
	l_v.h_has_value_calls=l_v23;
	l_v.h_expr_macros=!l_v23;
	l_v.h_has_delete=l_v23;
	l_v.h_has_nameof=l_v23;
	l_v.h_script_dot_static=l_v23&&compile_groups_gml_compile_group_static_has_statics;
	l_v.h_default_ret_value=(l_v23?undefined:0);
	return l_v;
}

if(live_enabled)
function gml_parser(l_src)constructor{
	// gml_parser(src:gml_source)
	/// @ignore
	static h_tokens=undefined; /// @is {array<gml_token>}
	static h_token_count=undefined; /// @is {int}
	static h_macros=undefined; /// @is {array<gml_parser_macro>}
	static h_curr_macro=undefined; /// @is {gml_parser_macro}
	static h_curr_template=undefined; /// @is {gml_parser_template_state}
	static h_source=undefined; /// @is {gml_source}
	static h_pos_source=undefined; /// @is {ast_GmlPosSource}
	static h_pos=undefined; /// @is {int}
	static h_row_start=undefined; /// @is {int}
	static h_row=undefined; /// @is {int}
	static h_len=undefined; /// @is {int}
	static h_add=function(l_tk){
		if(self.h_curr_macro!=undefined)array_push(self.h_curr_macro.h_tokens,l_tk); else ds_list_add(gml_parser_token_acc,l_tk);
	}
	static h_set_source=function(l_src){
		var l_code=l_src.h_code;
		var l_sb=gml_parser_str_buf;
		buffer_seek(l_sb,buffer_seek_start,0);
		buffer_write(l_sb,buffer_string,l_code);
		self.h_len=buffer_tell(l_sb)-1;
		if(buffer_get_size(gml_parser_fast_buf)<self.h_len)buffer_resize(gml_parser_fast_buf,self.h_len);
		buffer_copy(l_sb,0,self.h_len,gml_parser_fast_buf,0);
		ds_list_clear(gml_parser_token_acc);
	}
	static h_to_string=function(){
		return "GmlParser(src:\""+self.h_source.h_name+"\")";
	}
	static h_error=function(l_text,l_pos){
		if(false)show_debug_message(argument[1]);
		if(l_pos==undefined)l_pos=gml_pos_create(self.h_pos_source,self.h_row,self.h_pos-self.h_row_start,self.h_pos);
		gml_parser_error_text=gml_pos_to_string_in(l_pos,self.h_source)+": "+l_text;
		gml_parser_error_pos=l_pos;
		ds_list_clear(gml_parser_token_acc);
		return undefined;
	}
	static h_finish=function(){
		self.h_curr_macro=undefined;
		if(self.h_source.h___eof==undefined)self.h_source.h___eof=gml_pos_create(self.h_pos_source,self.h_row,self.h_pos-self.h_row_start,self.h_pos);
		var l_tkList=gml_parser_token_acc;
		var l_tkCount=ds_list_size(l_tkList);
		var l_tkArr=array_create(l_tkCount);
		var l_i=0;
		for(var l__=0;l__<l_tkCount;l__++){
			l_tkArr[@l_i]=ds_list_find_value(l_tkList,l_i);
			l_i++;
		}
		ds_list_clear(l_tkList);
		self.h_tokens=l_tkArr;
		self.h_token_count=l_tkCount;
		return l_tkArr;
	}
	static h_skip_till_line_end=function(){
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
			if(l_c==13||l_c==10)break;
			self.h_pos+=1;
		}
	}
	static h_skip_line_spaces=function(){
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
			if(l_c==13||l_c==10)break;
			if(!(gml_parser_char_is_space[l_c]||l_c==194&&buffer_peek(gml_parser_fast_buf,self.h_pos+1,buffer_u8)==160))break;
			self.h_pos+=1;
		}
	}
	static h_proc_macro=function(l_c){
		var l_z;
		switch(l_c){
			case 92:
				l_z=true;
				while(self.h_pos<self.h_len&&l_z){
					l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
					switch(l_c){
						case 47:
							if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==47){
								self.h_skip_till_line_end();
							} else if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==42){
								return self.h_error("Should not be having block comments after a \\ in a macro");
							} else return self.h_error("Unexpected character `"+chr(l_c)+"` after a \\ in a macro");
							break;
						case 9:case 32:continue;
						case 13:if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==10)self.h_pos+=1;break;
						case 10:break;
						default:return self.h_error("Unexpected character `"+chr(l_c)+"` after a \\ in a macro");
					}
					break;
				}
				return -1;
			case 47:
				if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==47){
					l_z=false;
					while(self.h_pos<self.h_len){
						l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
						if(l_c==13||l_c==10)break;
						if(l_c==92)l_z=true;
						self.h_pos+=1;
					}
					if(l_z){
						if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==13)self.h_pos+=1;
						if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==10)self.h_pos+=1;
					}
				} else if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==42){
					l_z=false;
					while(self.h_pos<self.h_len){
						l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
						if(l_c==92){
							l_z=true;
							continue;
						}
						if(l_c==13||l_c==10){
							self.h_pos+=1;
							if(l_c==13&&buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==10)self.h_pos+=1;
							if(!l_z)return self.h_error("Multi-line comments inside macros must use \\ before line end");
							l_z=false;
						}
						self.h_pos+=1;
					}
				}
				break;
			case 10:case 13:
				self.h_curr_macro=undefined;
				return -1;
		}
		return l_c;
	}
	static h_proc_hexadecimal=function(l_md,l_is0x){
		var l_start=self.h_pos;
		var l_val=0;
		var l_found=0;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
			if(l_c==95){
				self.h_pos+=1;
				continue;
			} else if(l_c>=48&&l_c<=57){
				l_val=((l_val<<4)|l_c-48);
			} else if(l_c>=97&&l_c<=102){
				l_val=((l_val<<4)|l_c-87);
			} else if(l_c>=65&&l_c<=70){
				l_val=((l_val<<4)|l_c-55);
			} else break;
			self.h_pos+=1;
			l_found++;
		}
		if(l_found==0)return self.h_error("Empty hex literal",l_md);
		if(l_found>8)return self.h_error("Too many digits in a hex literal (max: 8)",l_md);
		self.h_add([gml_token.number,l_md,l_val,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos)]);
		return true;
	}
	static h_proc_binary=function(l_md){
		var l_start=self.h_pos-2;
		var l_i=0;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
			if(l_c==95){
				self.h_pos+=1;
				continue;
			} else if(l_c==48||l_c==49){
				l_i=((l_i<<1)|((l_c-48|0)));
			} else break;
			self.h_pos+=1;
		}
		self.h_add([gml_token.number,l_md,l_i,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos)]);
		return true;
	}
	static h_read_ident=function(){
		if(self.h_pos>=self.h_len)return undefined;
		var l_start=self.h_pos;
		var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
		if(!(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90))return undefined;
		self.h_pos+=1;
		while(self.h_pos<self.h_len){
			l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
			if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)self.h_pos+=1; else break;
		}
		return gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos);
	}
	static h_read_literal_string=function(l_quoteChar,l_d){
		var l_start=self.h_pos;
		var l_closed=false;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
			if(l_c==l_quoteChar){
				l_closed=true;
				break;
			}
			if(l_c==10){
				self.h_row+=1;
				self.h_row_start=self.h_pos;
				continue;
			}
			if(l_c>=192){
				if(l_c>=224){
					if(l_c>=240)self.h_row_start+=3; else self.h_row_start+=2;
				} else self.h_row_start+=1;
			}
		}
		if(l_closed)return gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos-1); else return self.h_error("Unclosed string",l_d);
	}
	static h_add_op=function(l_d,l_op){
		if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==61){
			self.h_pos+=1;
			self.h_add([gml_token.set_op,l_d,l_op]);
		} else self.h_add([gml_token.bin_op,l_d,l_op]);
	}
	static h_proc_string_escape_char=function(l_sb){
		var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
		var l_val,l_found;
		switch(l_c){
			case 97:buffer_write(l_sb,buffer_u8,7);break;
			case 98:buffer_write(l_sb,buffer_u8,8);break;
			case 116:buffer_write(l_sb,buffer_u8,9);break;
			case 110:buffer_write(l_sb,buffer_u8,10);break;
			case 118:buffer_write(l_sb,buffer_u8,11);break;
			case 102:buffer_write(l_sb,buffer_u8,12);break;
			case 114:buffer_write(l_sb,buffer_u8,13);break;
			case 13:if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==10)self.h_pos+=1;break;
			case 10:break;
			case 117:case 120:
				var l_isu=l_c==117;
				l_val=0;
				l_found=0;
				while(self.h_pos<self.h_len){
					l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
					if(l_c>=48&&l_c<=57){
						l_c-=48;
					} else if(l_c>=97&&l_c<=102){
						l_c-=87;
					} else if(l_c>=65&&l_c<=70){
						l_c-=55;
					} else l_c=-1;
					if(l_c<0)break;
					l_val=((l_val<<4)|l_c);
					self.h_pos+=1;
					if(l_isu){
						if(++l_found>=6)break;
					} else if(++l_found>=2){
						break;
					}
				}
				if(!l_isu&&l_found!=2)return self.h_error("Expected 2 hex characters in \\x");
				_gml_parser_gml_parser_string_buf_impl__add_code_point(l_sb,l_val);
				break;
			default:
				if(l_c>=48&&l_c<=55){
					l_val=0;
					l_found=0;
					while(self.h_pos<self.h_len){
						l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
						if(l_c>=48&&l_c<=55)l_val=((l_val<<3)|l_c-48); else break;
						self.h_pos+=1;
						if(++l_found>=3)break;
					}
					if(l_val>255)return self.h_error("Can't do \\oct for codes over 255");
					_gml_parser_gml_parser_string_buf_impl__add_code_point(l_sb,l_val);
				} else buffer_write(l_sb,buffer_u8,l_c);
		}
		return true;
	}
	static h_read_esc_string=function(l_startPos){
		var l_sb=_gml_parser_gml_parser_string_buf_impl__start();
		var l_pure=true;
		var l_start=self.h_pos;
		var l_closed=false;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
			if(l_c>=192){
				if(l_c>=224){
					if(l_c>=240)self.h_row_start+=3; else self.h_row_start+=2;
				} else self.h_row_start+=1;
			}
			switch(l_c){
				case 34:
					if(!l_pure){
						var l_till=self.h_pos-1;
						if(l_till>l_start)buffer_write(l_sb,buffer_text,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,l_till));
					}
					l_closed=true;
					break;
				case 92:
					l_pure=false;
					var l_till1=self.h_pos-1;
					if(l_till1>l_start)buffer_write(l_sb,buffer_text,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,l_till1));
					if(self.h_proc_string_escape_char(l_sb)==undefined)return undefined;
					l_start=self.h_pos;
					continue;
				case 10:case 13:return self.h_error("Unclosed string - unescaped newline mid-string",l_startPos);
				default:continue;
			}
			break;
		}
		if(!l_closed)return self.h_error("Unclosed string",l_startPos);
		if(l_pure)return gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos-1);
		return _gml_parser_gml_parser_string_buf_impl__to_string(l_sb);
	}
	static h_proc_define=function(l_d){
		self.h_skip_line_spaces();
		var l_name=self.h_read_ident();
		if(l_name==undefined)return self.h_error("Expected a script name");
		self.h_add([gml_token.header,l_d,l_name,false]);
		return true;
	}
	static h_proc_macro_def=function(l_d){
		var l__gthis=self;
		var l_name,l_config;
		if(gml_parser_curr_version.h_expr_macros){
			self.h_add([gml_token.macro_start,l_d]);
		} else {
			l_config=undefined;
			l__gthis.h_skip_line_spaces();
			l_name=l__gthis.h_read_ident();
			var l_tmp;
			if(l_name==undefined){
				l_tmp=true;
			} else {
				l__gthis.h_skip_line_spaces();
				if(buffer_peek(gml_parser_fast_buf,l__gthis.h_pos,buffer_u8)==58){
					l__gthis.h_pos+=1;
					l_config=l_name;
					l__gthis.h_skip_line_spaces();
					l_name=l__gthis.h_read_ident();
					if(l_name==undefined){
						l_name=l_config;
						l_config=undefined;
					}
				}
				l_tmp=false;
			}
			if(l_tmp)return undefined;
			self.h_curr_macro=new gml_parser_macro(l_name,l_config,l_d);
			array_push(self.h_macros,self.h_curr_macro);
		}
		return true;
	}
	static h_proc_template_segment=function(l_startPos){
		var l_sb=_gml_parser_gml_parser_string_buf_impl__start();
		var l_tpl=self.h_curr_template;
		var l_stop=l_tpl.h_stop;
		var l_start=self.h_pos;
		var l_isJS=l_tpl.h_is_js;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
			if(l_c==l_stop){
				var l_till=self.h_pos-1;
				if(l_till>l_start)buffer_write(l_sb,buffer_text,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,l_till));
				l_tpl.h_str+=_gml_parser_gml_parser_string_buf_impl__to_string(l_sb);
				self.h_add([gml_token.par_close,gml_pos_create(self.h_pos_source,self.h_row,self.h_pos-self.h_row_start,self.h_pos)]);
				ds_list_set(gml_parser_token_acc,l_tpl.h_tk_index,[gml_token.cstring,l_tpl.h_pos,l_tpl.h_str]);
				self.h_curr_template=l_tpl.h_next;
				return true;
			}
			if((l_isJS?l_c==36&&buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==123:l_c==123)){
				var l_till1=self.h_pos-1;
				if(l_till1>l_start)buffer_write(l_sb,buffer_text,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,l_till1));
				if(l_isJS)self.h_pos+=1;
				self.h_add([gml_token.comma,l_tpl.h_pos]);
				buffer_write(l_sb,buffer_text,"{"+string(l_tpl.h_arg_count++)+"}");
				l_tpl.h_str+=_gml_parser_gml_parser_string_buf_impl__to_string(l_sb);
				var l_till2=self.h_pos-1;
				if(l_till2>l_start)buffer_write(l_sb,buffer_text,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,l_till2));
				return true;
			}
			if(l_c==92){
				var l_till3=self.h_pos-1;
				if(l_till3>l_start)buffer_write(l_sb,buffer_text,gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,l_till3));
				self.h_proc_string_escape_char(l_sb);
				l_start=self.h_pos;
			}
		}
		return true;
	}
	static h_proc_number=function(l_d){
		var l_start=self.h_pos;
		var l_z=false;
		var l_s=undefined;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
			if(l_c==46){
				if(l_z){
					return self.h_error("Extra dot in a number");
				} else {
					self.h_pos+=1;
					l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
					if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90){
						l_s=gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos-1);
						self.h_add([gml_token.number,l_d,gml_std_Std_parseFloat(l_s),l_s]);
						l_d=gml_pos_create(self.h_pos_source,self.h_row,self.h_pos-self.h_row_start,self.h_pos);
						self.h_add([gml_token.period,l_d]);
						break;
					}
					l_z=true;
				}
			} else if(l_c>=48&&l_c<=57||l_c==95){
				self.h_pos+=1;
			} else break;
		}
		if(l_s==undefined){
			while(buffer_peek(gml_parser_fast_buf,l_start,buffer_u8)==48){
				l_start++;
				if(l_start>=self.h_pos){
					l_start--;
					break;
				} else if(buffer_peek(gml_parser_fast_buf,l_start,buffer_u8)==46){
					l_start--;
					break;
				}
			}
			l_s=gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos);
			l_s=string_replace_all(l_s,"_","");
			var l_f=gml_std_Std_parseFloat(l_s);
			if(!l_z){
				if(string_format(l_f,0,0)!=l_s){
					var l_i64=int64(l_s);
					if(string(l_i64)==l_s)l_f=l_i64;
				}
			}
			self.h_add([gml_token.number,l_d,l_f,l_s]);
		}
		return true;
	}
	static h_run=function(l_temStart){
		if(l_temStart==undefined)l_temStart=-1;
		if(false)show_debug_message(argument[0]);
		var l__gthis=self;
		var l_ver=self.h_source.h_version;
		if(l_ver==undefined){
			l_ver=gml_parser_default_version;
			self.h_source.h_version=l_ver;
		}
		gml_parser_curr_version=l_ver;
		self.h_set_source(self.h_source);
		var l_checkLineBreakForHeader=false;
		while(self.h_pos<self.h_len){
			var l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
			if(self.h_curr_macro!=undefined){
				l_c=self.h_proc_macro(l_c);
				if(l_c<0)continue;
			}
			var l_i,l_s,l_z,l_tmp;
			if(l_c==10){
				self.h_row+=1;
				self.h_row_start=self.h_pos;
				l_tmp=true;
			} else l_tmp=false;
			if(l_tmp){
				if(l_checkLineBreakForHeader){
					l_checkLineBreakForHeader=false;
					l_i=ds_list_size(gml_parser_token_acc)-1;
					var l__g=ds_list_find_value(gml_parser_token_acc,l_i);
					if(l__g[0]==0){
						if(l__g[3]==false)ds_list_set(gml_parser_token_acc,l_i,[gml_token.header,l__g[1],l__g[2],true]);
					}
				}
				continue;
			}
			if(gml_parser_char_is_space[l_c]||l_c==194&&buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==160)continue;
			var l_start=self.h_pos-1;
			var l_d=gml_pos_create(self.h_pos_source,self.h_row,self.h_pos-self.h_row_start,l_start);
			switch(l_c){
				case 59:self.h_add([gml_token.semico,l_d]);break;
				case 44:self.h_add([gml_token.comma,l_d]);break;
				case 46:
					l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
					if(l_c>=48&&l_c<=57){
						do {
							self.h_pos+=1;
							l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
						} until(!(l_c>=48&&l_c<=57));
						l_s=gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos);
						self.h_add([gml_token.number,l_d,gml_std_Std_parseFloat(l_s),l_s]);
					} else self.h_add([gml_token.period,l_d]);
					break;
				case 58:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==61){
						self.h_pos+=1;
						self.h_add([gml_token.set_op,l_d,-1]);
					} else self.h_add([gml_token.colon,l_d]);
					break;
				case 47:
					switch(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)){
						case 47:
							self.h_pos+=1;
							l_start=self.h_pos;
							self.h_skip_till_line_end();
							break;
						case 42:
							self.h_pos+=1;
							while(self.h_pos<self.h_len){
								l_c=buffer_peek(gml_parser_fast_buf,self.h_pos++,buffer_u8);
								if(l_c>=192){
									if(l_c>=224){
										if(l_c>=240)self.h_row_start+=3; else self.h_row_start+=2;
									} else self.h_row_start+=1;
								}
								if(l_c==10){
									self.h_row+=1;
									self.h_row_start=self.h_pos;
								}
								if(self.h_pos+1<self.h_len){
									if(l_c==42&&buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==47){
										self.h_pos+=1;
										break;
									}
								}
							}
							break;
						case 61:
							self.h_pos+=1;
							self.h_add([gml_token.set_op,l_d,1]);
							break;
						default:self.h_add([gml_token.bin_op,l_d,1]);
					}
					break;
				case 63:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==63){
						self.h_pos+=1;
						if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==61){
							self.h_pos+=1;
							self.h_add([gml_token.null_co_set,l_d]);
						} else self.h_add([gml_token.null_co,l_d]);
					} else self.h_add([gml_token.qmark,l_d]);
					break;
				case 61:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==61){
						self.h_pos+=1;
						self.h_add([gml_token.bin_op,l_d,64]);
					} else self.h_add([gml_token.set_op,l_d,-1]);
					break;
				case 43:
					switch(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)){
						case 61:
							self.h_pos+=1;
							self.h_add([gml_token.set_op,l_d,16]);
							break;
						case 43:
							self.h_pos+=1;
							self.h_add([gml_token.adjfix,l_d,true]);
							break;
						default:self.h_add([gml_token.bin_op,l_d,16]);
					}
					break;
				case 45:
					switch(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)){
						case 61:
							self.h_pos+=1;
							self.h_add([gml_token.set_op,l_d,17]);
							break;
						case 45:
							self.h_pos+=1;
							self.h_add([gml_token.adjfix,l_d,false]);
							break;
						default:self.h_add([gml_token.bin_op,l_d,17]);
					}
					break;
				case 42:self.h_add_op(l_d,0);break;
				case 37:self.h_add_op(l_d,2);break;
				case 38:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==38){
						self.h_pos+=1;
						self.h_add_op(l_d,80);
					} else self.h_add_op(l_d,49);
					break;
				case 124:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==124){
						self.h_pos+=1;
						self.h_add_op(l_d,96);
					} else self.h_add_op(l_d,48);
					break;
				case 94:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==94){
						self.h_pos+=1;
						self.h_add_op(l_d,65);
					} else self.h_add_op(l_d,50);
					break;
				case 62:
					switch(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)){
						case 61:
							self.h_pos+=1;
							self.h_add([gml_token.bin_op,l_d,69]);
							break;
						case 62:
							self.h_pos+=1;
							self.h_add_op(l_d,33);
							break;
						default:self.h_add([gml_token.bin_op,l_d,68]);
					}
					break;
				case 60:
					switch(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)){
						case 61:
							self.h_pos+=1;
							self.h_add([gml_token.bin_op,l_d,67]);
							break;
						case 60:
							self.h_pos+=1;
							self.h_add_op(l_d,32);
							break;
						case 62:
							self.h_pos+=1;
							self.h_add_op(l_d,65);
							break;
						default:self.h_add([gml_token.bin_op,l_d,66]);
					}
					break;
				case 33:
					if(buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==61){
						self.h_pos+=1;
						self.h_add_op(l_d,65);
					} else self.h_add([gml_token.un_op,l_d,1]);
					break;
				case 126:self.h_add([gml_token.un_op,l_d,2]);break;
				case 40:self.h_add([gml_token.par_open,l_d]);break;
				case 41:self.h_add([gml_token.par_close,l_d]);break;
				case 91:
					l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
					switch(l_c){
						case 35:case 63:case 64:case 124:
							self.h_pos+=1;
							self.h_add([gml_token.sqb_open,l_d,l_c]);
							break;
						case 36:
							if(l_ver.h_has_struct_accessor){
								self.h_pos+=1;
								var l_c1=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
								if(l_c1==95||l_c1>=97&&l_c1<=122||l_c1>=65&&l_c1<=90||l_c1>=48&&l_c1<=57)return self.h_error("Ambiguity: use either `[$ key` or `[ $hex`",l_d);
								self.h_add([gml_token.sqb_open,l_d,36]);
							} else self.h_add([gml_token.sqb_open,l_d,0]);
							break;
						default:self.h_add([gml_token.sqb_open,l_d,0]);
					}
					break;
				case 93:self.h_add([gml_token.sqb_close,l_d]);break;
				case 123:
					if(self.h_curr_template!=undefined)self.h_curr_template.h_curly_depth++;
					self.h_add([gml_token.cub_open,l_d]);
					break;
				case 125:
					l_z=true;
					if(self.h_curr_template!=undefined){
						if(self.h_curr_template.h_curly_depth>0){
							self.h_curr_template.h_curly_depth--;
						} else {
							l_z=false;
							if(self.h_proc_template_segment(l_d)==undefined)return undefined;
						}
					}
					if(l_z)self.h_add([gml_token.cub_close,l_d]);
					break;
				case 64:
					if(l_ver.h_has_literal_strings){
						l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
						if(l_c==34||l_c==39){
							self.h_pos+=1;
							l_s=self.h_read_literal_string(l_c,l_d);
							if(l_s==undefined)return undefined;
							self.h_add([gml_token.cstring,l_d,l_s]);
						} else self.h_add([gml_token.at_sign,l_d]);
					} else self.h_add([gml_token.at_sign,l_d]);
					break;
				case 34:
					if(l_ver.h_has_string_escape_characters)l_s=self.h_read_esc_string(l_d); else l_s=self.h_read_literal_string(34,l_d);
					if(l_s==undefined)return undefined;
					self.h_add([gml_token.cstring,l_d,l_s]);
					break;
				case 39:
					if(l_ver.h_has_string_escape_characters){
						return self.h_error("Single quotes are not allowed for strings",l_d);
					} else {
						l_s=self.h_read_literal_string(39,l_d);
						if(l_s==undefined)return undefined;
						self.h_add([gml_token.cstring,l_d,l_s]);
					}
					break;
				case 96:
					if(l_ver.h_has_js_template_strings){
						self.h_add([gml_token.ident,l_d,gml_parser_template_func]);
						self.h_add([gml_token.par_open,l_d]);
						self.h_curr_template=new gml_parser_template_state(l_d,ds_list_size(gml_parser_token_acc),true,self.h_curr_template);
						self.h_add([gml_token.cstring,l_d,"ERROR"]);
						if(self.h_proc_template_segment(l_d)==undefined)return undefined;
					} else if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90){
						while(self.h_pos<self.h_len){
							l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
							if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)self.h_pos+=1; else break;
						}
						l_s=gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos);
						var l_fn=variable_struct_get(data_gml_keyword_mapper_map,l_s);
						if(l_fn!=undefined){
							var l_tk=l_fn(l_d);
							if(l_tk!=undefined)self.h_add(l_tk); else l__gthis.h_add([gml_token.ident,l_d,l_s]);
						} else if(l_s=="_GMFILE_"){
							self.h_add([gml_token.cstring,l_d,"live:"+self.h_source.h_name]);
						} else if(gml_std_StringTools_startsWith(l_s,"argument")){
							var l_s_8=gml_std_string_substring(l_s,8);
							if(string_digits(l_s_8)==l_s_8&&string_length(l_s_8)<=2)self.h_add([gml_token.arg_const,l_d,gml_std_Std_parseInt(l_s_8)]); else l__gthis.h_add([gml_token.ident,l_d,l_s]);
						} else l__gthis.h_add([gml_token.ident,l_d,l_s]);
					} else if(l_c>=48&&l_c<=57||l_c==46){
						if(l_c==48){
							l_i=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
							if(l_i==120){
								self.h_pos+=1;
								if(self.h_proc_hexadecimal(l_d,true)==undefined)continue;
								continue;
							}
							if(l_i==98){
								self.h_pos+=1;
								if(self.h_proc_binary(l_d)==undefined)continue;
								continue;
							}
						}
						self.h_pos--;
						if(self.h_proc_number(l_d)==undefined)return undefined;
					} else return self.h_error("Unexpected character `"+chr(l_c)+"` (ord "+string(l_c)+")");
					break;
				case 36:
					if(l_ver.h_has_template_strings&&buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8)==34){
						self.h_pos+=1;
						self.h_add([gml_token.ident,l_d,gml_parser_template_func]);
						self.h_add([gml_token.par_open,l_d]);
						self.h_curr_template=new gml_parser_template_state(l_d,ds_list_size(gml_parser_token_acc),false,self.h_curr_template);
						self.h_add([gml_token.cstring,l_d,"ERROR"]);
						if(self.h_proc_template_segment(l_d)==undefined)return undefined;
					} else self.h_proc_hexadecimal(l_d,false);
					break;
				case 35:
					while(self.h_pos<self.h_len){
						l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
						if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)self.h_pos+=1; else break;
					}
					l_s=gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start+1,self.h_pos);
					switch(l_s){
						case "define":
							if(self.h_proc_define(l_d)==undefined)return undefined;
							l_checkLineBreakForHeader=true;
							break;
						case "macro":if(self.h_proc_macro_def(l_d)==undefined)return undefined;break;
						case "endregion":case "region":self.h_skip_till_line_end();break;
						default:
							if(string_length(l_s)==6){
								l_i=-1;
								var l_col=0;
								l_z=false;
								while(++l_i<6){
									l_c=string_ord_at(l_s,l_i+1);
									if(l_c>=48&&l_c<=57){
										l_c-=48;
									} else if(l_c>=97&&l_c<=102){
										l_c-=87;
									} else if(l_c>=65&&l_c<=70){
										l_c-=55;
									} else l_c=-1;
									if(l_c<0){
										l_z=true;
										break;
									}
									l_col=((l_col<<4)|l_c);
								}
								if(!l_z){
									l_col=(((l_col&65280)|((l_col&16711680)>>16))|((l_col&255)<<16));
									self.h_add([gml_token.number,l_d,l_col,undefined]);
								}
							} else l_z=true;
							if(l_z){
								self.h_add([gml_token.hash,l_d]);
								self.h_pos=l_start+1;
							}
					}
					break;
				default:
					if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90){
						while(self.h_pos<self.h_len){
							l_c=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
							if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)self.h_pos+=1; else break;
						}
						l_s=gml_parser_buf_sub(gml_parser_fast_buf,gml_parser_buf_sub_buf,l_start,self.h_pos);
						var l_fn1=variable_struct_get(data_gml_keyword_mapper_map,l_s);
						if(l_fn1!=undefined){
							var l_tk1=l_fn1(l_d);
							if(l_tk1!=undefined)self.h_add(l_tk1); else l__gthis.h_add([gml_token.ident,l_d,l_s]);
						} else if(l_s=="_GMFILE_"){
							self.h_add([gml_token.cstring,l_d,"live:"+self.h_source.h_name]);
						} else if(gml_std_StringTools_startsWith(l_s,"argument")){
							var l_s_81=gml_std_string_substring(l_s,8);
							if(string_digits(l_s_81)==l_s_81&&string_length(l_s_81)<=2)self.h_add([gml_token.arg_const,l_d,gml_std_Std_parseInt(l_s_81)]); else l__gthis.h_add([gml_token.ident,l_d,l_s]);
						} else l__gthis.h_add([gml_token.ident,l_d,l_s]);
					} else if(l_c>=48&&l_c<=57||l_c==46){
						if(l_c==48){
							l_i=buffer_peek(gml_parser_fast_buf,self.h_pos,buffer_u8);
							if(l_i==120){
								self.h_pos+=1;
								if(self.h_proc_hexadecimal(l_d,true)==undefined)continue;
								continue;
							}
							if(l_i==98){
								self.h_pos+=1;
								if(self.h_proc_binary(l_d)==undefined)continue;
								continue;
							}
						}
						self.h_pos--;
						if(self.h_proc_number(l_d)==undefined)return undefined;
					} else return self.h_error("Unexpected character `"+chr(l_c)+"` (ord "+string(l_c)+")");
			}
		}
		return self.h_finish();
	}
	self.h_row=1;
	self.h_row_start=0;
	self.h_pos=0;
	self.h_curr_template=undefined;
	self.h_curr_macro=undefined;
	self.h_macros=[];
	self.h_token_count=-1;
	self.h_tokens=undefined;
	self.h_source=l_src;
	self.h_pos_source=l_src.h_index;
	static __class__=mt_gml_parser;
}

if(live_enabled)
function gml_parser_set_version(l_ver){
	// gml_parser_set_version(ver:int)
	/// @ignore
	if(l_ver<10){
		show_error("Supported versions are 14,20,23",true);
	} else if(l_ver<20){
		gml_parser_default_version=api_api_version_v1;
	} else if(l_ver<23){
		gml_parser_default_version=api_api_version_v2;
	} else gml_parser_default_version=api_api_version_v23;
}

if(live_enabled)
function gml_parser_buf_sub(l_buf,l_str,l_start,l_end){
	// gml_parser_buf_sub(buf:buffer, str:buffer, start:int, end:int)->string
	/// @ignore
	var l_len=l_end-l_start;
	buffer_copy(l_buf,l_start,l_len,l_str,0);
	buffer_poke(l_str,l_len,buffer_u8,0);
	buffer_seek(l_str,buffer_seek_start,0);
	return buffer_read(l_str,buffer_string);
}

if(live_enabled)
function gml_parser_char_is_space_init(){
	// gml_parser_char_is_space_init()->array<bool>
	/// @ignore
	var l_vec=array_create(256,undefined);
	haxe_ds__vector_vector_impl__fill(l_vec,false);
	l_vec[@32]=true;
	l_vec[@9]=true;
	l_vec[@13]=true;
	l_vec[@10]=true;
	return l_vec;
}

if(live_enabled)
function gml_parser_template_state(l_pos,l_tkIndex,l_isJS,l_next)constructor{
	// gml_parser_template_state(pos:gml_pos, tkIndex:int, isJS:bool, next:gml_parser_template_state)
	/// @ignore
	static h_curly_depth=undefined; /// @is {int}
	static h_tk_index=undefined; /// @is {int}
	static h_next=undefined; /// @is {gml_parser_template_state}
	static h_arg_count=undefined; /// @is {int}
	static h_str=undefined; /// @is {string}
	static h_stop=undefined; /// @is {int}
	static h_pos=undefined; /// @is {gml_pos}
	static h_is_js=undefined; /// @is {bool}
	self.h_str="";
	self.h_arg_count=0;
	self.h_curly_depth=0;
	self.h_pos=l_pos;
	self.h_tk_index=l_tkIndex;
	self.h_next=l_next;
	self.h_stop=(l_isJS?96:34);
	self.h_is_js=l_isJS;
	static __class__=mt_gml_parser_template_state;
}

if(live_enabled)
function _gml_parser_gml_parser_string_buf_impl__start(){
	// _gml_parser_gml_parser_string_buf_impl__start()->GmlParserStringBuf
	/// @ignore
	var l_buf=_gml_parser_gml_parser_string_buf_impl____buf;
	buffer_seek(l_buf,buffer_seek_start,0);
	return l_buf;
}

if(live_enabled)
function _gml_parser_gml_parser_string_buf_impl__add_code_point(l_this1,l_n){
	// _gml_parser_gml_parser_string_buf_impl__add_code_point(this:buffer, n:int)
	/// @ignore
	if(l_n<=127){
		buffer_write(l_this1,buffer_u8,l_n);
	} else if(l_n<=2047){
		buffer_write(l_this1,buffer_u8,(192|(l_n>>6)));
		buffer_write(l_this1,buffer_u8,(128|(l_n&63)));
	} else if(l_n<=65535){
		buffer_write(l_this1,buffer_u8,(192|(l_n>>12)));
		buffer_write(l_this1,buffer_u8,(128|((l_n>>6)&63)));
		buffer_write(l_this1,buffer_u8,(128|(l_n&63)));
	} else {
		buffer_write(l_this1,buffer_u8,(192|(l_n>>18)));
		buffer_write(l_this1,buffer_u8,(128|((l_n>>12)&63)));
		buffer_write(l_this1,buffer_u8,(128|((l_n>>6)&63)));
		buffer_write(l_this1,buffer_u8,(128|(l_n&63)));
	}
}

if(live_enabled)
function _gml_parser_gml_parser_string_buf_impl__to_string(l_this1){
	// _gml_parser_gml_parser_string_buf_impl__to_string(this:buffer)->string
	/// @ignore
	buffer_write(l_this1,buffer_u8,0);
	buffer_seek(l_this1,buffer_seek_start,0);
	return buffer_read(l_this1,buffer_string);
}

if(live_enabled)
function gml_parser_macro(l__name,l__config,l__pos)constructor{
	// gml_parser_macro(_name:string, _config:string, _pos:gml_pos)
	/// @ignore
	static h_pos=undefined; /// @is {gml_pos}
	static h_name=undefined; /// @is {string}
	static h_config=undefined; /// @is {string}
	static h_tokens=undefined; /// @is {array<gml_token>}
	self.h_tokens=[];
	self.h_name=l__name;
	self.h_config=l__config;
	self.h_pos=l__pos;
	static __class__=mt_gml_parser_macro;
}

if(live_enabled)
function gml_program(l_sources)constructor{
	// gml_program(sources:array<gml_source>)
	/// @ignore
	static h_sources=undefined; /// @is {array<gml_source>}
	static h_get_source=function(l_posSrc){
		if(l_posSrc==-2)return gml_source_builtin;
		if(l_posSrc>=0&&l_posSrc<array_length(self.h_sources))return self.h_sources[l_posSrc];
		return gml_source_unknown;
	}
	static h_script_array=undefined; /// @is {array<gml_script>}
	static h_script_map=undefined; /// @is {tools_Dictionary<gml_script>}
	static h_enum_array=undefined; /// @is {array<gml_enum>}
	static h_enum_map=undefined; /// @is {tools_Dictionary<gml_enum>}
	static h_macro_map=undefined; /// @is {tools_Dictionary<gml_macro>}
	static h_wait_list=undefined; /// @is {tools_ArrayList<gml_thread>}
	static h_wait_list_swap=undefined; /// @is {tools_ArrayList<gml_thread>}
	static h_callback=undefined; /// @is {function<gml_thread;void>}
	static h_time_tag=undefined; /// @is {vm_GmlThreadTimeTag}
	static h_error_text=undefined; /// @is {string}
	static h_error_pos=undefined; /// @is {gml_pos}
	static h_is_ready=undefined; /// @is {bool}
	static h_tag=undefined; /// @is {any}
	static h_live_ident=undefined; /// @is {string}
	static h_has_fast_getter=function(l_fd){
		return variable_struct_exists(gml_fast_field_getters,l_fd);
	}
	static h_get_fast_getter=function(l_fd){
		return variable_struct_get(gml_fast_field_getters,l_fd);
	}
	static h_get_fast_setter=function(l_fd){
		return variable_struct_get(gml_fast_field_setters,l_fd);
	}
	static h_get_fast_setter_after_getter=function(l_fd){
		return variable_struct_get(gml_fast_field_setters,l_fd);
	}
	static h_error=function(l_text,l_d){
		var l_pos=l_d;
		self.h_error_text=gml_pos_to_string(l_pos,self)+" "+l_text;
		self.h_error_pos=l_pos;
		return true;
	}
	static h_merge_builder_results=function(l_b){
		var l_main=l_b.h_source.h_main;
		var l__g=0;
		var l__g1=l_b.h_scripts;
		while(l__g<array_length(l__g1)){
			var l_scr=l__g1[l__g];
			l__g++;
			if(variable_struct_exists(self.h_script_map,l_scr.h_name)){
				if(l_scr.h_name==l_main){
					var l__g2=variable_struct_get(self.h_script_map,l_main).h_node;
					var l_tmp;
					if(l__g2[0]==95)l_tmp=array_length(l__g2[2])==0; else l_tmp=false;
					if(l_tmp){
						var l_w=self.h_script_array;
						var l_i=0;
						var l_n=array_length(l_w);
						while(l_i<l_n){
							if(l_w[l_i].h_name==l_main){
								while(++l_i<l_n){
									l_w[@l_i-1]=l_w[l_i];
								}
								l_w[@l_n-1]=l_scr;
							} else l_i++;
						}
						variable_struct_set(self.h_script_map,l_scr.h_name,l_scr);
					} else {
						self.h_error("Cannot override prefix-script \""+l_main+"\" because it is not empty",l_scr.h_pos);
						exit;
					}
				} else {
					self.h_error("Script "+l_scr.h_name+" is already defined at "+gml_pos_to_string(variable_struct_get(self.h_script_map,l_scr.h_name).h_pos,self),l_scr.h_pos);
					exit;
				}
			} else {
				array_push(self.h_script_array,l_scr);
				variable_struct_set(self.h_script_map,l_scr.h_name,l_scr);
			}
		}
		var l__g=0;
		var l__g1=l_b.h_enums;
		while(l__g<array_length(l__g1)){
			var l_e=l__g1[l__g];
			l__g++;
			array_push(self.h_enum_array,l_e);
			variable_struct_set(self.h_enum_map,l_e.h_name,l_e);
		}
		var l_mcrNames=l_b.h_macro_names;
		var l_mcrNodes=l_b.h_macro_nodes;
		var l_mcrMap=self.h_macro_map;
		for(var l_i=0,l__g1=array_length(l_mcrNames);l_i<l__g1;l_i++){
			variable_struct_set(l_mcrMap,l_mcrNames[l_i],l_mcrNodes[l_i]);
		}
	}
	static h_destroy=function(){
		var l__g=0;
		var l__g1=self.h_script_array;
		while(l__g<array_length(l__g1)){
			var l_q=l__g1[l__g];
			l__g++;
			l_q.h_destroy();
		}
		self.h_script_array=undefined;
		self.h_script_map=undefined;
		self.h_enum_map=undefined;
		self.h_macro_map=undefined;
		ds_list_destroy(self.h_wait_list);
		self.h_wait_list=undefined;
		ds_list_destroy(self.h_wait_list_swap);
		self.h_wait_list_swap=undefined;
	}
	static h_call_v=function(l_name,l_args1,l_copy){
		if(l_copy==undefined)l_copy=true;
		if(false)show_debug_message(argument[2]);
		var l_scr=variable_struct_get(self.h_script_map,l_name);
		if(l_scr!=undefined){
			var l_locals=array_create(l_scr.h_locals);
			if(l_copy)l_args1=gml_value_list_copy(l_args1);
			gml_value_list_pad_to_size_with_null(l_args1,l_scr.h_arguments);
			var l_th=new gml_thread(self,l_scr.h_actions,l_args1,l_locals);
			l_th.h_callback=self.h_callback;
			l_th.h_time_tag=self.h_time_tag;
			l_th.h_exec();
			return l_th;
		} else return undefined;
	}
	static h_print=function(){
		var l_r=new gml_std_StringBuf();
		for(var l_i=0,l__g1=array_length(self.h_script_array);l_i<l__g1;l_i++){
			if(l_i>0)l_r.h_addChar(10);
			var l_scr=self.h_script_array[l_i];
			l_r.h_add("#define ");
			l_r.h_add(l_scr.h_name);
			l_r.h_add("\n// locals: {");
			var l_localNames=l_scr.h_local_names;
			for(var l_k=0,l__g3=array_length(l_localNames);l_k<l__g3;l_k++){
				if(l_k>0)l_r.h_add(", "); else l_r.h_add(" ");
				l_r.h_add(l_k);
				l_r.h_add(": \"");
				l_r.h_add(l_localNames[l_k]);
				l_r.h_add("\"");
			}
			l_r.h_add(" }\n");
			l_r.h_add(gml_action_list_print(l_scr.h_actions));
		}
		return l_r.h_toString();
	}
	static h_seek=function(l_f,l_st){
		if(l_st==undefined)l_st=false;
		if(false)show_debug_message(argument[1]);
		var l_w=(l_st?ds_list_create():undefined);
		gml_program_seek_func=l_f;
		var l_m=self.h_script_array;
		var l_n=array_length(l_m);
		var l_i=0;
		while(l_i<l_n){
			var l_scr=l_m[l_i];
			gml_program_seek_script=l_scr;
			var l_scrNode=l_scr.h_node;
			if(l_scrNode!=undefined&&l_f(l_scrNode,l_w))break; else l_i++;
		}
		gml_program_seek_script=undefined;
		gml_program_seek_func=undefined;
		if(l_st)ds_list_destroy(l_w);
		return l_i<l_n;
	}
	static h_check=function(){
		gml_program_seek_inst=self;
		if(self.h_seek(gml_seek_arguments_proc,false))return true;
		if(self.h_seek(gml_seek_locals_proc,false))return true;
		if(self.h_seek(gml_seek_idents_proc,true))return true;
		if(self.h_seek(gml_seek_fields_proc,false))return true;
		if(self.h_seek(gml_seek_calls_proc,false))return true;
		if(gml_seek_enum_values_proc())return true;
		if(self.h_seek(gml_seek_enum_fields_proc,false))return true;
		if(gml_seek_eval_opt())return true;
		if(self.h_seek(gml_seek_self_fields_proc,false))return true;
		if(self.h_seek(gml_seek_alarms_proc,false))return true;
		if(self.h_seek(gml_seek_adjfix_proc,true))return true;
		if(self.h_seek(gml_seek_set_op_proc,true))return true;
		gml_program_seek_inst=undefined;
		return false;
	}
	static h_eval_value=undefined; /// @is {any}
	static h_eval=function(l_q){
		var l_r,l_v;
		var l__g=l_q;
		switch(l__g[0]){
			case gml_node.number:l_r=l__g[2];break;
			case gml_node.cstring:l_r=l__g[2];break;
			case gml_node.field:
				var l__hx_tmp=l__g[2];
				if(l__hx_tmp[0]==13){
					var l_d=l__g[1];
					var l_s=l__hx_tmp[2];
					var l_f=l__g[3];
					var l_e=variable_struct_get(self.h_enum_map,l_s);
					if(l_e!=undefined){
						var l_c=variable_struct_get(l_e.h_ctr_map,l_f);
						if(l_c!=undefined){
							l_r=l_c.h_value;
							if(l_r==undefined)return self.h_error("Value of "+l_s+"."+l_f+" is not known here",l_d);
						} else return self.h_error("Enum `"+l_s+"` does not contain field `"+l_f+"`",l_d);
					} else return self.h_error("Could not find enum "+l_s,l_d);
				} else return self.h_error("Can not evaluate this compile-time",gml_std_haxe_enum_tools_getParameter(l_q,0));
				break;
			case gml_node.bin_op:
				if(self.h_eval(l__g[3]))return true;
				l_r=self.h_eval_value;
				if(self.h_eval(l__g[4]))return true;
				l_v=self.h_eval_value;
				switch(l__g[2]){
					case 16:l_r+=l_v;break;
					case 17:l_r-=l_v;break;
					case 0:l_r*=l_v;break;
					case 1:l_r/=l_v;break;
					case 2:l_r%=l_v;break;
					case 3:
						var l_a=l_r;
						var l_b=l_v;
						if(l_b==0&&is_int64(l_b)&&is_int64(l_a))show_error("Division by zero",true);
						l_r=(l_a div l_b);
						break;
					case 49:l_r&=l_v;break;
					case 48:l_r|=l_v;break;
					case 50:l_r^=l_v;break;
					case 32:l_r=l_r<<l_v;break;
					case 33:l_r=l_r>>l_v;break;
					default:return self.h_error("Can not evaluate this compile-time",gml_std_haxe_enum_tools_getParameter(l_q,0));
				}
				break;
			default:return self.h_error("Can not evaluate this compile-time",gml_std_haxe_enum_tools_getParameter(l_q,0));
		}
		self.h_eval_value=l_r;
		return false;
	}
	self.h_is_ready=false;
	self.h_error_text=undefined;
	self.h_time_tag=undefined;
	self.h_callback=undefined;
	self.h_wait_list_swap=ds_list_create();
	self.h_wait_list=ds_list_create();
	self.h_macro_map={}
	self.h_enum_map={}
	self.h_enum_array=[];
	self.h_script_map={}
	self.h_script_array=[];
	self.h_sources=undefined;
	for(var l_i=0,l__g1=array_length(l_sources);l_i<l__g1;l_i++){
		l_sources[l_i].h_index=l_i;
	}
	self.h_sources=l_sources;
	var l_builders=[];
	var l__g=0;
	while(l__g<array_length(l_sources)){
		var l_src=l_sources[l__g];
		l__g++;
		array_push(l_builders,new gml_builder(self,l_src));
	}
	if(array_length(l_sources)>0&&!l_sources[0].h_version.h_expr_macros){
		if(ast_gml_macro_proc_run(self,l_builders))exit;
	}
	var l__g=0;
	while(l__g<array_length(l_builders)){
		var l_b=l_builders[l__g];
		l__g++;
		l_b.h_run();
		if(l_b.h_error_text==undefined){
			self.h_merge_builder_results(l_b);
		} else if(l_b.h_source.h_opt){
			var l_errorNext=l_b.h_error_text;
			if(self.h_error_text!=undefined)self.h_error_text+="\n"+l_errorNext; else self.h_error_text=l_errorNext;
		} else {
			self.h_error_text=l_b.h_error_text;
			self.h_error_pos=l_b.h_error_pos;
			exit;
		}
	}
	var l_i;
	var l_n=array_length(self.h_script_array);
	for(l_i=0;l_i<l_n;l_i++){
		self.h_script_array[l_i].h_index=gml_script_index_offset+l_i;
	}
	if(self.h_check()){
		gml_program_seek_inst=undefined;
		exit;
	}
	if(gml_compile_program(self)){
		if(self.h_error_text!=undefined)self.h_error_text+="\n"+gml_compile_error_text; else self.h_error_text=gml_compile_error_text;
		self.h_error_pos=gml_compile_error_pos;
		exit;
	}
	l_builders=undefined;
	l_n=array_length(self.h_script_array);
	for(l_i=0;l_i<l_n;l_i++){
		self.h_script_array[l_i].h_node=undefined;
	}
	self.h_is_ready=true;
	static __class__=mt_gml_program;
}

if(live_enabled)
function gml_std_StringBuf()constructor{
	// gml_std_StringBuf()
	/// @ignore
	static h_str=undefined; /// @is {string}
	static h_strLen=undefined; /// @is {int}
	static h_arr=undefined; /// @is {array<string>}
	static h_arrLen=undefined; /// @is {int}
	static h_arrMax=undefined; /// @is {int}
	static h_length=undefined; /// @is {int}
	static h_store=function(){
		var l_i=self.h_arrLen++;
		var l_m=self.h_arrMax;
		var l_arr=self.h_arr;
		if(l_i>=l_m){
			l_m*=2;
			l_arr[@l_m-1]=undefined;
			self.h_arrMax=l_m;
		}
		l_arr[@l_i]=self.h_str;
		self.h_str="";
		self.h_strLen=0;
	}
	static h_addChar=function(l_c){
		self.h_str+=chr(l_c);
		self.h_length+=1;
		if(++self.h_strLen>=128)self.h_store();
	}
	static h_add=function(l_val){
		var l_s=gml_std_Std_stringify(l_val);
		var l_n=string_byte_length(l_s);
		self.h_str+=l_s;
		self.h_length+=l_n;
		self.h_strLen+=l_n;
		if(self.h_strLen>=128)self.h_store();
	}
	static h_toString=function(){
		var l_arr=self.h_arr;
		var l_buf=gml_std_StringBuf_buffer;
		buffer_seek(l_buf,buffer_seek_start,0);
		for(var l_i=0,l__g1=self.h_arrLen;l_i<l__g1;l_i++){
			buffer_write(l_buf,buffer_text,l_arr[l_i]);
		}
		buffer_write(l_buf,buffer_string,self.h_str);
		buffer_seek(l_buf,buffer_seek_start,0);
		return buffer_read(l_buf,buffer_string);
	}
	self.h_length=0;
	self.h_arrMax=4;
	self.h_arrLen=0;
	self.h_arr=array_create(4);
	self.h_strLen=0;
	self.h_str="";
	static __class__=mt_gml_std_StringBuf;
}

if(live_enabled)
function gml_api_parse_name(l_s,l_i){
	// gml_api_parse_name(s:string, i:int)->string
	/// @ignore
	var l_c=string_ord_at(l_s,l_i+1);
	if(l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c==95){
		var l_k=l_i;
		do {
			l_i++;
			l_c=string_ord_at(l_s,l_i+1);
		} until(!(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57));
		return gml_std_string_substring(l_s,l_k,l_i);
	} else show_error("API.parseName: wrong format in "+l_s,true);
}

if(live_enabled)
function api_api_var()constructor{
	// api_api_var()
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_flags=undefined; /// @is {int}
	static h_func=undefined; /// @is {any}
	static h_type_check=undefined; /// @is {gml_type_check}
	static h_set=function(l_sig,l_func){
		var l_flags=0;
		if(string_ord_at(l_sig,1)==58){
			l_sig=gml_std_string_substring(l_sig,1);
			l_flags|=4;
		}
		var l_typeCheck=gml_type_check_any;
		var l_pos=gml_std_string_pos_ext_haxe(l_sig,":");
		if(l_pos>=0){
			var l_typeStr=gml_std_string_substring(l_sig,l_pos+1);
			l_typeCheck=variable_struct_get(gml_type_check_map,l_typeStr);
			if(l_typeCheck==undefined)show_error("`"+l_typeStr+"` is not a known type in `"+l_sig+"`",true);
			l_sig=gml_std_string_substring(l_sig,0,l_pos);
		}
		self.h_name=gml_api_parse_name(l_sig,0);
		if(gml_std_string_pos_ext_haxe(l_sig,"[")>=0)l_flags|=2;
		if(gml_std_string_pos_ext_haxe(l_sig,"*")>=0)l_flags|=1;
		self.h_flags=l_flags;
		self.h_func=l_func;
		self.h_type_check=l_typeCheck;
	}
	self.h_flags=0;
	static __class__=mt_api_api_var;
}

if(live_enabled)
function gml_enum(l_name,l_pos)constructor{
	// gml_enum(name:string, pos:gml_pos)
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_pos=undefined; /// @is {gml_pos}
	static h_ctr_list=undefined; /// @is {array<gml_enum_ctr>}
	static h_ctr_map=undefined; /// @is {tools_Dictionary<gml_enum_ctr>}
	static h_has_values=undefined; /// @is {bool}
	static h_add=function(l_name,l_val){
		var l_ctr=new gml_enum_ctr(l_name,self.h_pos,[gml_node.number,self.h_pos,l_val,string(l_val)]);
		l_ctr.h_value=l_val;
		array_push(self.h_ctr_list,l_ctr);
		variable_struct_set(self.h_ctr_map,l_name,l_ctr);
	}
	static h_print=function(){
		var l_r="(enum "+self.h_name+" { ";
		var l_z=false;
		var l__g=0;
		var l__g1=self.h_ctr_list;
		while(l__g<array_length(l__g1)){
			var l_ctr=l__g1[l__g];
			l__g++;
			if(l_z)l_r+=", "; else l_z=true;
			l_r+=l_ctr.h_name+" = "+gml_std_Std_stringify(l_ctr.h_value);
		}
		return l_r+" })";
	}
	self.h_has_values=false;
	self.h_ctr_map={}
	self.h_ctr_list=[];
	self.h_name=l_name;
	self.h_pos=l_pos;
	static __class__=mt_gml_enum;
}

if(live_enabled)
function gml_enum_create_builtin(l_name){
	// gml_enum_create_builtin(name:string)->gml_enum
	/// @ignore
	var l_e=new gml_enum(l_name,gml_pos_create(-2,0,0,0));
	variable_struct_set(gml_enum_map,l_name,l_e);
	return l_e;
}

if(live_enabled)
function gml_enum_ctr(l_name,l_pos,l_node)constructor{
	// gml_enum_ctr(name:string, pos:gml_pos, node:ast_GmlNode)
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_pos=undefined; /// @is {gml_pos}
	static h_node=undefined; /// @is {ast_GmlNode}
	static h_value=undefined; /// @is {int?}
	self.h_value=undefined;
	self.h_name=l_name;
	self.h_pos=l_pos;
	self.h_node=l_node;
	static __class__=mt_gml_enum_ctr;
}

function gml_macro(l_name,l_node,l_isExpr,l_isStat)constructor{
	/// gml_macro(name:string, node:ast_GmlNode, isExpr:bool, isStat:bool)
	/// @param {string} name
	/// @param {ast_GmlNode} node
	/// @param {bool} isExpr
	/// @param {bool} isStat
	static h_name=undefined; /// @is {string}
	static h_node=undefined; /// @is {ast_GmlNode}
	static h_is_expr=undefined; /// @is {bool}
	static h_is_stat=undefined; /// @is {bool}
	if(live_enabled){
		self.h_name=l_name;
		self.h_node=l_node;
		self.h_is_expr=l_isExpr;
		self.h_is_stat=l_isStat;
	}
	static __class__=mt_gml_macro;
}

if(live_enabled)
function ast_gml_macro_proc_patch(l_tks,l_setExclude){
	// ast_gml_macro_proc_patch(tks:array<gml_token>, setExclude:bool)->bool
	/// @ignore
	var l_changed=false;
	var l_i=-1;
	var l_n=array_length(l_tks);
	if(l_setExclude){
		ds_list_clear(ast_gml_macro_proc_next_exclude_list);
		tools__dictionary_dictionary_impl__clear(ast_gml_macro_proc_next_exclude_map);
	}
	while(++l_i<l_n){
		var l_tk=l_tks[l_i];
		var l_pos,l_id;
		if(l_tk[0]==12){
			l_pos=l_tk[1];
			l_id=l_tk[2];
		} else continue;
		var l_nm=variable_struct_get(ast_gml_macro_proc_map,l_id);
		if(l_nm==undefined)continue;
		if(variable_struct_exists(ast_gml_macro_proc_exclude_map,l_id))continue;
		if(!variable_struct_exists(ast_gml_macro_proc_next_exclude_map,l_id)){
			variable_struct_set(ast_gml_macro_proc_next_exclude_map,l_id,true);
			ds_list_add(ast_gml_macro_proc_next_exclude_list,l_id);
		}
		var l_ntks=l_nm.h_tokens;
		var l_ntkn=array_length(l_ntks);
		switch(l_ntkn){
			case 0:
				gml_std_gml_internal_ArrayImpl_splice(l_tks,l_i,1);
				l_i--;
				l_n--;
				break;
			case 1:l_tks[@l_i]=l_ntks[0];break;
			default:
				l_tks[@l_i]=l_ntks[0];
				l_n+=l_ntkn-1;
				var l_k=l_ntkn;
				while(--l_k>=1){
					array_insert(l_tks,l_i+1,l_ntks[l_k]);
				}
		}
		l_changed=true;
	}
	if(l_changed&&l_setExclude){
		for(var l_k=0,l__g1=ds_list_size(ast_gml_macro_proc_next_exclude_list);l_k<l__g1;l_k++){
			variable_struct_set(ast_gml_macro_proc_exclude_map,ds_list_find_value(ast_gml_macro_proc_next_exclude_list,l_k),true);
		}
	}
	return l_changed;
}

if(live_enabled)
function ast_gml_macro_proc_patch_nameof(l_tks,l_source){
	// ast_gml_macro_proc_patch_nameof(tks:array<gml_token>, source:gml_source)->bool
	/// @ignore
	var l_changed=false;
	var l_i=-1;
	var l_n=array_length(l_tks);
	while(++l_i<l_n-2){
		var l_tk=l_tks[l_i];
		var l_outData;
		if(l_tk[0]==12){
			if(l_tk[2]=="nameof")l_outData=l_tk[1]; else continue;
		} else continue;
		var l_startInd=l_i;
		var l_startPos;
		var l__g=l_tks[l_i+1];
		if(l__g[0]==21){
			var l_d1=l__g[1];
			l_startPos=l_d1[4]+1;
		} else continue;
		l_i++;
		var l_depth=1;
		var l_endPos=-1;
		while(++l_i<l_n){
			l_tk=l_tks[l_i];
			switch(l_tk[0]){
				case gml_token.par_open:l_depth++;break;
				case gml_token.par_close:l_depth--;break;
			}
			if(l_depth<=0){
				l_endPos=l_tk[1][4];
				l_i++;
				break;
			}
		}
		if(l_endPos<0)continue;
		var l_count=l_i-l_startInd-1;
		gml_std_gml_internal_ArrayImpl_splice(l_tks,l_startInd+1,l_count);
		l_i-=l_count;
		l_n-=l_count;
		var l_snip=gml_std_string_substring(l_source.h_code,l_startPos,l_endPos);
		l_snip=gml_std_StringTools_trim(l_snip);
		l_tks[@l_startInd]=[gml_token.cstring,l_outData,l_snip];
		l_changed=true;
	}
	return l_changed;
}

if(live_enabled)
function ast_gml_macro_proc_run(l_pg,l_builders){
	// ast_gml_macro_proc_run(pg:gml_program, builders:array<gml_builder>)->bool
	/// @ignore
	tools__dictionary_dictionary_impl__clear(ast_gml_macro_proc_map);
	ds_list_clear(ast_gml_macro_proc_list);
	var l__g=0;
	while(l__g<array_length(l_builders)){
		var l_b=l_builders[l__g];
		l__g++;
		if(l_b.h_error_text==undefined&&l_b.h_source.h_version.h_has_nameof){
			if(ast_gml_macro_proc_patch_nameof(l_b.h_tokens,l_b.h_source))l_b.h_length=array_length(l_b.h_tokens);
		}
	}
	var l__g=0;
	while(l__g<array_length(l_builders)){
		var l_b=l_builders[l__g];
		l__g++;
		if(l_b.h_error_text==undefined){
			var l_macros=l_b.h_source.h_parser.h_macros;
			for(var l_i=0,l__g2=array_length(l_macros);l_i<l__g2;l_i++){
				var l_m=l_macros[l_i];
				var l_config=l_m.h_config;
				if(l_config!=undefined&&l_config!=live_config)continue;
				if(variable_struct_exists(ast_gml_macro_proc_map,l_m.h_name)){
					l_pg.h_error_text="Macro redifinition (first at "+gml_pos_to_string(variable_struct_get(ast_gml_macro_proc_map,l_m.h_name).h_pos,l_pg)+")";
					l_pg.h_error_pos=l_m.h_pos;
					return true;
				}
				variable_struct_set(ast_gml_macro_proc_map,l_m.h_name,l_m);
				ds_list_add(ast_gml_macro_proc_list,l_m);
			}
		}
	}
	var l__g=0;
	var l__g1=ast_gml_macro_proc_list;
	while(l__g<ds_list_size(l__g1)){
		var l_m=ds_list_find_value(l__g1,l__g);
		l__g++;
		tools__dictionary_dictionary_impl__clear(ast_gml_macro_proc_exclude_map);
		variable_struct_set(ast_gml_macro_proc_exclude_map,l_m.h_name,true);
		var l_tks=l_m.h_tokens;
		for(var l_step=0;l_step<64;l_step++){
			if(!ast_gml_macro_proc_patch(l_tks,true))break;
		}
	}
	tools__dictionary_dictionary_impl__clear(ast_gml_macro_proc_exclude_map);
	var l__g=0;
	while(l__g<array_length(l_builders)){
		var l_b=l_builders[l__g];
		l__g++;
		if(l_b.h_error_text==undefined){
			if(ast_gml_macro_proc_patch(l_b.h_tokens,false))l_b.h_length=array_length(l_b.h_tokens);
		}
	}
	return false;
}

if(live_enabled)
function ast_gml_node_def_param(l__name,l__type)constructor{
	// ast_gml_node_def_param(_name:string, _type:ast_GmlNodeDefType)
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_type=undefined; /// @is {ast_GmlNodeDefType}
	self.h_name=l__name;
	self.h_type=l__type;
	static __class__=mt_ast_gml_node_def_param;
}

if(live_enabled)
function ast_gml_node_def_ctr(l__name,l__params)constructor{
	// ast_gml_node_def_ctr(_name:string, _params:array<ast_gml_node_def_param>)
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_params=undefined; /// @is {array<ast_gml_node_def_param>}
	static h_has_children=undefined; /// @is {bool}
	self.h_has_children=false;
	self.h_name=l__name;
	self.h_params=l__params;
	var l__g=0;
	while(l__g<array_length(l__params)){
		var l_param=l__params[l__g];
		l__g++;
		var l_t=l_param.h_type;
		if(l_t==2||l_t==1){
			self.h_has_children=true;
			break;
		}
	}
	static __class__=mt_ast_gml_node_def_ctr;
}

if(live_enabled)
function ast_gml_node_tools_ni_concat_pos_iter(l_q,l_st){
	// ast_gml_node_tools_ni_concat_pos_iter(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	gml_std_haxe_enum_tools_setParameter(l_q,0,gml_pos_concat(gml_std_haxe_enum_tools_getParameter(l_q,0),ast_gml_node_tools_ni_concat_pos_pos));
	return gml_node_tools_seek(l_q,undefined,ast_gml_node_tools_ni_concat_pos_iter);
}

if(live_enabled)
function ast_gml_node_tools_ni_concat_pos_rec(l_q,l_p){
	// ast_gml_node_tools_ni_concat_pos_rec(q:ast_GmlNode, p:gml_pos)
	/// @ignore
	ast_gml_node_tools_ni_concat_pos_pos=l_p;
	ast_gml_node_tools_ni_concat_pos_iter(l_q,undefined);
}

if(live_enabled)
function ast_gml_node_tools_ni_get_pos_string(l_q,l_pg){
	// ast_gml_node_tools_ni_get_pos_string(q:ast_GmlNode, pg:gml_program)->string
	/// @ignore
	return gml_pos_to_string(gml_std_haxe_enum_tools_getParameter(l_q,0),l_pg);
}

if(live_enabled)
function gml_pos_create(l_src,l_row,l_col,l_ofs){
	// gml_pos_create(src:ast_GmlPosSource, row:int, col:int, ofs:int)
	/// @ignore
	var l_this=array_create(5);
	/// @typedef {tuple<src:ast_GmlPosSource,row:int,col:int,next:gml_pos,ofs:int>} gml_pos
	l_this[@3]=undefined;
	l_this[@0]=l_src;
	l_this[@1]=l_row;
	l_this[@2]=l_col;
	l_this[@4]=l_ofs;
	return l_this;
}

if(live_enabled)
function gml_pos_get_source(l_this,l_pg){
	// gml_pos_get_source(this:gml_pos, pg:gml_program)->gml_source
	/// @ignore
	return l_pg.h_get_source(l_this[0]);
}

if(live_enabled)
function gml_pos_copy(l_this){
	// gml_pos_copy(this:gml_pos)->gml_pos
	/// @ignore
	var l_r=gml_pos_create(l_this[0],l_this[1],l_this[2],l_this[4]);
	if(l_this[3]!=undefined)l_r[@3]=gml_pos_copy(l_this[3]);
	return l_r;
}

if(live_enabled)
function gml_pos_concat(l_this,l_p){
	// gml_pos_concat(this:gml_pos, p:gml_pos)->gml_pos
	/// @ignore
	var l_r=gml_pos_copy(l_p);
	var l_l=l_r;
	while(l_l[3]!=undefined){
		l_l=l_l[3];
	}
	l_l[@3]=l_this;
	return l_r;
}

if(live_enabled)
function gml_pos_to_string(l_this,l_pg){
	// gml_pos_to_string(this:gml_pos, pg:gml_program)->string
	/// @ignore
	var l_name;
	if(l_pg!=undefined)l_name=l_pg.h_get_source(l_this[0]).h_name; else l_name="?";
	var l_r=l_name+(" [line "+string(l_this[1])+", col "+string(l_this[2])+"]");
	if(l_this[3]!=undefined)l_r+=">"+gml_pos_to_string(l_this[3],l_pg);
	return l_r;
}

if(live_enabled)
function gml_pos_to_string_in(l_this,l_src){
	// gml_pos_to_string_in(this:gml_pos, src:gml_source)->string
	/// @ignore
	return (l_src.h_name+("[L"+string(l_this[1])+",c"+string(l_this[2])+"]"));
}

if(live_enabled)
function gml_script(l_src,l_name,l_pos)constructor{
	// gml_script(src:gml_source, name:string, pos:gml_pos)
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_pos=undefined; /// @is {gml_pos}
	static h_index=undefined; /// @is {int}
	static h_node=undefined; /// @is {ast_GmlNode}
	static h_source=undefined; /// @is {gml_source}
	static h_local_map=undefined; /// @is {tools_Dictionary<int>}
	static h_local_names=undefined; /// @is {array<string>}
	static h_locals=undefined; /// @is {int}
	static h_prefix_statements=undefined; /// @is {array<ast_GmlNode>}
	static h_is_function=undefined; /// @is {bool}
	static h_is_constructor=undefined; /// @is {bool}
	static h_parent_name=undefined; /// @is {string}
	static h_parent_is_global=undefined; /// @is {bool}
	static h_parent_argc=undefined; /// @is {int}
	static h_static_map=undefined; /// @is {tools_Dictionary<int>}
	static h_static_names=undefined; /// @is {array<string>}
	static h_static_count=undefined; /// @is {int}
	static h_static_init=undefined; /// @is {array<ast_GmlNode>}
	static h_script_id=undefined; /// @is {script}
	static h_get_uses_script_static=function(){
		return !self.h_is_constructor&&self.h_script_id!=-1;
	}
	static h_static_struct=undefined; /// @is {haxe_DynamicAccess<any>}
	static h_get_uses_static_struct=function(){
		return false;
	}
	static h_static_values=undefined; /// @is {array<any>}
	static h_static_ready=undefined; /// @is {array<bool>}
	static h_arguments=undefined; /// @is {int}
	static h_named_args=undefined; /// @is {tools_Dictionary<int>}
	static h_uses_args=undefined; /// @is {bool}
	static h_actions=undefined; /// @is {gml_action_list}
	static h_destroy=function(){
		self.h_local_map=undefined;
		self.h_static_map=undefined;
		if(self.h_actions!=undefined){
			var l_this1=self.h_actions;
			for(var l_i=0,l__g1=ds_list_size(l_this1);l_i<l__g1;l_i++){
				var l_q=ds_list_find_value(l_this1,l_i);
				if(l_q!=undefined){
					if(l_q.__enumIndex__==97)ds_map_destroy(l_q.h_jumptable);
				}
			}
			ds_list_destroy(l_this1);
			self.h_actions=undefined;
		}
	}
	static h_is_valid=function(){
		return self.h_actions!=undefined;
	}
	static h_seek=function(l_iter,l_stack){
		var l__scr=gml_program_seek_script;
		gml_program_seek_script=self;
		l_iter(self.h_node,l_stack);
		gml_program_seek_script=l__scr;
	}
	self.h_actions=undefined;
	self.h_uses_args=false;
	self.h_named_args=undefined;
	self.h_arguments=0;
	self.h_static_ready=[false];
	self.h_static_values=[];
	self.h_static_struct=(compile_groups_gml_compile_group_static_has_statics?{}:undefined);
	self.h_script_id=-1;
	self.h_static_init=[];
	self.h_static_count=0;
	self.h_static_names=[];
	self.h_static_map={}
	self.h_parent_argc=0;
	self.h_parent_is_global=false;
	self.h_parent_name=undefined;
	self.h_is_constructor=false;
	self.h_is_function=false;
	self.h_prefix_statements=undefined;
	self.h_locals=0;
	self.h_local_names=[];
	self.h_local_map={}
	self.h_source=l_src;
	self.h_name=l_name;
	self.h_pos=l_pos;
	static __class__=mt_gml_script;
}

if(live_enabled)
function gml_source(l_name,l_code,l_main,l_opt)constructor{
	// gml_source(name:string, code:string, ?main:string, opt:bool = false)
	/// @ignore
	static h_index=undefined; /// @is {ast_GmlSourceId}
	static h_name=undefined; /// @is {string}
	static h_code=undefined; /// @is {string}
	static h_main=undefined; /// @is {string}
	static h_length=undefined; /// @is {int}
	static h_opt=undefined; /// @is {bool}
	static h_parser=undefined; /// @is {gml_parser}
	static h___eof=undefined; /// @is {gml_pos}
	static h_get_pos_source=function(){
		return self.h_index;
	}
	static h_get_eof=function(){
		if(self.h___eof==undefined)self.h___eof=gml_pos_create(self.h_index,string_count("\n",self.h_code)+2,1,self.h_length);
		return self.h___eof;
	}
	static h_version=undefined; /// @is {api_api_version}
	static h_to_string=function(){
		return "GmlSource(\""+self.h_name+"\")";
	}
	if(l_opt==undefined)l_opt=false;
	if(false)show_debug_message(argument[3]);
	self.h_version=undefined;
	self.h___eof=undefined;
	self.h_index=-1;
	self.h_name=l_name;
	self.h_code=l_code;
	self.h_opt=l_opt;
	if(l_main==undefined){
		l_main=l_name;
		var l_i=gml_std_string_last_pos_haxe(l_main,"/");
		var l_k=gml_std_string_last_pos_haxe(l_main,"\\");
		if(l_i<0||l_k>l_i)l_i=l_k;
		l_i=gml_std_string_pos_ext_haxe(l_main,".");
		if(l_i>=0)l_main=gml_std_string_substring(l_main,0,l_i);
	}
	self.h_main=l_main;
	self.h_length=string_length(l_code);
	static __class__=mt_gml_source;
}

if(live_enabled)
function gml_source_init_unknown(){
	// gml_source_init_unknown()->gml_source
	/// @ignore
	var l_src=new gml_source("unknown","",undefined,true);
	l_src.h_index=-1;
	l_src.h_version=gml_parser_default_version;
	return l_src;
}

if(live_enabled)
function gml_source_init_builtin(){
	// gml_source_init_builtin()->gml_source
	/// @ignore
	var l_src=new gml_source("built-in","",undefined,true);
	l_src.h_index=-2;
	l_src.h_version=gml_parser_default_version;
	return l_src;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v(l_d){
	// data_gml_keyword_mapper_init_v(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,0];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v1(l_d){
	// data_gml_keyword_mapper_init_v1(d:ast_GmlNodeData)->gml_token
	/// @ignore
	return [gml_token.boolean,l_d,true];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v2(l_d){
	// data_gml_keyword_mapper_init_v2(d:ast_GmlNodeData)->gml_token
	/// @ignore
	return [gml_token.boolean,l_d,false];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v3(l_d){
	// data_gml_keyword_mapper_init_v3(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.number,l_d,-3,undefined];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v4(l_d){
	// data_gml_keyword_mapper_init_v4(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.number,l_d,-4,undefined];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v5(l_d){
	// data_gml_keyword_mapper_init_v5(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.undefined_hx,l_d];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v6(l_d){
	// data_gml_keyword_mapper_init_v6(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.cub_open,l_d];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v7(l_d){
	// data_gml_keyword_mapper_init_v7(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.cub_close,l_d];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v8(l_d){
	// data_gml_keyword_mapper_init_v8(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,1];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v9(l_d){
	// data_gml_keyword_mapper_init_v9(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,2];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v10(l_d){
	// data_gml_keyword_mapper_init_v10(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,3];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v11(l_d){
	// data_gml_keyword_mapper_init_v11(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,4];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v12(l_d){
	// data_gml_keyword_mapper_init_v12(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,5];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v13(l_d){
	// data_gml_keyword_mapper_init_v13(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,6];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v14(l_d){
	// data_gml_keyword_mapper_init_v14(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,7];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v15(l_d){
	// data_gml_keyword_mapper_init_v15(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,8];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v16(l_d){
	// data_gml_keyword_mapper_init_v16(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,9];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v17(l_d){
	// data_gml_keyword_mapper_init_v17(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,14];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v18(l_d){
	// data_gml_keyword_mapper_init_v18(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,10];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v19(l_d){
	// data_gml_keyword_mapper_init_v19(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,11];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v20(l_d){
	// data_gml_keyword_mapper_init_v20(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,13];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v21(l_d){
	// data_gml_keyword_mapper_init_v21(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,12];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v22(l_d){
	// data_gml_keyword_mapper_init_v22(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,15];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v23(l_d){
	// data_gml_keyword_mapper_init_v23(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,19];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v24(l_d){
	// data_gml_keyword_mapper_init_v24(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,18];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v25(l_d){
	// data_gml_keyword_mapper_init_v25(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,17];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v26(l_d){
	// data_gml_keyword_mapper_init_v26(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,16];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v27(l_d){
	// data_gml_keyword_mapper_init_v27(d:gml_pos)->gml_token?
	/// @ignore
	if(gml_parser_curr_version.h_has_try_catch)return [gml_token.keyword,l_d,21]; else return undefined;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v28(l_d){
	// data_gml_keyword_mapper_init_v28(d:gml_pos)->gml_token?
	/// @ignore
	if(gml_parser_curr_version.h_has_try_catch)return [gml_token.keyword,l_d,22]; else return undefined;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v29(l_d){
	// data_gml_keyword_mapper_init_v29(d:gml_pos)->gml_token?
	/// @ignore
	if(gml_parser_curr_version.h_has_try_catch)return [gml_token.keyword,l_d,23]; else return undefined;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v30(l_d){
	// data_gml_keyword_mapper_init_v30(d:gml_pos)->gml_token??
	/// @ignore
	if(gml_parser_curr_version.h_has_constructor)return [gml_token.keyword,l_d,25]; else return undefined;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v31(l_d){
	// data_gml_keyword_mapper_init_v31(d:gml_pos)->gml_token??
	/// @ignore
	if(gml_parser_curr_version.h_has_delete)return [gml_token.keyword,l_d,29]; else return undefined;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v32(l_d){
	// data_gml_keyword_mapper_init_v32(d:gml_pos)->gml_token??
	/// @ignore
	if(gml_parser_curr_version.h_has_func_literal)return [gml_token.keyword,l_d,24]; else return undefined;
}

if(live_enabled)
function data_gml_keyword_mapper_init_v33(l_d){
	// data_gml_keyword_mapper_init_v33(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.bin_op,l_d,3];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v34(l_d){
	// data_gml_keyword_mapper_init_v34(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.bin_op,l_d,2];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v35(l_d){
	// data_gml_keyword_mapper_init_v35(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.bin_op,l_d,80];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v36(l_d){
	// data_gml_keyword_mapper_init_v36(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.bin_op,l_d,96];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v37(l_d){
	// data_gml_keyword_mapper_init_v37(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.bin_op,l_d,65];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v38(l_d){
	// data_gml_keyword_mapper_init_v38(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.un_op,l_d,1];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v39(l_d){
	// data_gml_keyword_mapper_init_v39(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,26];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v40(l_d){
	// data_gml_keyword_mapper_init_v40(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.keyword,l_d,27];
}

if(live_enabled)
function data_gml_keyword_mapper_init_v41(l_d){
	// data_gml_keyword_mapper_init_v41(d:gml_pos)->gml_token
	/// @ignore
	return [gml_token.number,l_d,l_d[1],undefined];
}

if(live_enabled)
function data_gml_keyword_mapper_init(){
	// data_gml_keyword_mapper_init()->tools_Dictionary<data_GmlKeywordMapperFunc>
	/// @ignore
	var l_m={}
	variable_struct_set(l_m,"global",data_gml_keyword_mapper_init_v);
	variable_struct_set(l_m,"true",data_gml_keyword_mapper_init_v1);
	variable_struct_set(l_m,"false",data_gml_keyword_mapper_init_v2);
	variable_struct_set(l_m,"all",data_gml_keyword_mapper_init_v3);
	variable_struct_set(l_m,"noone",data_gml_keyword_mapper_init_v4);
	variable_struct_set(l_m,"undefined",data_gml_keyword_mapper_init_v5);
	variable_struct_set(l_m,"begin",data_gml_keyword_mapper_init_v6);
	variable_struct_set(l_m,"end",data_gml_keyword_mapper_init_v7);
	variable_struct_set(l_m,"globalvar",data_gml_keyword_mapper_init_v8);
	variable_struct_set(l_m,"var",data_gml_keyword_mapper_init_v9);
	variable_struct_set(l_m,"enum",data_gml_keyword_mapper_init_v10);
	variable_struct_set(l_m,"if",data_gml_keyword_mapper_init_v11);
	variable_struct_set(l_m,"then",data_gml_keyword_mapper_init_v12);
	variable_struct_set(l_m,"else",data_gml_keyword_mapper_init_v13);
	variable_struct_set(l_m,"switch",data_gml_keyword_mapper_init_v14);
	variable_struct_set(l_m,"case",data_gml_keyword_mapper_init_v15);
	variable_struct_set(l_m,"default",data_gml_keyword_mapper_init_v16);
	variable_struct_set(l_m,"for",data_gml_keyword_mapper_init_v17);
	variable_struct_set(l_m,"repeat",data_gml_keyword_mapper_init_v18);
	variable_struct_set(l_m,"while",data_gml_keyword_mapper_init_v19);
	variable_struct_set(l_m,"do",data_gml_keyword_mapper_init_v20);
	variable_struct_set(l_m,"until",data_gml_keyword_mapper_init_v21);
	variable_struct_set(l_m,"with",data_gml_keyword_mapper_init_v22);
	variable_struct_set(l_m,"exit",data_gml_keyword_mapper_init_v23);
	variable_struct_set(l_m,"return",data_gml_keyword_mapper_init_v24);
	variable_struct_set(l_m,"break",data_gml_keyword_mapper_init_v25);
	variable_struct_set(l_m,"continue",data_gml_keyword_mapper_init_v26);
	variable_struct_set(l_m,"try",data_gml_keyword_mapper_init_v27);
	variable_struct_set(l_m,"catch",data_gml_keyword_mapper_init_v28);
	variable_struct_set(l_m,"throw",data_gml_keyword_mapper_init_v29);
	variable_struct_set(l_m,"new",data_gml_keyword_mapper_init_v30);
	variable_struct_set(l_m,"delete",data_gml_keyword_mapper_init_v31);
	variable_struct_set(l_m,"function",data_gml_keyword_mapper_init_v32);
	variable_struct_set(l_m,"div",data_gml_keyword_mapper_init_v33);
	variable_struct_set(l_m,"mod",data_gml_keyword_mapper_init_v34);
	variable_struct_set(l_m,"and",data_gml_keyword_mapper_init_v35);
	variable_struct_set(l_m,"or",data_gml_keyword_mapper_init_v36);
	variable_struct_set(l_m,"xor",data_gml_keyword_mapper_init_v37);
	variable_struct_set(l_m,"not",data_gml_keyword_mapper_init_v38);
	variable_struct_set(l_m,"argument",data_gml_keyword_mapper_init_v39);
	variable_struct_set(l_m,"argument_count",data_gml_keyword_mapper_init_v40);
	variable_struct_set(l_m,"_GMLINE_",data_gml_keyword_mapper_init_v41);
	return l_m;
}

if(live_enabled)
function gml_std_haxe_class(l_id,l_name)constructor{
	// gml_std_haxe_class(id:int, name:string)
	/// @ignore
	static h_superClass=undefined; /// @is {haxe_class<any>}
	static h_marker=undefined; /// @is {any}
	static h_index=undefined; /// @is {int}
	static h_name=undefined; /// @is {string}
	self.h_superClass=undefined;
	self.h_marker=gml_std_haxe_type_markerValue;
	self.h_index=l_id;
	self.h_name=l_name;
	static __class__="class";
}

if(live_enabled)
function gml_std_haxe_enum(l_id,l_name,l_constructors,l_functions)constructor{
	// gml_std_haxe_enum(id:int, name:string, ?constructors:array<string>, ?functions:array<function>)
	/// @ignore
	static h_constructors=undefined; /// @is {array<string>}
	static h_functions=undefined; /// @is {array<function>}
	static h_marker=undefined; /// @is {any}
	static h_index=undefined; /// @is {int}
	static h_name=undefined; /// @is {string}
	if(false)show_debug_message(argument[3]);
	self.h_marker=gml_std_haxe_type_markerValue;
	self.h_index=l_id;
	self.h_name=l_name;
	self.h_constructors=l_constructors;
	self.h_functions=l_functions;
	static __class__="enum";
}

if(live_enabled)
function gml_seek_adjfix_proc(l_q,l_st){
	// gml_seek_adjfix_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.prefix:
			var l_d=l__g[1];
			var l_x=l__g[2];
			var l_pre;
			l_pre=(l_q[0]==33);
			var l_o;
			var l_inBlock=gml_node_tools_is_in_block(l_q,ds_list_find_value(l_st,0));
			if(l_pre||l_inBlock){
				var l__g1=l_x;
				switch(l__g1[0]){
					case gml_node.ds_map:
						l_o=(l__g[3]?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_map_aop,l_d,l__g1[2],l__g1[3],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					case gml_node.ds_list:
						l_o=(l__g[3]?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_list_aop,l_d,l__g1[2],l__g1[3],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					case gml_node.ds_grid:
						l_o=(l__g[3]?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_grid_aop,l_d,l__g1[2],l__g1[3],l__g1[4],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					case gml_node.key_id:
						l_o=(l__g[3]?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.key_id_aop,l_d,l__g1[2],l__g1[3],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					default:
						if(l_inBlock){
							l_o=(l__g[3]?16:17);
							gml_std_haxe_enum_tools_setTo(l_q,[gml_node.set_op,l_d,l_o,l_x,[gml_node.number,l_d,1,undefined]]);
						}
				}
			}
			break;
		case gml_node.postfix:
			var l_d=l__g[1];
			var l_x=l__g[2];
			var l_b=l__g[3];
			var l_pre;
			l_pre=(l_q[0]==33);
			var l_o;
			var l_inBlock=gml_node_tools_is_in_block(l_q,ds_list_find_value(l_st,0));
			if(l_pre||l_inBlock){
				var l__g=l_x;
				switch(l__g[0]){
					case gml_node.ds_map:
						l_o=(l_b?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_map_aop,l_d,l__g[2],l__g[3],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					case gml_node.ds_list:
						l_o=(l_b?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_list_aop,l_d,l__g[2],l__g[3],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					case gml_node.ds_grid:
						l_o=(l_b?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_grid_aop,l_d,l__g[2],l__g[3],l__g[4],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					case gml_node.key_id:
						l_o=(l_b?16:17);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.key_id_aop,l_d,l__g[2],l__g[3],l_o,[gml_node.number,l_d,1,undefined]]);
						break;
					default:
						if(l_inBlock){
							l_o=(l_b?16:17);
							gml_std_haxe_enum_tools_setTo(l_q,[gml_node.set_op,l_d,l_o,l_x,[gml_node.number,l_d,1,undefined]]);
						}
				}
			}
			break;
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_alarms_check(l_x){
	// gml_seek_alarms_check(x:ast_GmlNode)->ast_GmlNode?
	/// @ignore
	var l__g=l_x;
	if(l__g[0]==55){
		if(l__g[3]=="alarm")return l__g[2]; else return undefined;
	} else return undefined;
}

if(live_enabled)
function gml_seek_alarms_proc(l_q,l_st){
	// gml_seek_alarms_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l_r;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.index:
			l_r=gml_seek_alarms_check(l__g[2]);
			if(l_r!=undefined)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.alarm,l__g[1],l_r,l__g[3]]);
			break;
		case gml_node.raw_id:
			l_r=gml_seek_alarms_check(l__g[2]);
			if(l_r!=undefined)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.alarm,l__g[1],l_r,l__g[3]]);
			break;
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_arguments_proc(l_q,l_st){
	// gml_seek_arguments_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.arg_const:
			var l_i=l__g[2];
			if(gml_program_seek_script.h_arguments<=l_i)gml_program_seek_script.h_arguments=l_i+1;
			break;
		case gml_node.arg_index:gml_program_seek_script.h_uses_args=true;break;
	}
	return false;
}

if(live_enabled)
function gml_seek_calls_proc_func(l_q,l_d,l_fn,l_args1){
	// gml_seek_calls_proc_func(q:ast_GmlNode, d:ast_GmlNodeData, fn:gml_func, args:array<ast_GmlNode>)->bool
	/// @ignore
	var l_fname=l_fn.h_name;
	var l_argCount=array_length(l_args1);
	var l_minArgs=l_fn.h_min_args;
	var l_maxArgs=l_fn.h_max_args;
	if(live_allow_trailing_args)l_maxArgs=65536;
	if(l_fname=="live_call"){
		if(l_argCount!=gml_program_seek_script.h_arguments){
			live_log_script((gml_program_seek_script.h_name+" at "+gml_pos_to_string(gml_program_seek_script.h_pos,gml_program_seek_inst)+" has "+string(gml_program_seek_script.h_arguments)+"argument(s), but "+string(l_argCount)+" are passed to live_call (check documentation for more details)"),1);
		} else if(gml_program_seek_script.h_uses_args&&l_argCount==0){
			live_log_script((gml_program_seek_script.h_name+" at "+gml_pos_to_string(gml_program_seek_script.h_pos,gml_program_seek_inst)+" uses argument[], therefore live_call_ext should be used instead of live_call (check documentation for more details)"),1);
		}
	}
	if(l_argCount<l_minArgs||l_argCount>l_maxArgs){
		var l_e;
		if(l_minArgs==l_maxArgs){
			l_e="`"+l_fname+"` takes "+string(l_minArgs)+" argument";
			if(l_minArgs!=1)l_e+="s";
		} else if(l_argCount<l_minArgs){
			l_e="`"+l_fname+"` requires at least "+string(l_minArgs)+" argument";
			if(l_minArgs!=1)l_e+="s";
		} else {
			l_e="`"+l_fname+"` takes no more than "+string(l_maxArgs)+" argument";
			if(l_maxArgs!=1)l_e+="s";
		}
		l_e+=", got "+string(l_argCount);
		return gml_program_seek_inst.h_error(l_e,gml_std_haxe_enum_tools_getParameter(l_q,0));
	}
	gml_std_haxe_enum_tools_setTo(l_q,[gml_node.call_func,l_d,l_fn,l_args1]);
	return false;
}

if(live_enabled)
function gml_seek_calls_proc(l_q,l_st){
	// gml_seek_calls_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l_n,l_s;
	var l__g=l_q;
	if(l__g[0]==23){
		var l_d=l__g[1];
		var l_x=l__g[2];
		var l_args1=l__g[3];
		var l__g=l_x;
		switch(l__g[0]){
			case gml_node.script:
				var l_o=l__g[2];
				l_n=l_o.h_arguments;
				l_s=l_o.h_name;
				gml_std_haxe_enum_tools_setTo(l_q,[gml_node.call_script,l_d,l_s,l_args1]);
				break;
			case gml_node.field:gml_std_haxe_enum_tools_setTo(l_q,[gml_node.call_field,l_d,l__g[2],l__g[3],l_args1]);break;
			case gml_node.ident:
				var l_s1=l__g[2];
				var l_fn=variable_struct_get(gml_func_map,l_s1);
				if(l_fn==undefined){
					if(gml_program_seek_inst.h_get_source(l_d[0]).h_version.h_has_value_calls)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.call_script_id,l_d,l_x,l_args1]); else return gml_program_seek_inst.h_error("`"+l_s1+"` is not a function or script",gml_std_haxe_enum_tools_getParameter(l_x,0));
				} else if(gml_seek_calls_proc_func(l_q,l_d,l_fn,l_args1)){
					return true;
				}
				break;
			case gml_node.native_script:
				var l_s=l__g[2];
				var l_fn=variable_struct_get(gml_func_map,l_s);
				if(l_fn==undefined){
					if(gml_program_seek_inst.h_get_source(l_d[0]).h_version.h_has_value_calls)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.call_script_id,l_d,l_x,l_args1]); else return gml_program_seek_inst.h_error("`"+l_s+"` is not a function or script",gml_std_haxe_enum_tools_getParameter(l_x,0));
				} else if(gml_seek_calls_proc_func(l_q,l_d,l_fn,l_args1)){
					return true;
				}
				break;
			default:if(gml_program_seek_inst.h_get_source(l_d[0]).h_version.h_has_value_calls)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.call_script_id,l_d,l_x,l_args1]); else return gml_program_seek_inst.h_error("Expression is not callable",gml_std_haxe_enum_tools_getParameter(l_x,0));
		}
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_enum_fields_proc_one(l_q,l_st){
	// gml_seek_enum_fields_proc_one(q:ast_GmlNode, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	var l__g=l_q;
	if(l__g[0]==55){
		var l_d=l__g[1];
		var l_x=l__g[2];
		var l_f=l__g[3];
		var l__g=l_x;
		switch(l__g[0]){
			case gml_node.ident:
				var l_s=l__g[2];
				var l_e=variable_struct_get(gml_program_seek_inst.h_enum_map,l_s);
				if(l_e==undefined)l_e=variable_struct_get(gml_enum_map,l_s);
				if(l_e!=undefined){
					if(!l_e.h_has_values)gml_seek_enum_values_proc_one(l_e);
					var l_c=variable_struct_get(l_e.h_ctr_map,l_f);
					if(l_c!=undefined){
						if(l_c.h_value==undefined)return gml_program_seek_inst.h_error("Recursive enum reference to "+l_s+"."+l_f,l_d);
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.number,l_d,l_c.h_value,undefined]);
						return false;
					} else return gml_program_seek_inst.h_error("Enum `"+l_s+"` does not contain field `"+l_f+"`",l_d);
				}
				break;
			case gml_node.native_script:
				var l_s=l__g[2];
				if(l__g[3]>=gml_script_index_offset){
					gml_std_haxe_enum_tools_setTo(l_q,[gml_node.script_static,l_d,l_s,l_f]);
					return false;
				}
				break;
			case gml_node.script:
				var l_scr=l__g[2];
				if(!l_scr.h_is_constructor&&l_scr.h_script_id!=-1){
					gml_std_haxe_enum_tools_setTo(l_q,[gml_node.script_static,l_d,l_scr.h_name,l_f]);
					return false;
				}
				break;
		}
		var l_av=variable_struct_get(api_api_var_map,l_f);
		if(l_av!=undefined){
			if((l_av.h_flags&4)==0)return gml_program_seek_inst.h_error("`"+l_f+"` is not an instance-specific variable.",l_d);
		}
	}
	return gml_node_tools_seek(l_q,l_st,gml_seek_enum_fields_proc_one);
}

if(live_enabled)
function gml_seek_enum_fields_proc(l_q,l_st){
	// gml_seek_enum_fields_proc(q:ast_GmlNode, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	return gml_seek_enum_fields_proc_one(l_q,l_st);
}

if(live_enabled)
function gml_seek_enum_values_proc_one(l_e){
	// gml_seek_enum_values_proc_one(e:gml_enum)->bool
	/// @ignore
	l_e.h_has_values=true;
	var l_next=0;
	var l__g=0;
	var l__g1=l_e.h_ctr_list;
	while(l__g<array_length(l__g1)){
		var l_c=l__g1[l__g];
		l__g++;
		if(l_c.h_node!=undefined){
			var l_st=ds_list_create();
			var l__seekFunc=gml_program_seek_func;
			gml_program_seek_func=gml_seek_idents_proc;
			gml_program_seek_script=undefined;
			gml_seek_idents_proc(l_c.h_node,l_st);
			gml_program_seek_func=l__seekFunc;
			ds_list_destroy(l_st);
			gml_seek_enum_fields_proc_one(l_c.h_node,undefined);
			gml_seek_eval_eval(l_c.h_node);
			var l_node=l_c.h_node;
			var l_v=gml_seek_eval_node_to_value(l_node);
			if(is_numeric(l_v)){
				l_c.h_value=floor(l_v);
				l_next=l_c.h_value+1;
			} else if(l_v!=gml_seek_eval_invalid_value){
				return gml_program_seek_inst.h_error("Enum values should be integer",gml_std_haxe_enum_tools_getParameter(l_node,0));
			} else return gml_program_seek_inst.h_error(("Enum values should be constant"+g_gml_node_constructors[l_node[0]]),gml_std_haxe_enum_tools_getParameter(l_c.h_node,0));
		} else l_c.h_value=l_next++;
	}
	return false;
}

if(live_enabled)
function gml_seek_enum_values_proc(){
	// gml_seek_enum_values_proc()->bool
	/// @ignore
	var l__g=0;
	var l__g1=gml_program_seek_inst.h_enum_array;
	while(l__g<array_length(l__g1)){
		var l_e=l__g1[l__g];
		l__g++;
		if(gml_seek_enum_values_proc_one(l_e))return true;
	}
	return false;
}

if(live_enabled)
function gml_seek_eval_node_to_value(l_node){
	// gml_seek_eval_node_to_value(node:ast_GmlNode)->any
	/// @ignore
	var l__g=l_node;
	switch(l__g[0]){
		case gml_node.undefined_hx:return undefined;
		case gml_node.number:return l__g[2];
		case gml_node.cstring:return l__g[2];
		case gml_node.const:return variable_struct_get(gml_const_val,l__g[2]);
		case gml_node.enum_ctr:return l__g[3].h_value;
		case gml_node.native_script:return l__g[3];
		default:return gml_seek_eval_invalid_value;
	}
}

if(live_enabled)
function gml_seek_eval_value_to_node(l_val,l_d){
	// gml_seek_eval_value_to_node(val:any, d:ast_GmlNodeData)->ast_GmlNode
	/// @ignore
	if(is_bool(l_val))return [gml_node.boolean,l_d,l_val];
	if(is_numeric(l_val))return [gml_node.number,l_d,l_val,undefined];
	if(is_string(l_val))return [gml_node.cstring,l_d,l_val];
	if(l_val==undefined)return [gml_node.undefined_hx,l_d];
	if(is_ptr(l_val))return [gml_node.other_const,l_d,l_val];
	return undefined;
}

if(live_enabled)
function gml_seek_eval_proc(l_q,l_st){
	// gml_seek_eval_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l_f1,l_f2;
	var l_z=true;
	var l_v1,l_v2,l_i,l_n;
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.undefined_hx:break;
		case gml_node.number:break;
		case gml_node.cstring:break;
		case gml_node.const:break;
		case gml_node.bin_op:
			var l__g2=l__g[2];
			if(l__g2==16){
				var l_d=l__g[1];
				var l_a=l__g[3];
				var l_b=l__g[4];
				if(gml_seek_eval_proc(l_a,l_st))l_z=false;
				if(gml_seek_eval_proc(l_b,l_st))l_z=false;
				if(l_z){
					l_v1=gml_seek_eval_node_to_value(l_a);
					l_v2=gml_seek_eval_node_to_value(l_b);
					if(is_string(l_v1)){
						if(is_string(l_v2)){
							gml_std_haxe_enum_tools_setTo(l_q,[gml_node.cstring,l_d,l_v1+l_v2]);
						} else {
							var l__g=l_b;
							if(l__g[0]==36){
								if(l__g[2]==16){
									var l__hx_tmp=l__g[3];
									if(l__hx_tmp[0]==3){
										gml_std_haxe_enum_tools_setTo(l_q,[gml_node.bin_op,l_d,16,[gml_node.cstring,l_d,l_v1+l__hx_tmp[2]],l__g[4]]);
									} else {
										gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
										gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
										l_z=false;
									}
								} else {
									gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
									gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
									l_z=false;
								}
							} else {
								gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
								gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
								l_z=false;
							}
						}
					} else if(is_numeric(l_v1)){
						if(is_numeric(l_v2)){
							gml_std_haxe_enum_tools_setTo(l_q,[gml_node.number,l_d,l_v1+l_v2,undefined]);
						} else {
							gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
							gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
							l_z=false;
						}
					} else if(is_string(l_v2)){
						var l__g=l_a;
						if(l__g[0]==36){
							if(l__g[2]==16){
								var l__hx_tmp=l__g[4];
								if(l__hx_tmp[0]==3){
									gml_std_haxe_enum_tools_setTo(l_q,[gml_node.bin_op,l_d,16,l__g[3],[gml_node.cstring,l_d,l__hx_tmp[2]+l_v2]]);
								} else {
									gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
									gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
									l_z=false;
								}
							} else {
								gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
								gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
								l_z=false;
							}
						} else {
							gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
							gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
							l_z=false;
						}
					} else {
						gml_seek_eval_error_text="Can't add "+gml_std_Type_enumConstructor(l_a)+" and "+gml_std_Type_enumConstructor(l_b)+" at compile time";
						gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
						l_z=false;
					}
				}
			} else {
				var l_o=l__g2;
				var l_d=l__g[1];
				var l_a1=l__g[3];
				var l_b1=l__g[4];
				if(gml_seek_eval_proc(l_a1,l_st))l_z=false;
				if(gml_seek_eval_proc(l_b1,l_st))l_z=false;
				if(l_z){
					l_v1=gml_seek_eval_node_to_value(l_a1);
					l_v2=gml_seek_eval_node_to_value(l_b1);
					if(is_numeric(l_v1)&&is_numeric(l_v2)){
						l_f1=l_v1;
						l_f2=l_v2;
						switch(l_o){
							case 16:l_f1+=l_f2;break;
							case 17:l_f1-=l_f2;break;
							case 0:l_f1*=l_f2;break;
							case 1:l_f1/=l_f2;break;
							case 2:l_f1%=l_f2;break;
							case 3:
								if(l_f2==0&&is_int64(l_f2)&&is_int64(l_f1))show_error("Division by zero",true);
								l_f1=(l_f1 div l_f2);
								break;
							case 49:l_f1=(l_f1&l_f2);break;
							case 48:l_f1=(l_f1|l_f2);break;
							case 50:l_f1=(l_f1^l_f2);break;
							case 32:l_f1=(l_f1<<l_f2);break;
							case 33:l_f1=(l_f1>>l_f2);break;
							case 64:l_f1=l_f1==l_f2;break;
							case 65:l_f1=l_f1!=l_f2;break;
							case 67:l_f1=l_f1<=l_f2;break;
							case 69:l_f1=l_f1>=l_f2;break;
							case 66:l_f1=l_f1<l_f2;break;
							case 68:l_f1=l_f1>l_f2;break;
							case 80:l_f1=l_f1&&l_f2;break;
							case 96:l_f1=l_f1||l_f2;break;
							default:
								gml_seek_eval_error_text="Can't apply "+gml_op_get_name(l_o);
								gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
								l_z=false;
						}
						if(l_z)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.number,l_d,l_f1,undefined]);
					} else {
						gml_seek_eval_error_text="Can't apply "+gml_op_get_name(l_o)+" to "+gml_std_Type_enumConstructor(l_a1)+" and "+gml_std_Type_enumConstructor(l_b1);
						gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
						l_z=false;
					}
				}
			}
			break;
		case gml_node.call_func:
			var l_fn=l__g[2];
			var l_args1=l__g[3];
			l_n=array_length(l_args1);
			for(l_i=0;l_i<l_n;l_i++){
				if(gml_seek_eval_proc(l_args1[l_i],l_st))l_z=false;
			}
			if(l_z&&l_fn.h_is_const){
				var l_evalArgs=array_create(l_n);
				var l_val;
				l_i=0;
				while(l_i<l_n){
					l_val=gml_seek_eval_node_to_value(l_args1[l_i]);
					if(l_val!=gml_seek_eval_invalid_value){
						l_evalArgs[@l_i]=l_val;
						l_i++;
					} else break;
				}
				if(l_i>=l_n){
					var l_th=gml_seek_eval_eval_thread;
					if(l_th==undefined){
						l_th=new gml_thread(gml_program_seek_inst,gml_seek_eval_eval_actions,array_create(0),array_create(0),undefined,undefined,0);
						gml_seek_eval_eval_thread=l_th;
					}
					var l_th0=gml_thread_current;
					gml_thread_current=l_th;
					l_th.h_status=1;
					var l_fn1=l_fn.h_func;
					l_val=(l_n<81?script_execute(vm_gml_thread_exec_slice_funcs[l_n],l_fn1,l_evalArgs,0):vm_gml_thread_exec_slice_longcall(l_fn1,l_evalArgs,0,l_n));
					gml_thread_current=l_th0;
					if(l_th.h_status!=4){
						var l_next=gml_seek_eval_value_to_node(l_val,gml_std_haxe_enum_tools_getParameter(l_q,0));
						if(l_next!=undefined){
							gml_std_haxe_enum_tools_setTo(l_q,l_next);
						} else {
							gml_seek_eval_error_text="Could not translate "+gml_value_print(l_val)+" ("+gml_value_get_type(l_val)+") compile-time";
							gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
						}
					} else {
						gml_seek_eval_error_text="Could not evaluate compile-time: "+l_th.h_error_text;
						gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
					}
				}
			}
			break;
		default:
			if(gml_seek_eval_eval_rec){
				if(gml_node_tools_seek(l_q,l_st,gml_seek_eval_proc))l_z=false;
			} else {
				gml_seek_eval_error_text=gml_std_Type_enumConstructor(l_q)+" doesn't seem to be a constant expression.";
				gml_seek_eval_error_pos=gml_std_haxe_enum_tools_getParameter(l_q,0);
				l_z=false;
			}
	}
	return !l_z;
}

if(live_enabled)
function gml_seek_eval_eval(l_q){
	// gml_seek_eval_eval(q:ast_GmlNode)->bool
	/// @ignore
	gml_seek_eval_eval_rec=false;
	var l_r=gml_seek_eval_proc(l_q,undefined);
	gml_seek_eval_eval_thread=undefined;
	return l_r;
}

if(live_enabled)
function gml_seek_eval_opt(){
	// gml_seek_eval_opt()->bool
	/// @ignore
	gml_seek_eval_eval_rec=true;
	gml_program_seek_inst.h_seek(gml_seek_eval_proc);
	gml_seek_eval_eval_thread=undefined;
	return false;
}

if(live_enabled)
function gml_seek_fields_proc(l_q,l_st){
	// gml_seek_fields_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l__g=l_q;
	if(l__g[0]==55){
		var l_d=l__g[1];
		var l_x=l__g[2];
		var l_s=l__g[3];
		if(l_x[0]==16)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.global_hx,l_d,l_s]);
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_idents_proc(l_q,l_st){
	// gml_seek_idents_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l_d,l_s;
	var l__g=l_q;
	if(l__g[0]==13){
		l_d=l__g[1];
		l_s=l__g[2];
	} else {
		l_d=undefined;
		l_s=undefined;
	}
	if(l_d!=undefined)for(var l__=0;l__<1;l__++){
		var l_scr=gml_program_seek_script;
		if(l_scr!=undefined){
			var l_i=variable_struct_get(l_scr.h_named_args,l_s);
			if(l_i!=undefined){
				gml_std_haxe_enum_tools_setTo(l_q,[gml_node.arg_const,l_d,l_i]);
				continue;
			}
			l_i=variable_struct_get(l_scr.h_local_map,l_s);
			if(l_i!=undefined){
				gml_std_haxe_enum_tools_setTo(l_q,[gml_node.local_hx,l_d,l_s]);
				continue;
			}
			l_i=variable_struct_get(l_scr.h_static_map,l_s);
			if(l_i!=undefined){
				gml_std_haxe_enum_tools_setTo(l_q,[gml_node.static_hx,l_d,l_s]);
				continue;
			}
		}
		var l_mcr=variable_struct_get(gml_program_seek_inst.h_macro_map,l_s);
		if(l_mcr!=undefined){
			gml_std_haxe_enum_tools_setTo(l_q,gml_node_tools_clone(l_mcr.h_node));
			ast_gml_node_tools_ni_concat_pos_rec(l_q,l_d);
			gml_seek_idents_proc(l_q,l_st);
			continue;
		}
		if(variable_struct_get(gml_const_map,l_s)==true){
			var l_val=variable_struct_get(gml_const_val,l_s);
			var l_valNode=gml_seek_eval_value_to_node(l_val,l_d);
			if(l_valNode!=undefined)gml_std_haxe_enum_tools_setTo(l_q,l_valNode); else return gml_program_seek_inst.h_error(("Cannot create a node for `"+l_s+"` ("+typeof(l_val)+")"),l_d);
			continue;
		}
		var l_v=variable_struct_get(api_api_var_map,l_s);
		if(l_v!=undefined){
			var l_flags=l_v.h_flags;
			if((l_flags&4)!=0)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env_fd,l_d,[gml_node.self_hx,l_d],l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env,l_d,l_v]);
			if(ds_list_size(l_st)>0){
				var l__g1=ds_list_find_value(l_st,0);
				switch(l__g1[0]){
					case gml_node.index:
						var l_d1=l__g1[1];
						var l_k=l__g1[3];
						if((l_flags&2)!=0)gml_std_haxe_enum_tools_setTo(ds_list_find_value(l_st,0),[gml_node.env1d,l_d1,l_v,l_k]); else return gml_program_seek_inst.h_error("`"+l_s+"` is not an array.",l_d1);
						break;
					case gml_node.index2d:return gml_program_seek_inst.h_error("`"+l_s+"` is not a 2d array.",l__g1[1]);
					default:if((l_flags&2)!=0)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env1d,l_d,l_v,[gml_node.number,l_d,0,undefined]]);
				}
			}
			continue;
		}
		var l_scr1=variable_struct_get(gml_program_seek_inst.h_script_map,l_s);
		if(l_scr1!=undefined){
			gml_std_haxe_enum_tools_setTo(l_q,[gml_node.script,l_d,l_scr1]);
			continue;
		}
		var l_fscr=variable_struct_get(gml_func_script_id,l_s);
		if(l_fscr!=undefined){
			gml_std_haxe_enum_tools_setTo(l_q,[gml_node.native_script,l_d,l_s,l_fscr]);
			continue;
		}
		var l_fn=variable_struct_get(gml_func_map,l_s);
		if(l_fn!=undefined){
			gml_std_haxe_enum_tools_setTo(l_q,[gml_node.native_script,l_d,l_s,l_fn.h_raw_func]);
			continue;
		}
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_locals_proc(l_q,l_st){
	// gml_seek_locals_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.var_decl:
			var l_s=l__g[2];
			if(!variable_struct_exists(gml_program_seek_script.h_local_map,l_s)){
				variable_struct_set(gml_program_seek_script.h_local_map,l_s,gml_program_seek_script.h_locals++);
				array_push(gml_program_seek_script.h_local_names,l_s);
			}
			break;
		case gml_node.try_catch:
			var l_s=l__g[3];
			if(!variable_struct_exists(gml_program_seek_script.h_local_map,l_s)){
				variable_struct_set(gml_program_seek_script.h_local_map,l_s,gml_program_seek_script.h_locals++);
				array_push(gml_program_seek_script.h_local_names,l_s);
			}
			break;
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_self_fields_proc(l_q,l_st){
	// gml_seek_self_fields_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l__g=l_q;
	if(l__g[0]==13){
		var l_d=l__g[1];
		gml_std_haxe_enum_tools_setTo(l_q,[gml_node.field,l_d,[gml_node.self_hx,l_d],l__g[2]]);
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_seek_set_op_resolve_set_op_rfn(l_q,l_st){
	// gml_seek_set_op_resolve_set_op_rfn(q:ast_GmlNode, st:tools_ArrayList<ast_GmlNode>)->bool
	/// @ignore
	var l__g=l_q;
	switch(l__g[0]){
		case gml_node.index_set:
			if(gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw,l__g[2])){
				gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case gml_node.index_aop:
			if(gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw,l__g[2])){
				gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case gml_node.index2d_set:
			if(gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw,l__g[2])){
				gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case gml_node.index2d_aop:
			if(gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw,l__g[2])){
				gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case gml_node.set_op:
			var l_x2=l__g[3];
			var l_v2=l__g[4];
			if(gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw,l_x2)){
				var l__g1=l_v2;
				gml_seek_set_op_resolve_set_op_safe=(l__g1[0]==6);
				return true;
			}
			break;
	}
	return gml_node_tools_seek_all(l_q,l_st,gml_seek_set_op_resolve_set_op_rfn,gml_program_seek_inst);
}

if(live_enabled)
function gml_seek_set_op_proc(l_q,l_st){
	// gml_seek_set_op_proc(q:ast_GmlNode, st:ast_GmlNodeList)->bool
	/// @ignore
	var l__g=l_q;
	if(l__g[0]==37){
		var l_d=l__g[1];
		var l_o=l__g[2];
		var l_x=l__g[3];
		var l_v=l__g[4];
		var l_xu=gml_node_tools_unpack(l_x);
		var l__g=l_xu;
		switch(l__g[0]){
			case gml_node.local_hx:
				var l_s=l__g[2];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.local_aop,l_d,l_s,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.local_set,l_d,l_s,l_v]);
				break;
			case gml_node.static_hx:
				var l_s=l__g[2];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.static_aop,l_d,l_s,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.static_set,l_d,l_s,l_v,false]);
				break;
			case gml_node.global_hx:
				var l_s=l__g[2];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.global_aop,l_d,l_s,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.global_set,l_d,l_s,l_v]);
				break;
			case gml_node.arg_const:break;
			case gml_node.arg_index:break;
			case gml_node.field:
				var l_x1=l__g[2];
				var l_s=l__g[3];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.field_aop,l_d,l_x1,l_s,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.field_set,l_d,l_x1,l_s,l_v]);
				break;
			case gml_node.alarm:
				var l_x1=l__g[2];
				var l_i=l__g[3];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.alarm_aop,l_d,l_x1,l_i,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.alarm_set_hx,l_d,l_x1,l_i,l_v]);
				break;
			case gml_node.index:
				var l_xd=l__g[1];
				var l_xw=l__g[2];
				var l__g1=l_x;
				switch(l__g1[0]){
					case gml_node.index:
						var l_xi=l__g1[3];
						if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index_aop,l_xd,l_xw,l_xi,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index_set,l_xd,l_xw,l_xi,l_v]);
						break;
					case gml_node.index2d:
						var l_i1=l__g1[3];
						var l_i2=l__g1[4];
						if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index2d_aop,l_xd,l_xw,l_i1,l_i2,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index2d_set,l_xd,l_xw,l_i1,l_i2,l_v]);
						break;
				}
				gml_seek_set_op_resolve_set_op_safe=false;
				gml_seek_set_op_resolve_set_op_xw=l_xw;
				gml_node_tools_seek_all_out(l_q,l_st,gml_seek_set_op_resolve_set_op_rfn,0,gml_program_seek_inst);
				var l_expr=l_xw;
				while(l_expr!=undefined){
					var l__g1=l_expr;
					switch(l__g1[0]){
						case gml_node.local_hx:
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_local,l__g1[1],l__g1[2]]);
							l_expr=undefined;
							break;
						case gml_node.global_hx:
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_global,l__g1[1],l__g1[2]]);
							l_expr=undefined;
							break;
						case gml_node.field:
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_field,l__g1[1],l__g1[2],l__g1[3]]);
							l_expr=undefined;
							break;
						case gml_node.index:
							var l_x2=l__g1[2];
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_index,l__g1[1],l_x2,l__g1[3]]);
							l_expr=l_x2;
							break;
						case gml_node.index2d:
							var l_x3=l__g1[2];
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_index2d,l__g1[1],l_x3,l__g1[3],l__g1[4]]);
							l_expr=l_x3;
							break;
						default:l_expr=undefined;
					}
				}
				break;
			case gml_node.index2d:
				var l_xd=l__g[1];
				var l_xw=l__g[2];
				var l__g1=l_x;
				switch(l__g1[0]){
					case gml_node.index:
						var l_xi=l__g1[3];
						if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index_aop,l_xd,l_xw,l_xi,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index_set,l_xd,l_xw,l_xi,l_v]);
						break;
					case gml_node.index2d:
						var l_i1=l__g1[3];
						var l_i2=l__g1[4];
						if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index2d_aop,l_xd,l_xw,l_i1,l_i2,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.index2d_set,l_xd,l_xw,l_i1,l_i2,l_v]);
						break;
				}
				gml_seek_set_op_resolve_set_op_safe=false;
				gml_seek_set_op_resolve_set_op_xw=l_xw;
				gml_node_tools_seek_all_out(l_q,l_st,gml_seek_set_op_resolve_set_op_rfn,0,gml_program_seek_inst);
				var l_expr=l_xw;
				while(l_expr!=undefined){
					var l__g1=l_expr;
					switch(l__g1[0]){
						case gml_node.local_hx:
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_local,l__g1[1],l__g1[2]]);
							l_expr=undefined;
							break;
						case gml_node.global_hx:
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_global,l__g1[1],l__g1[2]]);
							l_expr=undefined;
							break;
						case gml_node.field:
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_field,l__g1[1],l__g1[2],l__g1[3]]);
							l_expr=undefined;
							break;
						case gml_node.index:
							var l_x2=l__g1[2];
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_index,l__g1[1],l_x2,l__g1[3]]);
							l_expr=l_x2;
							break;
						case gml_node.index2d:
							var l_x3=l__g1[2];
							gml_std_haxe_enum_tools_setTo(l_expr,[gml_node.ensure_array_for_index2d,l__g1[1],l_x3,l__g1[3],l__g1[4]]);
							l_expr=l_x3;
							break;
						default:l_expr=undefined;
					}
				}
				break;
			case gml_node.env:
				var l_av=l__g[2];
				var l_f=l_av.h_flags;
				if((l_f&1)==0){
					if((l_f&2)!=0){
						var l_k=[gml_node.number,l_d,0,undefined];
						if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env1d_aop,l_d,l_av,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env1d_set,l_d,l_av,l_k,l_v]);
					} else if(l_o!=-1){
						gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env_aop,l_d,l_av,l_o,l_v]);
					} else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env_set,l_d,l_av,l_v]);
				} else return gml_program_seek_inst.h_error("`"+l_av.h_name+"` is read-only",l__g[1]);
				break;
			case gml_node.script_static:if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.script_static_aop,l_d,l__g[2],l__g[3],l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.script_static_set,l_d,l__g[2],l__g[3],l_v]);break;
			case gml_node.env_fd:
				var l_av=l__g[3];
				if((l_av.h_flags&1)==0){
					if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env_fd_aop,l_d,l__g[2],l_av,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env_fd_set,l_d,l__g[2],l_av,l_v]);
				} else return gml_program_seek_inst.h_error("`"+l_av.h_name+"` is read-only",l__g[1]);
				break;
			case gml_node.env1d:
				var l_av=l__g[2];
				if((l_av.h_flags&1)==0){
					if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env1d_aop,l_d,l_av,l__g[3],l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.env1d_set,l_d,l_av,l__g[3],l_v]);
				} else return gml_program_seek_inst.h_error("`"+l_av.h_name+"` is read-only",l__g[1]);
				break;
			case gml_node.ds_list:
				var l_x1=l__g[2];
				var l_k=l__g[3];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_list_aop,l_d,l_x1,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_list_set_hx,l_d,l_x1,l_k,l_v]);
				break;
			case gml_node.ds_map:
				var l_x1=l__g[2];
				var l_k=l__g[3];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_map_aop,l_d,l_x1,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_map_set_hx,l_d,l_x1,l_k,l_v]);
				break;
			case gml_node.ds_grid:
				var l_x1=l__g[2];
				var l_i=l__g[3];
				var l_k=l__g[4];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_grid_aop,l_d,l_x1,l_i,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.ds_grid_set_hx,l_d,l_x1,l_i,l_k,l_v]);
				break;
			case gml_node.raw_id:
				var l_x1=l__g[2];
				var l_k=l__g[3];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.raw_id_aop,l_d,l_x1,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.raw_id_set,l_d,l_x1,l_k,l_v]);
				break;
			case gml_node.raw_id2d:
				var l_x1=l__g[2];
				var l_i=l__g[3];
				var l_k=l__g[4];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.raw_id2d_aop,l_d,l_x1,l_i,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.raw_id2d_set,l_d,l_x1,l_i,l_k,l_v]);
				break;
			case gml_node.key_id:
				var l_x1=l__g[2];
				var l_k=l__g[3];
				if(l_o!=-1)gml_std_haxe_enum_tools_setTo(l_q,[gml_node.key_id_aop,l_d,l_x1,l_k,l_o,l_v]); else gml_std_haxe_enum_tools_setTo(l_q,[gml_node.key_id_set,l_d,l_x1,l_k,l_v]);
				break;
			default:return gml_program_seek_inst.h_error(("Expression ("+g_gml_node_constructors[l_xu[0]]+") is not settable"),gml_std_haxe_enum_tools_getParameter(l_x,0));
		}
	}
	return gml_node_tools_seek(l_q,l_st,gml_program_seek_func);
}

if(live_enabled)
function gml_std_gml_internal_ArrayImpl_shift(l_arr){
	// gml_std_gml_internal_ArrayImpl_shift(arr:array<T>)->T?
	/// @ignore
	if(array_length(l_arr)==0)return undefined;
	var l_result=l_arr[0];
	array_delete(l_arr,0,1);
	return l_result;
}

if(live_enabled)
function gml_std_gml_internal_ArrayImpl_splice(l_arr,l_pos,l_len){
	// gml_std_gml_internal_ArrayImpl_splice(arr:array<T>, pos:int, len:int)->array<T>
	/// @ignore
	if(l_pos<0){
		l_pos+=array_length(l_arr);
		if(l_pos<0)l_pos=0;
	}
	var l_n=array_length(l_arr);
	if(l_pos+l_len>l_n)l_len=l_n-l_pos;
	if(l_len<=0)return [];
	var l_r=array_create(l_len);
	array_copy(l_r,0,l_arr,l_pos,l_len);
	array_delete(l_arr,l_pos,l_len);
	return l_r;
}

if(live_enabled)
function gml_std_gml_internal_ArrayImpl_indexOf(l_arr,l_v,l_i){
	// gml_std_gml_internal_ArrayImpl_indexOf(arr:array<T>, v:T, i:int = 0)->int
	/// @ignore
	if(l_i==undefined)l_i=0;
	if(false)show_debug_message(argument[2]);
	var l_len=array_length(l_arr);
	if(l_i<0){
		l_i+=l_len;
		if(l_i<0)l_i=0;
	}
	while(l_i<l_len){
		if(l_arr[l_i]==l_v)return l_i;
		l_i++;
	}
	return -1;
}

if(live_enabled)
function gml_std_gml_internal_ArrayImpl_concatFront(l_arr,l_item){
	// gml_std_gml_internal_ArrayImpl_concatFront(arr:array<T>, item:T)->array<T>
	/// @ignore
	if(!is_array(l_arr))return [l_item];
	var l_n=array_length(l_arr);
	var l_res=array_create(1+l_n);
	l_res[@0]=l_item;
	array_copy(l_res,1,l_arr,0,l_n);
	return l_res;
}

if(live_enabled)
function gml_std_gml_internal_ArrayImpl_join(l_arr,l_sep){
	// gml_std_gml_internal_ArrayImpl_join(arr:array<T>, sep:string)->string
	/// @ignore
	var l_len=array_length(l_arr);
	if(l_len==0)return "";
	var l_buf=gml_std_gml_internal_ArrayImpl_join_buf;
	if(l_buf==undefined){
		l_buf=buffer_create(1024,buffer_grow,1);
		gml_std_gml_internal_ArrayImpl_join_buf=l_buf;
	}
	buffer_seek(l_buf,buffer_seek_start,0);
	buffer_write(l_buf,buffer_text,gml_std_Std_stringify(l_arr[0]));
	for(var l_i=1;l_i<l_len;l_i++){
		buffer_write(l_buf,buffer_text,l_sep);
		buffer_write(l_buf,buffer_text,gml_std_Std_stringify(l_arr[l_i]));
	}
	buffer_write(l_buf,buffer_u8,0);
	buffer_seek(l_buf,buffer_seek_start,0);
	return buffer_read(l_buf,buffer_string);
}

if(live_enabled)
function gml_std_gml_internal_ArrayImpl_copy(l_arr){
	// gml_std_gml_internal_ArrayImpl_copy(arr:array<T>)->array<T>
	/// @ignore
	var l_out;
	var l_len=array_length(l_arr);
	if(l_len>0){
		l_out=array_create(l_len);
		array_copy(l_out,0,l_arr,0,l_len);
	} else l_out=[];
	return l_out;
}

if(live_enabled)
function haxe__dynamic_access_dynamic_access_impl__copy(l_this1){
	// haxe__dynamic_access_dynamic_access_impl__copy(this:any)->haxe_DynamicAccess<T>
	/// @ignore
	var l_fields=variable_struct_get_names(l_this1);
	var l_r={}
	for(var l_i=0,l__g1=array_length(l_fields);l_i<l__g1;l_i++){
		var l_fd=l_fields[l_i];
		variable_struct_set(l_r,l_fd,variable_struct_get(l_this1,l_fd));
	}
	return l_r;
}

if(live_enabled)
function gml_std_haxe_Exception_new(l_message,l_previous,l_native){
	// gml_std_haxe_Exception_new(message:string, ?previous:gml_std_haxe_Exception, ?native:any)
	/// @ignore
	if(false)show_debug_message(argument[2]);
	self.h_message=l_message;
	self.h_previous=l_previous;
	if(l_native==undefined){
		var l_natEx=undefined;
		try { show_error(l_message, true); } catch(_e) { l_natEx = _e; };
		array_delete(l_natEx.stacktrace,0,1);
		l_natEx.hxException=self;
		l_native=l_natEx;
	}
	self.h_native=l_native;
}

if(live_enabled)
function gml_std_haxe_Exception(l_message,l_previous,l_native)constructor{
	// gml_std_haxe_Exception(message:string, ?previous:gml_std_haxe_Exception, ?native:any)
	/// @ignore
	static h_message=undefined; /// @is {string}
	static h_previous=undefined; /// @is {gml_std_haxe_Exception?}
	static h_native=undefined; /// @is {any}
	static h_unwrap=method(undefined,gml_std_haxe_Exception_h_unwrap);
	static h_toString=method(undefined,gml_std_haxe_Exception_h_toString);
	switch(argument_count){
		case 1:method(self, gml_std_haxe_Exception_new)(argument[0]);break;
		case 2:method(self, gml_std_haxe_Exception_new)(argument[0],argument[1]);break;
		case 3:method(self, gml_std_haxe_Exception_new)(argument[0],argument[1],argument[2]);break;
		default:show_error("Expected 1..3 arguments.",true);
	}
	static __class__=mt_gml_std_haxe_Exception;
}

if(live_enabled)
function gml_std_haxe_Exception_caught(l_value){
	// gml_std_haxe_Exception_caught(value:any)->any
	/// @ignore
	if(is_struct(l_value)){
		if(variable_struct_exists(l_value,"stack"))return l_value;
		var l_hxEx=variable_struct_get(l_value,"hxException");
		if(l_hxEx!=undefined)return l_hxEx;
		if(variable_struct_exists(l_value,"stacktrace")){
			l_hxEx=new gml_std_haxe_Exception(l_value.message,undefined,l_value);
			l_value.hxException=l_hxEx;
			return l_hxEx;
		}
	}
	return new gml_std_haxe_Exception(string(l_value));
}

if(live_enabled)
function gml_std_haxe_Exception_thrown(l_value){
	// gml_std_haxe_Exception_thrown(value:any)->any
	/// @ignore
	if(is_struct(l_value)){
		if(variable_struct_exists(l_value,"stack"))return l_value.h_native;
		if(variable_struct_exists(l_value,"stacktrace"))return l_value;
	}
	var l_message=(is_string(l_value)?l_value:string(l_value));
	var l_natEx=undefined;
	try { show_error(l_message, true); } catch(_e) { l_natEx = _e; };
	return l_natEx;
}

if(live_enabled)
function gml_std_haxe_Exception_h_unwrap(){
	// gml_std_haxe_Exception_h_unwrap()->any
	/// @ignore
	return self.h_native;
}

if(live_enabled)
function gml_std_haxe_Exception_h_toString(){
	// gml_std_haxe_Exception_h_toString()->string
	/// @ignore
	return self.h_message;
}

if(live_enabled)
function haxe_ds_basic_map_new(){
	// haxe_ds_basic_map_new()
	/// @ignore
	self.h_obj={}
}

if(live_enabled)
function haxe_ds_basic_map()constructor{
	// haxe_ds_basic_map()
	/// @ignore
	static h_obj=undefined; /// @is {haxe_DynamicAccess<V>}
	method(self, haxe_ds_basic_map_new)();
	static __class__=mt_haxe_ds_basic_map;
}

if(live_enabled)
function haxe_ds_string_map()constructor{
	// haxe_ds_string_map()
	/// @ignore
	static h_obj=undefined; /// @is {haxe_DynamicAccess<V>}
	method(self, haxe_ds_basic_map_new)();
	static __class__=mt_haxe_ds_string_map;
}

if(live_enabled)
function live_set_live_impl(l_thing,l_val,l_map,l_start,l_stop){
	// live_set_live_impl(thing:T, val:V, map:ds_map<T; V>, start:ds_list<T>, stop:ds_list<T>)
	/// @ignore
	var l_i;
	if(l_val!=undefined){
		var l_cur=ds_map_find_value(l_map,l_thing);
		if(l_cur==undefined){
			ds_map_set(l_map,l_thing,l_val);
			l_i=ds_list_find_index(l_stop,l_thing);
			if(l_i>=0)ds_list_delete(l_stop,l_i);
			ds_list_add(l_start,l_thing);
		} else if(l_cur!=l_val){
			ds_map_set(l_map,l_thing,l_val);
			l_i=ds_list_find_index(l_stop,l_thing);
			if(l_i<0)ds_list_add(l_stop,l_thing);
			l_i=ds_list_find_index(l_start,l_thing);
			if(l_i<0)ds_list_add(l_start,l_thing);
		}
	} else {
		if(!ds_map_exists(l_map,l_thing))exit;
		l_i=ds_list_find_index(l_start,l_thing);
		if(l_i>=0)ds_list_delete(l_start,l_i);
		ds_list_add(l_stop,l_thing);
	}
}

if(live_enabled)
function live_set_live_simple(l_thing,l_val,l_map,l_start,l_stop){
	// live_set_live_simple(thing:T, val:bool, map:ds_map<T; bool>, start:ds_list<T>, stop:ds_list<T>)
	/// @ignore
	var l_val1=(l_val?true:undefined);
	var l_i;
	if(l_val1!=undefined){
		var l_cur=ds_map_find_value(l_map,l_thing);
		if(l_cur==undefined){
			ds_map_set(l_map,l_thing,l_val1);
			l_i=ds_list_find_index(l_stop,l_thing);
			if(l_i>=0)ds_list_delete(l_stop,l_i);
			ds_list_add(l_start,l_thing);
		} else if(l_cur!=l_val1){
			ds_map_set(l_map,l_thing,l_val1);
			l_i=ds_list_find_index(l_stop,l_thing);
			if(l_i<0)ds_list_add(l_stop,l_thing);
			l_i=ds_list_find_index(l_start,l_thing);
			if(l_i<0)ds_list_add(l_start,l_thing);
		}
	} else if(ds_map_exists(l_map,l_thing)){
		l_i=ds_list_find_index(l_start,l_thing);
		if(l_i>=0)ds_list_delete(l_start,l_i);
		ds_list_add(l_stop,l_thing);
	}
}

function sprite_set_live(l_spr,l_live1){
	/// sprite_set_live(spr:sprite, live:bool)
	/// @param {sprite} spr
	/// @param {bool} live
	/// @returns {void}
	if(live_enabled){
		var l_map=live_live_sprites;
		var l_start=live_live_sprites_start;
		var l_stop=live_live_sprites_stop;
		var l_val=(l_live1?true:undefined);
		var l_i;
		if(l_val!=undefined){
			var l_cur=ds_map_find_value(l_map,l_spr);
			if(l_cur==undefined){
				ds_map_set(l_map,l_spr,l_val);
				l_i=ds_list_find_index(l_stop,l_spr);
				if(l_i>=0)ds_list_delete(l_stop,l_i);
				ds_list_add(l_start,l_spr);
			} else if(l_cur!=l_val){
				ds_map_set(l_map,l_spr,l_val);
				l_i=ds_list_find_index(l_stop,l_spr);
				if(l_i<0)ds_list_add(l_stop,l_spr);
				l_i=ds_list_find_index(l_start,l_spr);
				if(l_i<0)ds_list_add(l_start,l_spr);
			}
		} else if(ds_map_exists(l_map,l_spr)){
			l_i=ds_list_find_index(l_start,l_spr);
			if(l_i>=0)ds_list_delete(l_start,l_i);
			ds_list_add(l_stop,l_spr);
		}
	}
}

function path_set_live(l_pt,l_live1){
	/// path_set_live(pt:path, live:bool)
	/// @param {path} pt
	/// @param {bool} live
	/// @returns {void}
	if(live_enabled){
		var l_map=live_live_point_paths;
		var l_start=live_live_point_paths_start;
		var l_stop=live_live_point_paths_stop;
		var l_val=(l_live1?true:undefined);
		var l_i;
		if(l_val!=undefined){
			var l_cur=ds_map_find_value(l_map,l_pt);
			if(l_cur==undefined){
				ds_map_set(l_map,l_pt,l_val);
				l_i=ds_list_find_index(l_stop,l_pt);
				if(l_i>=0)ds_list_delete(l_stop,l_i);
				ds_list_add(l_start,l_pt);
			} else if(l_cur!=l_val){
				ds_map_set(l_map,l_pt,l_val);
				l_i=ds_list_find_index(l_stop,l_pt);
				if(l_i<0)ds_list_add(l_stop,l_pt);
				l_i=ds_list_find_index(l_start,l_pt);
				if(l_i<0)ds_list_add(l_start,l_pt);
			}
		} else if(ds_map_exists(l_map,l_pt)){
			l_i=ds_list_find_index(l_start,l_pt);
			if(l_i>=0)ds_list_delete(l_start,l_i);
			ds_list_add(l_stop,l_pt);
		}
	}
}

function animcurve_set_live(l_curve_id,l_live1,l_bezierIterations){
	/// animcurve_set_live(curve_id:animcurve, live:bool, bezierIterations:int = 16)
	/// @param {animcurve} curve_id
	/// @param {bool} live
	/// @param {int} [bezierIterations=16]
	/// @returns {void}
	if(l_bezierIterations==undefined)l_bezierIterations=16;
	if(false)show_debug_message(argument[2]);
	if(live_enabled){
		var l_val=(l_live1?l_bezierIterations:undefined);
		var l_map=live_live_anim_curves;
		var l_start=live_live_anim_curves_start;
		var l_stop=live_live_anim_curves_stop;
		var l_i;
		if(l_val!=undefined){
			var l_cur=ds_map_find_value(l_map,l_curve_id);
			if(l_cur==undefined){
				ds_map_set(l_map,l_curve_id,l_val);
				l_i=ds_list_find_index(l_stop,l_curve_id);
				if(l_i>=0)ds_list_delete(l_stop,l_i);
				ds_list_add(l_start,l_curve_id);
			} else if(l_cur!=l_val){
				ds_map_set(l_map,l_curve_id,l_val);
				l_i=ds_list_find_index(l_stop,l_curve_id);
				if(l_i<0)ds_list_add(l_stop,l_curve_id);
				l_i=ds_list_find_index(l_start,l_curve_id);
				if(l_i<0)ds_list_add(l_start,l_curve_id);
			}
		} else if(ds_map_exists(l_map,l_curve_id)){
			l_i=ds_list_find_index(l_start,l_curve_id);
			if(l_i>=0)ds_list_delete(l_start,l_i);
			ds_list_add(l_stop,l_curve_id);
		}
	}
}

function file_set_live(l_path1,l_callback,l_kind){
	/// file_set_live(path:string, ?callback:function<any;string;void>, ?kind:string)
	/// @param {string} path
	/// @param {function<any;string;void>} ?callback
	/// @param {string} ?kind
	/// @returns {void}
	if(false)show_debug_message(argument[2]);
	if(live_enabled){
		var l_i;
		if(l_callback!=undefined){
			if(ds_map_exists(live_live_included_files,l_path1))exit;
			var l_k;
			if(l_kind==undefined){
				switch(string_lower(filename_ext(l_path1))){
					case ".csv":l_k=4;break;
					case ".json":l_k=2;break;
					case ".txt":l_k=1;break;
					case ".bin":l_k=0;break;
					case ".b64":case ".base64":l_k=3;break;
					default:
						show_error("Cannot auto-detect kind for \""+l_path1+"\"",false);
						exit;
				}
			} else switch(l_kind){
				case "text":l_k=1;break;
				case "json":l_k=2;break;
				case "csv":l_k=4;break;
				case "base64":l_k=3;break;
				case "buffer":l_k=0;break;
				case "auto":
					switch(string_lower(filename_ext(l_path1))){
						case ".csv":l_k=4;break;
						case ".json":l_k=2;break;
						case ".txt":l_k=1;break;
						case ".bin":l_k=0;break;
						case ".b64":case ".base64":l_k=3;break;
						default:
							show_error("Cannot auto-detect kind for \""+l_path1+"\"",false);
							exit;
					}
					break;
				default:
					show_error("Unrecognized kind \""+gml_std_Std_stringify(l_kind)+"\"",false);
					exit;
			}
			ds_map_set(live_live_included_files,l_path1,{func:l_callback,kind:l_k});
			l_i=ds_list_find_index(live_live_included_files_stop,l_path1);
			if(l_i>=0)ds_list_delete(live_live_included_files_stop,l_i);
			ds_list_add(live_live_included_files_start,l_path1);
		} else {
			if(!ds_map_exists(live_live_included_files,l_path1))exit;
			if(l_kind!=undefined){
				show_error("Kind should not be specified without a callback",false);
				exit;
			}
			ds_map_delete(live_live_included_files,l_path1);
			l_i=ds_list_find_index(live_live_included_files_start,l_path1);
			if(l_i>=0)ds_list_delete(live_live_included_files_start,l_i);
			ds_list_add(live_live_included_files_stop,l_path1);
		}
	}
}

function room_set_live(l_rm,l_enable){
	/// room_set_live(rm:room, enable:bool)
	/// @param {room} rm
	/// @param {bool} enable
	/// @returns {void}
	if(live_enabled){
		var l_i;
		if(l_enable){
			if(ds_map_exists(live_live_rooms,l_rm))exit;
			ds_map_set(live_live_rooms,l_rm,true);
			l_i=ds_list_find_index(live_live_rooms_stop,l_rm);
			if(l_i>=0)ds_list_delete(live_live_rooms_stop,l_i);
			ds_list_add(live_live_rooms_start,l_rm);
		} else {
			if(!ds_map_exists(live_live_rooms,l_rm))exit;
			ds_map_delete(live_live_rooms,l_rm);
			ds_map_delete(live_live_room_data,l_rm);
			l_i=ds_list_find_index(live_live_rooms_start,l_rm);
			if(l_i>=0)ds_list_delete(live_live_rooms_start,l_i);
			ds_list_add(live_live_rooms_stop,l_rm);
		}
	}
}

function room_goto_live(l_rm){
	/// room_goto_live(rm:room)
	/// @param {room} rm
	/// @returns {void}
	if(live_enabled){
		if(ds_map_exists(live_live_rooms,l_rm)&&ds_map_exists(live_live_room_data,l_rm)){
			live_live_room=l_rm;
			if(!room_exists(live_blank_room))show_error("Please add a completely empty room, add live_room_start(); to it's Creation Code, and assign it to live_blank_room in obj_gmlive's create event.",true);
			room_goto(live_blank_room);
			exit;
		}
		room_goto(l_rm);
	}else room_goto(l_rm);
}

if(live_enabled)
function live_get_update_tail(){
	// live_get_update_tail()->string
	/// @ignore
	var l_url="";
	var l_sl=live_live_sprites_stop;
	var l_sln=ds_list_size(l_sl);
	if(l_sln>0){
		l_url+="&sprites"+string(0)+"="+sprite_get_name(ds_list_find_value(l_sl,0));
		for(var l_i=1;l_i<l_sln;l_i++){
			l_url+="+"+sprite_get_name(ds_list_find_value(l_sl,l_i));
		}
		ds_list_clear(l_sl);
	}
	var l_sl=live_live_sprites_start;
	var l_sln=ds_list_size(l_sl);
	if(l_sln>0){
		l_url+="&sprites"+string(1)+"="+sprite_get_name(ds_list_find_value(l_sl,0));
		for(var l_i=1;l_i<l_sln;l_i++){
			l_url+="+"+sprite_get_name(ds_list_find_value(l_sl,l_i));
		}
		ds_list_clear(l_sl);
	}
	var l_sl=live_shader_live_shaders_stop;
	var l_sln=ds_list_size(l_sl);
	if(l_sln>0){
		l_url+="&shaders"+string(0)+"="+shader_get_name(ds_list_find_value(l_sl,0));
		for(var l_i=1;l_i<l_sln;l_i++){
			l_url+="+"+shader_get_name(ds_list_find_value(l_sl,l_i));
		}
		ds_list_clear(l_sl);
	}
	var l_sl=live_shader_live_shaders_start;
	var l_sln=ds_list_size(l_sl);
	if(l_sln>0){
		l_url+="&shaders"+string(1)+"="+shader_get_name(ds_list_find_value(l_sl,0));
		for(var l_i=1;l_i<l_sln;l_i++){
			l_url+="+"+shader_get_name(ds_list_find_value(l_sl,l_i));
		}
		ds_list_clear(l_sl);
	}
	var l_rl=live_live_rooms_stop;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&rooms"+string(0)+"="+room_get_name(ds_list_find_value(l_rl,0));
		for(var l_i=1;l_i<l_rln;l_i++){
			l_url+="+"+room_get_name(ds_list_find_value(l_rl,l_i));
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_rooms_start;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&rooms"+string(1)+"="+room_get_name(ds_list_find_value(l_rl,0));
		for(var l_i=1;l_i<l_rln;l_i++){
			l_url+="+"+room_get_name(ds_list_find_value(l_rl,l_i));
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_point_paths_stop;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&paths"+string(0)+"="+path_get_name(ds_list_find_value(l_rl,0));
		for(var l_i=1;l_i<l_rln;l_i++){
			l_url+="+"+path_get_name(ds_list_find_value(l_rl,l_i));
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_point_paths_start;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&paths"+string(1)+"="+path_get_name(ds_list_find_value(l_rl,0));
		for(var l_i=1;l_i<l_rln;l_i++){
			l_url+="+"+path_get_name(ds_list_find_value(l_rl,l_i));
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_anim_curves_stop;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&animCurves"+string(0)+"=";
		for(var l_i=0;l_i<l_rln;l_i++){
			var l_ac=ds_list_find_value(l_rl,l_i);
			if(l_i>0)l_url+="+"+animcurve_get(l_ac).name; else l_url+=animcurve_get(l_ac).name;
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_anim_curves_start;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&animCurves"+string(1)+"=";
		for(var l_i=0;l_i<l_rln;l_i++){
			var l_ac=ds_list_find_value(l_rl,l_i);
			if(l_i>0)l_url+="+"+animcurve_get(l_ac).name; else l_url+=animcurve_get(l_ac).name;
			l_url+="-"+gml_std_Std_stringify(ds_map_find_value(live_live_anim_curves,l_ac));
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_included_files_stop;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&incFiles"+string(0)+"="+ds_list_find_value(l_rl,0);
		for(var l_i=1;l_i<l_rln;l_i++){
			l_url+="+"+ds_list_find_value(l_rl,l_i);
		}
		ds_list_clear(l_rl);
	}
	var l_rl=live_live_included_files_start;
	var l_rln=ds_list_size(l_rl);
	if(l_rln>0){
		l_url+="&incFiles"+string(1)+"="+ds_list_find_value(l_rl,0);
		for(var l_i=1;l_i<l_rln;l_i++){
			l_url+="+"+ds_list_find_value(l_rl,l_i);
		}
		ds_list_clear(l_rl);
	}
	return l_url;
}

if(live_enabled)
function live_default_update(l_thing){
	// live_default_update(thing:any)
	/// @ignore
	
}

if(live_enabled)
function live_room_updated_impl(l_rm){
	// live_room_updated_impl(rm:room)
	/// @ignore
	room_goto_live(l_rm);
}

if(live_enabled)
function live_proc_call_origin(l_origin){
	// live_proc_call_origin(origin:string)->live_cache_data
	/// @ignore
	var l_data=undefined;
	var l_co=gml_std_string_pos_ext_haxe(l_origin,":");
	if(l_co>=0){
		var l_oclip=gml_std_string_substr(l_origin,0,l_co);
		l_data=variable_struct_get(live_live_map,l_oclip);
		if(l_data==undefined&&gml_std_string_substr(l_oclip,0,11)=="gml_Script_"){
			l_oclip=gml_std_string_substring(l_oclip,11);
			l_data=variable_struct_get(live_live_map,l_oclip);
		}
		if(l_data!=undefined)variable_struct_set(live_live_map,l_origin,l_data);
	} else if(gml_std_string_substr(l_origin,0,11)=="gml_Script_"){
		l_data=variable_struct_get(live_live_map,gml_std_string_substring(l_origin,11));
		if(l_data!=undefined)variable_struct_set(live_live_map,l_origin,l_data);
	}
	return l_data;
}

if(live_enabled)
function live_proc_call_impl(l_data,l_args1,l_def){
	// live_proc_call_impl(data:live_cache_data, args:array<any>, def:any)->bool
	/// @ignore
	var l_pg=l_data[0];
	if(l_pg==undefined)return false;
	live_custom_self=self;
	live_custom_other=other;
	var l_scriptName=l_pg.h_tag;
	var l_th=l_pg.h_call_v(l_scriptName,l_args1,false);
	if(l_th==undefined){
		live_result=l_def;
		live_log_script("`"+(l_scriptName==undefined?"null":gml_std_Std_stringify(l_scriptName))+"` is missing from the live program for some reason (?)",2);
		return false;
	} else if(l_th.h_status==3){
		live_result=l_th.h_result;
		return true;
	} else if(l_th.h_status==4){
		live_result=l_def;
		live_log_script(("Runtime error: "+l_th.h_get_error()),2);
		return true;
	} else return false;
}

function live_call(){
	/// live_call(...args:any)->bool
	/// @param {any} ...args
	/// @returns {bool}
	if(false)show_debug_message(argument[argument_count-1]);
	if(live_enabled){
		var l_def=undefined;
		var l_origin;
		if(live_request_guid==undefined){
			live_name=undefined;
			l_origin=undefined;
		} else {
			var l_now=current_time/1000*1000;
			if(l_now>live_last_update_at+5000&&l_now>live_last_warn_at+5000){
				var l_stack=debug_get_callstack(2);
				live_last_warn_at=l_now;
				live_log_script("Calling live_call from "+l_stack[1]+", but live_update was last called "+string(ceil((l_now-live_last_update_at)/1000))+" seconds ago. Did you deactivate/delete GMLive's object?",1);
			}
			var l_origin1;
			if(live_name!=undefined){
				l_origin1=live_name;
				live_name=undefined;
			} else {
				var l_stack=debug_get_callstack(2);
				l_origin1=l_stack[1];
			}
			l_origin=l_origin1;
		}
		if(l_origin==undefined){
			return false;
		} else {
			var l_data=variable_struct_get(live_live_map,l_origin);
			if(l_data==undefined)l_data=live_proc_call_origin(l_origin);
			if(l_data==undefined){
				return false;
			} else {
				var l_argc=argument_count;
				var l_vals=array_create(l_argc);
				while(--l_argc>=0){
					l_vals[@l_argc]=argument[l_argc];
				}
				return live_proc_call_impl(l_data,l_vals,l_def);
			}
		}
	}else return false;
}

function live_defcall(){
	/// live_defcall(...args:any)->bool
	/// @param {any} ...args
	/// @returns {bool}
	if(false)show_debug_message(argument[argument_count-1]);
	if(live_enabled){
		var l_argc=argument_count-1;
		var l_def=argument[l_argc];
		var l_origin;
		if(live_request_guid==undefined){
			live_name=undefined;
			l_origin=undefined;
		} else {
			var l_now=current_time/1000*1000;
			if(l_now>live_last_update_at+5000&&l_now>live_last_warn_at+5000){
				var l_stack=debug_get_callstack(2);
				live_last_warn_at=l_now;
				live_log_script("Calling live_defcall from "+l_stack[1]+", but live_update was last called "+string(ceil((l_now-live_last_update_at)/1000))+" seconds ago. Did you deactivate/delete GMLive's object?",1);
			}
			var l_origin1;
			if(live_name!=undefined){
				l_origin1=live_name;
				live_name=undefined;
			} else {
				var l_stack=debug_get_callstack(2);
				l_origin1=l_stack[1];
			}
			l_origin=l_origin1;
		}
		if(l_origin==undefined){
			return false;
		} else {
			var l_data=variable_struct_get(live_live_map,l_origin);
			if(l_data==undefined)l_data=live_proc_call_origin(l_origin);
			if(l_data==undefined){
				return false;
			} else {
				var l_vals=array_create(l_argc);
				while(--l_argc>=0){
					l_vals[@l_argc]=argument[l_argc];
				}
				return live_proc_call_impl(l_data,l_vals,l_def);
			}
		}
	}else return false;
}

function live_call_ext(l_args1){
	/// live_call_ext(args:array<any>)->bool
	/// @param {array<any>} args
	/// @returns {bool}
	if(live_enabled){
		var l_origin;
		if(live_request_guid==undefined){
			live_name=undefined;
			l_origin=undefined;
		} else {
			var l_now=current_time/1000*1000;
			if(l_now>live_last_update_at+5000&&l_now>live_last_warn_at+5000){
				var l_stack=debug_get_callstack(2);
				live_last_warn_at=l_now;
				live_log_script("Calling live_call_ext from "+l_stack[1]+", but live_update was last called "+string(ceil((l_now-live_last_update_at)/1000))+" seconds ago. Did you deactivate/delete GMLive's object?",1);
			}
			var l_origin1;
			if(live_name!=undefined){
				l_origin1=live_name;
				live_name=undefined;
			} else {
				var l_stack=debug_get_callstack(2);
				l_origin1=l_stack[1];
			}
			l_origin=l_origin1;
		}
		if(l_origin==undefined){
			return false;
		} else {
			var l_data=variable_struct_get(live_live_map,l_origin);
			if(l_data==undefined)l_data=live_proc_call_origin(l_origin);
			if(l_data==undefined)return false; else return live_proc_call_impl(l_data,gml_value_list_copy(l_args1),undefined);
		}
	}else return false;
}

function live_defcall_ext(l_args1,l_def){
	/// live_defcall_ext(args:array<any>, def:any)->bool
	/// @param {array<any>} args
	/// @param {any} def
	/// @returns {bool}
	if(live_enabled){
		var l_origin;
		if(live_request_guid==undefined){
			live_name=undefined;
			l_origin=undefined;
		} else {
			var l_now=current_time/1000*1000;
			if(l_now>live_last_update_at+5000&&l_now>live_last_warn_at+5000){
				var l_stack=debug_get_callstack(2);
				live_last_warn_at=l_now;
				live_log_script("Calling live_defcall_ext from "+l_stack[1]+", but live_update was last called "+string(ceil((l_now-live_last_update_at)/1000))+" seconds ago. Did you deactivate/delete GMLive's object?",1);
			}
			var l_origin1;
			if(live_name!=undefined){
				l_origin1=live_name;
				live_name=undefined;
			} else {
				var l_stack=debug_get_callstack(2);
				l_origin1=l_stack[1];
			}
			l_origin=l_origin1;
		}
		if(l_origin==undefined){
			return false;
		} else {
			var l_data=variable_struct_get(live_live_map,l_origin);
			if(l_data==undefined)l_data=live_proc_call_origin(l_origin);
			if(l_data==undefined)return false; else return live_proc_call_impl(l_data,gml_value_list_copy(l_args1),l_def);
		}
	}else return false;
}

function live_auto_call_1(){
	/// live_auto_call_1()->bool
	/// @returns {bool}
	if(live_enabled){
		//#macro live_auto_call if (live_auto_call_1()) { var lac_argc = argument_count, lac_args = array_create(lac_argc), lac_argk = 0; repeat (lac_argc) { lac_args[lac_argk] = argument[lac_argk]; lac_argk++; } if (live_auto_call_2(lac_args)) return live_result; };
		var l_origin;
		if(live_request_guid==undefined){
			live_name=undefined;
			l_origin=undefined;
		} else {
			var l_now=current_time/1000*1000;
			if(l_now>live_last_update_at+5000&&l_now>live_last_warn_at+5000){
				var l_stack=debug_get_callstack(2);
				live_last_warn_at=l_now;
				live_log_script("Calling live_auto_call from "+l_stack[1]+", but live_update was last called "+string(ceil((l_now-live_last_update_at)/1000))+" seconds ago. Did you deactivate/delete GMLive's object?",1);
			}
			var l_origin1;
			if(live_name!=undefined){
				l_origin1=live_name;
				live_name=undefined;
			} else {
				var l_stack=debug_get_callstack(2);
				l_origin1=l_stack[1];
			}
			l_origin=l_origin1;
		}
		if(l_origin==undefined)return false;
		var l_data=variable_struct_get(live_live_map,l_origin);
		if(l_data==undefined)l_data=live_proc_call_origin(l_origin);
		if(l_data==undefined)return false;
		live_auto_call_data=l_data;
		return true;
	}else return false;
}

function live_auto_call_2(l_args1){
	/// live_auto_call_2(args:array<any>)->bool
	/// @param {array<any>} args
	/// @returns {bool}
	if(live_enabled){
		return live_proc_call_impl(live_auto_call_data,l_args1,undefined);
	}else return false;
}

if(live_enabled)
function live_async_http_0(l_map){
	// live_async_http_0(map:live_GMLiveAsyncMap<any>)
	/// @ignore
	var l_i,l_n,l_s,l_list,l_names,l_srcMap;
	live_is_ready=true;
	live_request_guid=ds_map_find_value(l_map,"guid");
	if(ds_map_find_value(l_map,"version")==undefined||ds_map_find_value(l_map,"version")<106)show_error("Outdated GMLive server detected! Please update the included files from the extension.",true);
	l_list=ds_map_find_value(l_map,"shaders");
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i++){
		l_s=ds_list_find_value(l_list,l_i);
		gml_asset_add(l_s,asset_get_index(l_s));
	}
	for(var l__=0;l__<1;l__++){
		l_list=ds_map_find_value(l_map,"animCurves");
		if(l_list==undefined){
			live_log_script("Server init response is missing an animCurves list. You may need to update the server.",1);
			continue;
		}
		l_n=ds_list_size(l_list);
		for(l_i=0;l_i<l_n;l_i++){
			l_s=ds_list_find_value(l_list,l_i);
			gml_asset_add(l_s,asset_get_index(l_s));
		}
	}
	l_list=ds_map_find_value(l_map,"globals");
	l_n=ds_list_size(l_list);
	if(l_n>0){
		var l_buf=buffer_create(1024,buffer_grow,1);
		buffer_seek(l_buf,buffer_seek_start,0);
		buffer_write(l_buf,buffer_text,"globalvar ");
		buffer_write(l_buf,buffer_text,ds_list_find_value(l_list,0));
		for(l_i=1;l_i<l_n;l_i++){
			buffer_write(l_buf,buffer_text,", ");
			buffer_write(l_buf,buffer_text,ds_list_find_value(l_list,l_i));
		}
		buffer_write(l_buf,buffer_string,";");
		buffer_seek(l_buf,buffer_seek_start,0);
		live_live_globals=new gml_source("globalvar",buffer_read(l_buf,buffer_string),"globalvar",true);
		buffer_delete(l_buf);
	} else live_live_globals=undefined;
	l_srcMap=live_live_macros;
	tools__dictionary_dictionary_impl__clear(l_srcMap);
	l_list=ds_map_find_value(l_map,"macros");
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i+=2){
		l_s=ds_list_find_value(l_list,l_i);
		var l_s1="macro:"+l_s;
		variable_struct_set(l_srcMap,l_s,new gml_source(l_s1,"#macro "+l_s+" "+gml_std_Std_stringify(ds_list_find_value(l_list,l_i+1)),l_s1,true));
	}
	l_srcMap=live_live_enums;
	tools__dictionary_dictionary_impl__clear(l_srcMap);
	l_list=ds_map_find_value(l_map,"enums");
	l_names=ds_map_find_value(l_map,"enumnames");
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i++){
		l_s=ds_list_find_value(l_list,l_i);
		l_s=ds_list_find_value(l_names,l_i);
		variable_struct_set(l_srcMap,l_s,new gml_source("enum "+l_s,ds_list_find_value(l_list,l_i),"enum "+l_s,true));
	}
	live_log_script("Ready!",0);
}

if(live_enabled)
function live_async_http_1(l_map){
	// live_async_http_1(map:live_GMLiveAsyncMap<any>)
	/// @ignore
	var l_list=ds_map_find_value(l_map,"files");
	var l_obj;
	var l_n=ds_list_size(l_list);
	var l_name;
	var l_i=-1;
	while(++l_i<l_n){
		var l_fmap=ds_list_find_value(l_list,l_i);
		var l_ident=ds_map_find_value(l_fmap,"ident");
		var l_code=ds_map_find_value(l_fmap,"code");
		l_name=ds_map_find_value(l_fmap,"name");
		live_update_script(l_name,l_ident,l_code);
	}
	l_list=ds_map_find_value(l_map,"sprites");
	if(l_list!=undefined){
		l_n=ds_list_size(l_list);
		l_i=-1;
		while(++l_i<l_n){
			var l_sup=ds_list_find_value(l_list,l_i);
			l_name=ds_map_find_value(l_sup,"name");
			var l_spr=asset_get_index(l_name);
			if(l_spr==-1){
				live_log_script("Error: can't find sprite "+l_name+" for reload.",2);
				continue;
			}
			var l_sx=ds_map_find_value(l_sup,"xorig");
			var l_sy=ds_map_find_value(l_sup,"yorig");
			var l_frames=ds_map_find_value(l_sup,"frames");
			var l_out=-1;
			var l_tmp=live_temp_path+".png";
			for(var l_i1=0,l__g1=ds_list_size(l_frames);l_i1<l__g1;l_i1++){
				var l_tb=buffer_base64_decode(ds_list_find_value(l_frames,l_i1));
				if(l_tb==-1){
					live_log_script("Error: couldn't decode base64 for "+l_name+".",2);
					continue;
				}
				buffer_save(l_tb,l_tmp);
				buffer_delete(l_tb);
				var l_ts=sprite_add(l_tmp,1,false,false,l_sx,l_sy);
				if(l_ts==-1){
					live_log_script("Error: couldn't load image "+string(l_i1)+" for "+l_name+".",2);
					continue;
				}
				if(l_i1!=0)sprite_merge(l_out,l_ts); else l_out=l_ts;
			}
			if(l_out!=-1){
				sprite_assign(l_spr,l_out);
				sprite_collision_mask(l_spr,ds_map_find_value(l_sup,"sepMasks"),ds_map_find_value(l_sup,"bboxMode"),ds_map_find_value(l_sup,"bboxLeft"),ds_map_find_value(l_sup,"bboxTop"),ds_map_find_value(l_sup,"bboxRight"),ds_map_find_value(l_sup,"bboxBottom"),ds_map_find_value(l_sup,"colKind"),ds_map_find_value(l_sup,"colTolerance"));
				l_obj=ds_map_find_value(l_sup,"nineslice");
				if(l_obj!=undefined&&l_obj!=pointer_null&&ds_map_find_value(l_obj,"enabled")){
					var l_nine=sprite_nineslice_create();
					l_nine.enabled=true;
					l_nine.left=ds_map_find_value(l_obj,"left");
					l_nine.top=ds_map_find_value(l_obj,"top");
					l_nine.right=ds_map_find_value(l_obj,"right");
					l_nine.bottom=ds_map_find_value(l_obj,"bottom");
					var l_tm=ds_map_find_value(l_obj,"tileMode");
					var l__g2=[];
					for(var l_i2=0,l__g4=ds_list_size(l_tm);l_i2<l__g4;l_i2++){
						array_push(l__g2,ds_list_find_value(l_tm,l_i2));
					}
					l_nine.tileMode=l__g2;
					sprite_set_nineslice(l_spr,l_nine);
				}
				sprite_delete(l_out);
				live_log_script("Reloaded "+l_name+".",0);
				live_sprite_updated(l_spr);
			}
			file_delete(l_tmp);
		}
	}
	l_list=ds_map_find_value(l_map,"shadersUpd");
	if(l_list!=undefined){
		l_n=ds_list_size(l_list);
		l_i=-1;
		while(++l_i<l_n){
			var l_sup=ds_list_find_value(l_list,l_i);
			l_name=ds_map_find_value(l_sup,"name");
			live_shader_updated(asset_get_index(l_name),ds_map_find_value(l_sup,"vertex"),ds_map_find_value(l_sup,"fragment"));
			live_log_script("Reloaded "+l_name+".",0);
		}
	}
	l_list=ds_map_find_value(l_map,"rooms");
	if(l_list!=undefined){
		l_n=ds_list_size(l_list);
		l_i=-1;
		while(++l_i<l_n){
			var l_ru=ds_list_find_value(l_list,l_i);
			var l_rq=asset_get_index(ds_map_find_value(l_ru, "name"));
			ds_map_set(live_live_room_data,l_rq,ds_map_find_value(l_ru, "json"));
			live_room_updated(l_rq);
		}
	}
	l_list=ds_map_find_value(l_map,"pathsUpd");
	if(l_list!=undefined){
		for(var l_i=0,l__g1=ds_list_size(l_list);l_i<l__g1;l_i++){
			var l_pup=ds_list_find_value(l_list,l_i);
			l_name=ds_map_find_value(l_pup,"name");
			var l_pt=asset_get_index(l_name);
			if(!path_exists(l_pt)){
				live_log_script("Couldn't find path '"+l_name+"'",1);
				continue;
			}
			path_clear_points(l_pt);
			path_set_closed(l_pt,ds_map_find_value(l_pup,"closed"));
			path_set_kind(l_pt,ds_map_find_value(l_pup,"kind"));
			path_set_precision(l_pt,ds_map_find_value(l_pup,"precision"));
			var l__g_list=ds_map_find_value(l_pup,"points");
			var l__g_index=0;
			while(l__g_index<ds_list_size(l__g_list)){
				var l_point=ds_list_find_value(l__g_list,l__g_index++);
				path_add_point(l_pt,ds_map_find_value(l_point,"x"),ds_map_find_value(l_point,"y"),ds_map_find_value(l_point,"speed"));
			}
			live_log_script("Reloaded "+l_name+".",0);
			live_path_updated(l_pt);
		}
	}
	l_list=ds_map_find_value(l_map,"animCurvesUpd");
	if(l_list!=undefined){
		for(var l_i=0,l__g1=ds_list_size(l_list);l_i<l__g1;l_i++){
			var l_acu=ds_list_find_value(l_list,l_i);
			l_name=ds_map_find_value(l_acu, "name");
			var l_ac=asset_get_index(l_name);
			if(!animcurve_exists(l_ac)){
				live_log_script("Couldn't find animcurve \""+l_name+"\"",1);
				continue;
			}
			var l_acStruct=animcurve_get(l_ac);
			var l_acuChannels=ds_map_find_value(l_acu, "channels");
			var l_acuType=ds_map_find_value(l_acu, "type");
			var l_acChannels=[];
			for(var l_i1=0,l__g3=ds_list_size(l_acuChannels);l_i1<l__g3;l_i1++){
				var l_acuChannel=ds_list_find_value(l_acuChannels,l_i1);
				var l_acChannel=animcurve_channel_new();
				l_acChannel.name=ds_map_find_value(l_acuChannel, "name");
				l_acChannel.type=l_acuType;
				var l_acuData=ds_map_find_value(l_acuChannel, "data");
				var l_acPoints=[];
				var l_acuInd=0;
				for(var l__=0,l__g5=(ds_list_size(l_acuData)>>1);l__<l__g5;l__++){
					var l_acPoint=animcurve_point_new();
					l_acPoint.posx=ds_list_find_value(l_acuData,l_acuInd++);
					l_acPoint.value=ds_list_find_value(l_acuData,l_acuInd++);
					array_push(l_acPoints,l_acPoint);
				}
				l_acChannel.points=l_acPoints;
				array_push(l_acChannels,l_acChannel);
			}
			l_acStruct.channels=l_acChannels;
			live_log_script("Reloaded "+l_name+".",0);
			live_animcurve_updated(l_ac);
		}
	}
	l_list=ds_map_find_value(l_map,"incFilesUpd");
	if(l_list!=undefined){
		for(var l_i=0,l__g1=ds_list_size(l_list);l_i<l__g1;l_i++){
			var l_sub=ds_list_find_value(l_list,l_i);
			l_name=ds_map_find_value(l_sub,"path");
			var l_ip=ds_map_find_value(live_live_included_files,l_name);
			if(l_ip==undefined){
				live_log_script("Couldn't find live included file \""+l_name+"\"",1);
				continue;
			}
			var l_b64=ds_map_find_value(l_sub,"data");
			switch(l_ip.kind){
				case 1:l_ip.func(base64_decode(l_b64),l_name);break;
				case 4:
					var l_tmp1=live_temp_path+".csv";
					buffer_save(buffer_base64_decode(l_b64),l_tmp1);
					var l_grid=load_csv(l_tmp1);
					l_ip.func(l_grid,l_name);
					ds_grid_destroy(l_grid);
					file_delete(l_tmp1);
					break;
				case 0:
					var l_buf=buffer_base64_decode(l_b64);
					l_ip.func(l_buf,l_name);
					buffer_delete(l_buf);
					break;
				case 2:
					var l_val;
					try{
						l_val=json_parse(base64_decode(l_b64))
					}catch(l__g2){
						live_log_script(("Couldn't decode JSON for \""+l_name+"\": "+gml_std_Std_stringify(gml_std_haxe_Exception_caught(l__g2).h_unwrap())),1);
						continue;
					}
					l_ip.func(l_val,l_name);
					break;
				case 3:l_ip.func(l_b64,l_name);break;
			}
		}
	}
}

if(live_enabled)
function live_async_http_check(l_e){
	// live_async_http_check(e:live_GMLiveAsyncMap<any>)->bool
	/// @ignore
	return ds_map_find_value(l_e,"id")==live_request_id&&ds_map_find_value(l_e,"status")<=0;
}

function live_async_http(l_e){
	/// live_async_http(?e:live_GMLiveAsyncMap<any>)
	/// @param {live_GMLiveAsyncMap<any>} ?e
	/// @returns {void}
	if(false)show_debug_message(argument[0]);
	if(live_enabled){
		if(l_e==undefined)l_e=async_load;
		if(!live_async_http_check(l_e))exit;
		live_request_id=undefined;
		if(ds_map_find_value(l_e,"status")<0||ds_map_find_value(l_e,"result")==undefined)exit;
		var l_json1=ds_map_find_value(l_e,"result");
		var l_map=json_decode(l_json1);
		if(l_map==-1||ds_map_exists(l_map,"default")){
			if(string_char_at(l_json1,1)=="{"&&string_char_at(l_json1,string_length(l_json1)-1+1)=="]")l_json1+="}";
			l_map=json_decode(l_json1);
			if(l_map==-1||ds_map_exists(l_map,"default")){
				live_log_script(("Invalid JSON response ("+gml_std_Std_stringify(string_length(l_json1)/1000)+" KB)"),2);
				exit;
			}
		}
		if(live_request_guid==undefined)live_async_http_0(l_map);
		live_async_http_1(l_map);
		ds_map_destroy(l_map);
	}
}

if(live_enabled)
function live_gmlive_patcher_add_source(l_name,l_acc,l_found,l_m){
	// live_gmlive_patcher_add_source(name:string, acc:sf_ds_ArrayList<gml_source>, found:tools_Dictionary<bool>, m:gml_source)
	/// @ignore
	variable_struct_set(l_found,l_name,true);
	var l_tokens;
	var l_parser=l_m.h_parser;
	if(l_parser!=undefined){
		if(l_parser.h_token_count<0)exit;
		l_tokens=l_parser.h_tokens;
	} else {
		l_m.h_index=ds_list_size(l_acc)+1;
		l_parser=new gml_parser(l_m);
		l_m.h_parser=l_parser;
		l_tokens=l_parser.h_run();
		if(l_tokens==undefined)exit;
	}
	var l_tokenCount=l_parser.h_token_count;
	ds_list_add(l_acc,l_m);
	live_gmlive_patcher_index_rec(l_tokens,l_tokenCount,l_acc,l_found);
	var l_macros=l_parser.h_macros;
	for(var l_i=0,l__g1=array_length(l_macros);l_i<l__g1;l_i++){
		var l_mtokens=l_macros[l_i].h_tokens;
		live_gmlive_patcher_index_rec(l_mtokens,array_length(l_mtokens),l_acc,l_found);
	}
}

if(live_enabled)
function live_gmlive_patcher_index_rec(l_tokens,l_tokensLen,l_acc,l_found){
	// live_gmlive_patcher_index_rec(tokens:array<gml_token>, tokensLen:int, acc:sf_ds_ArrayList<gml_source>, found:tools_Dictionary<bool>)
	/// @ignore
	var l_tokensLen1=l_tokensLen-1;
	var l_tokensPos=-1;
	var l_macros=live_live_macros;
	var l_enums=live_live_enums;
	while(++l_tokensPos<l_tokensLen){
		var l_tk=l_tokens[l_tokensPos];
		var l_id;
		if(l_tk[0]==12)l_id=l_tk[2]; else continue;
		if(variable_struct_exists(l_found,l_id))continue;
		var l_src=variable_struct_get(l_macros,l_id);
		if(l_src!=undefined){
			live_gmlive_patcher_add_source(l_id,l_acc,l_found,l_src);
			continue;
		}
		l_src=variable_struct_get(l_enums,l_id);
		if(l_src!=undefined){
			if(l_tokensPos>0){
				var l__g1=l_tokens[l_tokensPos-1];
				if((l__g1[0]==6))continue;
			}
			if(l_tokensPos<l_tokensLen1){
				var l__g3=l_tokens[l_tokensPos+1];
				if((l__g3[0]==6))live_gmlive_patcher_add_source(l_id,l_acc,l_found,l_src);
			}
			continue;
		}
		variable_struct_set(l_found,l_id,true);
	}
}

if(live_enabled)
function live_gmlive_patcher_patch_live_patch_source_rec(l_pos,l_newID,l_depth){
	// live_gmlive_patcher_patch_live_patch_source_rec(pos:gml_pos, newID:int, depth:int)
	/// @ignore
	if(++l_depth>=16)exit;
	if(l_pos[0]==-3)l_pos[@0]=l_newID;
	if(l_pos[3]!=undefined)live_gmlive_patcher_patch_live_patch_source_rec(l_pos[3],l_newID,l_depth);
}

if(live_enabled)
function live_gmlive_patcher_compile_ex(l_name,l_code){
	// live_gmlive_patcher_compile_ex(name:string, code:string)->gml_program
	/// @ignore
	var l_source=new gml_source(l_name,l_code,l_name);
	l_source.h_index=-3;
	var l_parser=new gml_parser(l_source);
	l_source.h_parser=l_parser;
	var l_tokens=l_parser.h_run();
	if(l_tokens==undefined){
		live_gmlive_patcher_error_text=gml_parser_error_text;
		return undefined;
	}
	var l_found=live_async_http_1_found;
	var l_acc=live_async_http_1_acc;
	tools__dictionary_dictionary_impl__clear(l_found);
	ds_list_clear(l_acc);
	if(live_live_globals!=undefined)ds_list_add(l_acc,live_live_globals);
	l_source.h_parser=l_parser;
	live_gmlive_patcher_index_rec(l_tokens,l_parser.h_token_count,l_acc,l_found);
	var l_baseSourceID=ds_list_size(l_acc);
	ds_list_add(l_acc,l_source);
	var l_tks=l_parser.h_tokens;
	for(var l_ti=0,l__g1=array_length(l_tks);l_ti<l__g1;l_ti++){
		live_gmlive_patcher_patch_live_patch_source_rec(l_tks[l_ti][1],l_baseSourceID,0);
	}
	var l_srci=ds_list_size(l_acc);
	var l_sources=array_create(l_srci);
	while(--l_srci>=0){
		l_sources[@l_srci]=ds_list_find_value(l_acc,l_srci);
	}
	var l_pg=new gml_program(l_sources);
	live_gmlive_patcher_error_text=l_pg.h_error_text;
	if(!l_pg.h_is_ready){
		l_pg.h_destroy();
		return undefined;
	}
	l_pg.h_tag=l_name;
	return l_pg;
}

if(live_enabled)
function live_shader_updated_default(){
	// live_shader_updated_default()
	/// @ignore
	show_error("Can't update shader! You have not assigned a script to live_shader_updated. Please check documentation",true);
}

function shader_set_live(l_sh,l_live1){
	/// shader_set_live(sh:shader, live:bool)
	/// @param {shader} sh
	/// @param {bool} live
	/// @returns {void}
	if(live_enabled){
		var l_i;
		if(l_live1){
			if(ds_map_exists(live_shader_live_shaders,l_sh))exit;
			ds_map_set(live_shader_live_shaders,l_sh,true);
			l_i=ds_list_find_index(live_shader_live_shaders_stop,l_sh);
			if(l_i>=0)ds_list_delete(live_shader_live_shaders_stop,l_i);
			ds_list_add(live_shader_live_shaders_start,l_sh);
		} else {
			if(!ds_map_exists(live_shader_live_shaders,l_sh))exit;
			ds_map_delete(live_shader_live_shaders,l_sh);
			l_i=ds_list_find_index(live_shader_live_shaders_start,l_sh);
			if(l_i>=0)ds_list_delete(live_shader_live_shaders_start,l_i);
			ds_list_add(live_shader_live_shaders_stop,l_sh);
		}
	}
}

function live_validate_scripts(){
	/// live_validate_scripts()
	/// @returns {void}
	if(live_enabled){
		var l_names=["GMLive_call","live_call","GMLive_tools","live_execute_string","GMLive_parser","gml_parser_buf_sub","GMLive_nodeTools","gml_node_tools_seek","GMLive_builder","gml_builder","GMLive_compiler","gml_compile_program","GMLive_seekEval","gml_seek_eval_eval","GMLive_seekSetOp","gml_seek_set_op_proc","GMLive_action","mc_gml_action","GMLive_new","vm_impl_gml_thread_construct_init","GMLive_exec","vm_gml_thread_exec_slice_init","GMLive_program","gml_program","GMLive_thread","gml_thread","GMLive_vm","vm_group_op_impl","GMLive_vm_init","vm_v2_gml_thread_v2_handlers_init","GMLive_vm_call","live_method","GMLiveAPI","live_preinit_api","GMLive_roomLoader","live_room_start","GMLive_http","live_async_http"];
		var l_i=0;
		var l_count=array_length(l_names);
		while(l_i<l_count){
			var l_scr=l_names[l_i++];
			var l_ref=l_names[l_i++];
			if(-1==asset_get_index(l_ref))show_error(("Function `"+l_ref+"` is missing!"+("\nCheck that script resource `"+l_scr+"` exists (Ctrl+T) and is not just a single empty function;")+"\ndelete and re-import if necessary!"),false);
		}
	}
}

if(live_enabled)
function live_cache_data_create(){
	// live_cache_data_create()
	/// @ignore
	var l_this=array_create(1);
	/// @typedef {tuple<program:gml_program>} live_cache_data
	l_this[@0]=undefined;
	return l_this;
}

if(live_enabled)
function tools__dictionary_dictionary_impl__clear(l_this1){
	// tools__dictionary_dictionary_impl__clear(this:any)
	/// @ignore
	var l_keys=variable_struct_get_names(l_this1);
	var l__g=0;
	while(l__g<array_length(l_keys)){
		var l_key=l_keys[l__g];
		l__g++;
		variable_struct_remove(l_this1,l_key);
	}
}

function live_method(l_newSelf,l_func){
	/// live_method(newSelf:any, func:any)->any
	/// @param {any} newSelf
	/// @param {any} func
	/// @returns {any}
	if(live_enabled){
		if(is_method(l_func)){
			var l_meta=method_get_self(l_func);
			if(is_struct(l_meta)&&variable_struct_exists(l_meta,"live:self")){
				var l_nmeta=haxe__dynamic_access_dynamic_access_impl__copy(l_meta);
				variable_struct_set(l_nmeta,"live:self",l_newSelf);
				return method(l_nmeta,l_func);
			}
		}
		return method(l_newSelf,l_func);
	}else return method(l_newSelf, l_func);
}

function live_method_get_self(l_func){
	/// live_method_get_self(func:any)->any
	/// @param {any} func
	/// @returns {any}
	if(live_enabled){
		var l_fnSelf=method_get_self(l_func);
		if(is_struct(l_fnSelf)&&variable_struct_exists(l_fnSelf,"live:self"))return variable_struct_get(l_fnSelf,"live:self");
		return l_fnSelf;
	}else return method_get_self(l_func);
}

function gml_thread_method_script(){
	/// gml_thread_method_script(...rest:any)->any
	/// @param {any} ...rest
	/// @returns {any}
	if(false)show_debug_message(argument[argument_count-1]);
	if(live_enabled){
		var l_argc=argument_count;
		var l_args1=array_create(l_argc);
		for(var l_i=0;l_i<l_argc;l_i++){
			l_args1[@l_i]=argument[l_i];
		}
		var l_meta=self;
		var l_meta1=l_meta;
		var l_self1=variable_struct_get(l_meta,"live:self");
		var l_result;
		do {
			var l_ctx=variable_struct_get(l_meta1,"live:context");
			var l_pg;
			if(l_ctx!=undefined){
				var l_livedata=variable_struct_get(live_live_map,l_ctx);
				if(l_livedata==undefined)show_error("Trying to call a nonexistent GMLive program: "+gml_std_Std_stringify(l_ctx),true);
				l_pg=l_livedata[0];
				if(l_pg==undefined){
					live_log_script("Trying to call a broken GMLive program "+gml_std_Std_stringify(l_ctx)+", returning undefined",2);
					l_result=undefined;
					break;
				}
			} else {
				l_pg=variable_struct_get(l_meta1,"live:program");
				if(l_pg==undefined)show_error("It would appear that you've re-bound a GMLive function to a different scope. Please use live_method() rather than method() to do so.",true);
			}
			live_custom_self=l_self1;
			live_custom_other=other;
			var l_th=l_pg.h_call_v(variable_struct_get(l_meta1,"live:function"),l_args1,false);
			if(l_th==undefined){
				l_result=undefined;
				break;
			}
			if(l_th.h_status==3){
				l_result=l_th.h_result;
			} else if(l_th.h_status==4){
				live_log_script(("Runtime error: "+l_th.h_get_error()),2);
				l_result=undefined;
			} else l_result=undefined;
		} until(true);
		return l_result;
	}else return undefined;
}

if(live_enabled)
function vm_v2_gml_thread_group_func_literal_ctr_impl(){
	// vm_v2_gml_thread_group_func_literal_ctr_impl()
	/// @ignore
	show_error("\"live\" constructors should be invoked through live_new",true);
}

if(live_enabled)
function vm_v2_gml_thread_group_func_literal_create_function(l_program,l__name,l__self){
	// vm_v2_gml_thread_group_func_literal_create_function(program:gml_program, _name:string, _self:any)->function
	/// @ignore
	var l_meta={}
	var l_funcSelf=l__self;
	if(!is_struct(l_funcSelf)&&instanceof(l_funcSelf)=="instance")l_funcSelf=l_funcSelf.id;
	variable_struct_set(l_meta,"live:self",l_funcSelf);
	var l_th=gml_thread_current;
	if(l_th.h_scope[9].h_live_ident!=undefined)variable_struct_set(l_meta,"live:context",l_th.h_scope[9].h_live_ident); else variable_struct_set(l_meta,"live:program",l_th.h_scope[9]);
	variable_struct_set(l_meta,"live:function",l__name);
	var l_isCtr=variable_struct_get(l_program.h_script_map,l__name).h_is_constructor;
	variable_struct_set(l_meta,"live:isConstructor",l_isCtr);
	if(l_isCtr)return method(l_meta,vm_v2_gml_thread_group_func_literal_ctr_impl); else return method(l_meta,gml_thread_method_script);
}

if(live_enabled)
function vm_v2_gml_thread_group_func_literal_on_func_literal(l_th,l_act,l_scope,l_stack){
	// vm_v2_gml_thread_group_func_literal_on_func_literal(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==89){
		var l_self1;
		if(l_act.h_unbound){
			l_self1=undefined;
		} else {
			var l_this1=l_scope[6];
			l_self1=l_this1[l_this1[0]];
		}
		gml_stack_push(l_stack,vm_v2_gml_thread_group_func_literal_create_function(l_scope[9],l_act.h_name,l_self1));
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,l_name,l_fn){
	// vm_v2_gml_thread_v2_handlers_init_set(funcs:array<vm_v2_GmlThreadProc>, map:tools_Dictionary<int>, name:string, fn:vm_v2_GmlThreadProc)
	/// @ignore
	var l_id=variable_struct_get(l_map,l_name);
	if(l_id!=undefined)l_funcs[@l_id]=l_fn; else show_error("Can't find "+l_name,true);
}

if(live_enabled)
function vm_v2_gml_thread_v2_handlers_init(){
	// vm_v2_gml_thread_v2_handlers_init()->array<vm_v2_GmlThreadProc>
	/// @ignore
	var l_names=gml_std_Type_getEnumConstructs(mt_gml_action);
	var l_map={}
	var l_funcs=array_create(array_length(l_names),undefined);
	for(var l_i=0,l__g1=array_length(l_names);l_i<l__g1;l_i++){
		var l_name=l_names[l_i];
		if(gml_std_StringTools_endsWith(l_name,"_hx"))l_name=gml_std_string_substring(l_name,0,string_length(l_name)-3);
		variable_struct_set(l_map,l_name,l_i);
		l_funcs[@l_i]=vm_v2_gml_thread_v2_on_unknown;
	}
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"discard",vm_group_stack_on_discard);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"dup",vm_group_stack_on_dup);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"dup2x",vm_group_stack_on_dup2x);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"dup3x",vm_group_stack_on_dup3x);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"dup_in",vm_group_stack_on_dup_in);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"undefined",vm_group_literal_on_undefined);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"number",vm_group_literal_on_number);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"cstring",vm_group_literal_on_cstring);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"const",vm_group_literal_on_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"self",vm_group_literal_on_self);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"other",vm_group_literal_on_other);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"result",vm_group_literal_on_result);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"array_decl",vm_group_literal_on_array_decl);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"object_decl",vm_group_literal_on_object_decl);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"bin_op",vm_group_op_on_bin_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"un_op",vm_group_op_on_un_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"equ_op",vm_group_op_on_equ_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"neq_op",vm_group_op_on_neq_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"add_int",vm_group_op_on_add_int);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"concat",vm_group_op_on_concat);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"ds_aop",vm_group_op_on_ds_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_count",vm_group_arg_on_arg_count);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_const",vm_group_arg_on_arg_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_const_set",vm_group_arg_on_arg_const_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_const_aop",vm_group_arg_on_arg_const_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_index",vm_group_arg_on_arg_index);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_index_set",vm_group_arg_on_arg_index_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"arg_index_aop",vm_group_arg_on_arg_index_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"local",vm_group_local_on_local);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"local_set",vm_group_local_on_local_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"local_aop",vm_group_local_on_local_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"global",vm_group_global_on_global);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"global_set",vm_group_global_on_global_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"global_aop",vm_group_global_on_global_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"field",vm_group_field_on_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"field_set",vm_group_field_on_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"field_aop",vm_group_field_on_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"self_field",vm_group_field_on_self_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"self_field_set",vm_group_field_on_self_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"self_field_aop",vm_group_field_on_self_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_self_field",vm_group_field_on_fast_self_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_self_field_set",vm_group_field_on_fast_self_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_self_field_aop",vm_group_field_on_fast_self_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"local_field",vm_group_field_on_local_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"local_field_set",vm_group_field_on_local_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"local_field_aop",vm_group_field_on_local_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_local_field",vm_group_field_on_fast_local_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_local_field_set",vm_group_field_on_fast_local_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_local_field_aop",vm_group_field_on_fast_local_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fast_field_aop",vm_group_field_on_fast_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"in",vm_group_field_on_in);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"in_const",vm_group_field_on_in_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"with_pre",vm_group_with_on_with_pre);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"with_next",vm_group_with_on_with_next);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"with_post",vm_group_with_on_with_post);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"env",vm_group_env_on_env);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"env_set",vm_group_env_on_env_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"env_aop",vm_group_env_on_env_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"env1d",vm_group_env_on_env1d);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"env1d_set",vm_group_env_on_env1d_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"env1d_aop",vm_group_env_on_env1d_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"index",vm_group_array_on_index);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"index_set",vm_group_array_on_index_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"index_aop",vm_group_array_on_index_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"index2d",vm_group_array_on_index2d);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"index2d_set",vm_group_array_on_index2d_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"index2d_aop",vm_group_array_on_index2d_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"ensure_array_for_local",vm_group_ensure_plus_on_ensure_array_for_local);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"ensure_array_for_global",vm_group_ensure_plus_on_ensure_array_for_global);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"ensure_array_for_field",vm_group_ensure_plus_on_ensure_array_for_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"ensure_array_for_index",vm_group_ensure_plus_on_ensure_array_for_index);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"ensure_array_for_index2d",vm_group_ensure_plus_on_ensure_array_for_index2d);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"alarm",vm_group_alarm_on_alarm);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"alarm_set",vm_group_alarm_on_alarm_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"alarm_aop",vm_group_alarm_on_alarm_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"jump",vm_group_jump_on_jump);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"jump_if",vm_group_jump_on_jump_if);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"jump_unless",vm_group_jump_on_jump_unless);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"bool_and",vm_group_jump_on_bool_and);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"bool_or",vm_group_jump_on_bool_or);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"switch",vm_group_jump_on_switch);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"switch_case",vm_group_jump_on_switch_case);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"null_co",vm_group_jump_on_null_co);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"repeat_pre",vm_group_jump_on_repeat_pre);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"repeat_jump",vm_group_jump_on_repeat_jump);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"break",vm_group_jump_on_break);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"continue",vm_group_jump_on_continue);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"return",vm_group_jump_on_return);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"return_const",vm_group_jump_on_return_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"wait",vm_group_special_on_wait);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"fork",vm_group_special_on_fork);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"try",vm_group_special_on_try);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"catch",vm_group_special_on_catch);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"finally",vm_group_special_on_finally);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"throw",vm_group_special_on_throw);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_script",vm_group_call_on_call_script);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_script_id",vm_group_call_on_call_script_id);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_script_with_array",vm_group_call_on_call_script_with_array);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func",vm_group_call_on_call_func);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_field",vm_group_call_on_call_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"construct",vm_group_call_on_construct);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"func_literal",vm_v2_gml_thread_group_func_literal_on_func_literal);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func0",vm_group_fast_call_on_call_func0);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func0o",vm_group_fast_call_on_call_func0o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func1",vm_group_fast_call_on_call_func1);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func1o",vm_group_fast_call_on_call_func1o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func2",vm_group_fast_call_on_call_func2);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func2o",vm_group_fast_call_on_call_func2o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func3",vm_group_fast_call_on_call_func3);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func3o",vm_group_fast_call_on_call_func3o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func4",vm_group_fast_call_on_call_func4);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func4o",vm_group_fast_call_on_call_func4o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local0",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local0o",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local1",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local1o",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local2",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local2o",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local3",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local3o",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local4",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs,l_map,"call_func_with_local4o",vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4o);
	return l_funcs;
}

if(live_enabled)
function vm_v2_gml_thread_v2_ready(){
	// vm_v2_gml_thread_v2_ready()
	/// @ignore
	vm_v2_gml_thread_v2_handlers=vm_v2_gml_thread_v2_handlers_init();
}

if(live_enabled)
function vm_v2_gml_thread_v2_on_unknown(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_v2_on_unknown(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_th.h_proc_error("Can't execute "+gml_std_Type_enumConstructor(l_act),l_act);
	return 1;
}

if(live_enabled)
function live_temp_path_init(){
	// live_temp_path_init()->string
	/// @ignore
	return "gmlive-"+gml_std_Std_stringify(gml_std_Date_now().h_getTime());
}

if(live_enabled)
function live_script_get_index(l_name){
	// live_script_get_index(name:string)->script
	/// @ignore
	return asset_get_index(l_name);
}

if(live_enabled)
function live_log_impl(l_text,l_level){
	// live_log_impl(text:string, level:live_GMLiveLogLevel)
	/// @ignore
	if(l_level==0)show_debug_message("[GMLive]["+date_datetime_string(gml_std_Date_now().h_date)+"] "+l_text); else show_debug_message("[GMLive]["+date_datetime_string(gml_std_Date_now().h_date)+"]["+live_log_impl_levels[l_level]+"] "+l_text);
}

if(live_enabled)
function live_log(l_s,l_level){
	// live_log(s:string, level:live_GMLiveLogLevel)
	/// @ignore
	live_log_script(l_s,l_level);
}

function live_update_script_impl(l_name,l_ident,l_code){
	/// live_update_script_impl(name:string, ident:string, code:string)
	/// @param {string} name
	/// @param {string} ident
	/// @param {string} code
	/// @returns {void}
	if(live_enabled){
		var l_data=variable_struct_get(live_live_map,l_ident);
		if(l_data==undefined){
			l_data=live_cache_data_create();
			variable_struct_set(live_live_map,l_ident,l_data);
		}
		var l_pg=live_gmlive_patcher_compile_ex(l_name,l_code);
		if(l_pg==undefined){
			live_log_script("Error in "+l_name+":",2);
			live_log_script(live_gmlive_patcher_error_text,2);
			exit;
		}
		if(l_pg.h_error_text!=undefined){
			live_log_script("Warning in "+l_name+":",1);
			live_log_script(l_pg.h_error_text,1);
		}
		l_pg.h_live_ident=l_ident;
		live_log_script("Reloaded "+l_name+".",0);
		live_code_updated(l_ident,l_name);
		if(l_data[0]!=undefined)l_data[0].h_destroy();
		l_data[@0]=l_pg;
	}
}

function live_constant_add(l_name,l_value){
	/// live_constant_add(name:string, value:any)
	/// @param {string} name
	/// @param {any} value
	/// @returns {void}
	if(live_enabled){
		gml_const_add(l_name,l_value);
	}
}

function live_constant_delete(l_name){
	/// live_constant_delete(name:string)->bool
	/// @param {string} name
	/// @returns {bool}
	if(live_enabled){
		return gml_remove_const(l_name);
	}else return false;
}

function live_variable_add(l_signature,l_func){
	/// live_variable_add(signature:string, func:any)
	/// @param {string} signature
	/// @param {any} func
	/// @returns {void}
	if(live_enabled){
		gml_var_add(l_signature,l_func);
	}
}

function live_variable_delete(l_name){
	/// live_variable_delete(name:string)->bool
	/// @param {string} name
	/// @returns {bool}
	if(live_enabled){
		return gml_remove_var(l_name);
	}else return false;
}

function live_function_add(l_signature,l_func){
	/// live_function_add(signature:string, func:any)
	/// @param {string} signature
	/// @param {any} func
	/// @returns {void}
	if(live_enabled){
		var l_f=new gml_func();
		l_f.h_set(l_signature,l_func);
		variable_struct_set(gml_func_map,l_f.h_name,l_f);
	}
}

function live_function_delete(l_name){
	/// live_function_delete(name:string)->bool
	/// @param {string} name
	/// @returns {bool}
	if(live_enabled){
		if(variable_struct_get(gml_func_map,l_name)==undefined){
			return false;
		} else {
			variable_struct_remove(gml_func_map,l_name);
			return true;
		}
	}else return false;
}

function live_throw_error(l_text){
	/// live_throw_error(text:string)
	/// @param {string} text
	/// @returns {void}
	if(live_enabled){
		gml_thread_error(l_text);
	}
}

function live_execute_string(l_gml_code){
	/// live_execute_string(gml_code:string, ...args:any)->bool
	/// @param {string} gml_code
	/// @param {any} ...args
	/// @returns {bool}
	if(false)show_debug_message(argument[argument_count-1]);
	if(live_enabled){
		var l_pg=new gml_program([new gml_source("execute_string",l_gml_code,"execute_string")]);
		var l_ok;
		live_custom_self=self;
		live_custom_other=other;
		if(l_pg.h_error_text==undefined){
			var l_argc=(argument_count-1);
			var l_argv=array_create(l_argc);
			var l_i=0;
			for(var l__=0;l__<l_argc;l__++){
				l_argv[@l_i]=argument[l_i+1];
				l_i++;
			}
			var l_th=l_pg.h_call_v("execute_string",l_argv,false);
			if(l_th.h_status==3){
				l_ok=true;
				live_result=l_th.h_result;
			} else {
				l_ok=false;
				live_result=l_th.h_error_text;
				if(live_result==undefined)live_result="(unknown error)";
			}
		} else {
			l_ok=false;
			live_result=l_pg.h_error_text;
		}
		l_pg.h_destroy();
		return l_ok;
	}else return false;
}

function live_snippet_create(l_gml_code,l_name){
	/// live_snippet_create(gml_code:string, name:string = "snippet")->gml_program
	/// @param {string} gml_code
	/// @param {string} [name="snippet"]
	/// @returns {gml_program}
	if(l_name==undefined)l_name="snippet";
	if(false)show_debug_message(argument[1]);
	if(live_enabled){
		var l_pg=new gml_program([new gml_source(l_name,l_gml_code,"snippet")]);
		if(l_pg.h_error_text==undefined){
			return l_pg;
		} else {
			live_result=l_pg.h_error_text;
			l_pg.h_destroy();
			return undefined;
		}
	}else return undefined;
}

function live_snippet_destroy(l_snippet){
	/// live_snippet_destroy(snippet:gml_program)
	/// @param {gml_program} snippet
	/// @returns {void}
	if(live_enabled){
		if(l_snippet.h_script_array!=undefined)l_snippet.h_destroy(); else show_error("This snippet is already destroyed",true);
	}
}

function live_snippet_call(l_snippet){
	/// live_snippet_call(snippet:gml_program, ...args:any)->bool
	/// @param {gml_program} snippet
	/// @param {any} ...args
	/// @returns {bool}
	if(false)show_debug_message(argument[argument_count-1]);
	if(live_enabled){
		var l_argc=(argument_count-1);
		var l_argv=array_create(l_argc);
		var l_i=0;
		for(var l__=0;l__<l_argc;l__++){
			l_argv[@l_i]=argument[l_i+1];
			l_i++;
		}
		live_custom_self=self;
		live_custom_other=other;
		var l_th=l_snippet.h_call_v("snippet",l_argv,false);
		if(l_th==undefined){
			live_result="(script missing)";
			return false;
		} else if(l_th.h_status==3){
			live_result=l_th.h_result;
			return true;
		} else {
			live_result=l_th.h_error_text;
			if(live_result==undefined)live_result="(unknown error)";
			return false;
		}
	}else return false;
}

function live_update(){
	/// live_update()
	/// @returns {void}
	if(live_enabled){
		if(live_request_url==undefined)exit;
		if(live_request_id==undefined){
			var l_now=current_time/1000*1000.;
			live_last_update_at=l_now;
			if(l_now>live_request_time){
				live_request_time=l_now+live_request_rate*1000;
				var l_url;
				if(live_request_guid==undefined){
					live_init_attempts-=1;
					if(current_time>live_init_timeout*1000&&live_init_attempts<0){
						if(!live_warned_about_init_timeout){
							live_warned_about_init_timeout=true;
							show_debug_message("Didn't receive a response from the server in "+string(live_init_timeout)+"s (live_init_timeout) - no longer retrying a connection");
						}
						exit;
					}
					live_log_script("Trying to connect to gmlive-server...",0);
					l_url=live_request_url+"/init?password="+live_request_password+"&version="+string(106)+"&noscripts=1&config="+live_config+"&runtime="+live_runtime_version+"&buildDate="+gml_std_Std_stringify(live_build_date);
				} else {
					l_url=live_request_url+"/update?guid="+((live_request_guid==undefined?"null":live_request_guid));
					l_url+=live_get_update_tail();
				}
				live_request_id=http_get(l_url);
			}
		}
	}
}

function live_init(l_updateRate,l_url,l_password){
	/// live_init(updateRate:number, url:string, password:string)
	/// @param {number} updateRate
	/// @param {string} url
	/// @param {string} password
	/// @returns {void}
	if(live_enabled){
		live_log_script("GMLive.gml v1.0.76 for GM2022+",0);
		if(l_url!=undefined){
			var l_url_last=string_length(l_url)-1;
			if(string_ord_at(l_url,l_url_last+1)==47)l_url=gml_std_string_substring(l_url,0,l_url_last);
		}
		live_log_script("Initializing...",0);
		live_config=os_get_config();
		live_runtime_version=GM_runtime_version;
		var l_date1=gml_std_Date_now();
		l_date1.h_date=GM_build_date;
		live_build_date=l_date1.h_getTime();
		live_request_rate=l_updateRate;
		live_request_url=l_url;
		live_request_password=l_password;
		var l_srs=asset_get_index("shader_replace_simple");
		if(l_srs!=-1)live_shader_updated=l_srs;
		live_log_script("Indexing assets...",0);
		live_bits_gmlive_indexer_add_assets();
		live_bits_gmlive_indexer_add_scripts();
		live_log_script("Indexed OK!",0);
	}
}

if(live_enabled)
function live_preinit_project_fake_call(){
	// live_preinit_project_fake_call()->bool
	/// @ignore
	live_name=undefined;
	return false;
}

if(live_enabled)
function live_preinit_project_lf(l_write,l_val){
	// live_preinit_project_lf(write:bool, val:any)->string
	/// @ignore
	if(l_write){
		live_name=l_val;
		return l_val;
	} else return live_name;
}

if(live_enabled)
function live_preinit_project(){
	// live_preinit_project()
	/// @ignore
	gml_var_add("live_name",live_preinit_project_lf);
	gml_const_add("live_result",false);
	var l_f=new gml_func();
	l_f.h_set("live_call(...):",live_preinit_project_fake_call);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_defcall(...):",live_preinit_project_fake_call);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_call_ext(...):",live_preinit_project_fake_call);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_defcall_ext(...):",live_preinit_project_fake_call);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_auto_call_1():",live_preinit_project_fake_call);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_method(self, func):",live_method);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("method(self, func):",live_method);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_method_get_self(func):",live_method_get_self);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("method_get_self(func):",live_method_get_self);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_execute_string(:string):",live_execute_string);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_snippet_create(:string, :string=\"snippet\"):",live_snippet_create);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_snippet_call(snip, ...rest):",live_snippet_call);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("live_snippet_destroy(snip):",live_snippet_destroy);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("sprite_set_live(spr:index, status:bool)",sprite_set_live);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("shader_set_live(sh:index, status:bool)",shader_set_live);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("path_set_live(pt:index, status:bool)",path_set_live);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("room_set_live(rm:index, status:bool)",room_set_live);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
	var l_f=new gml_func();
	l_f.h_set("room_goto_live(rm:index)",room_goto_live);
	variable_struct_set(gml_func_map,l_f.h_name,l_f);
}

if(live_enabled)
function live_room_loader_run_cc(l_ccRaw,l_ccPath){
	// live_room_loader_run_cc(ccRaw:string, ccPath:string)
	/// @ignore
	var l_ccError;
	var l_ccProgram=live_gmlive_patcher_compile_ex(l_ccPath,l_ccRaw);
	if(l_ccProgram==undefined)l_ccError=live_gmlive_patcher_error_text; else l_ccError=l_ccProgram.h_error_text;
	if(l_ccError==undefined){
		live_custom_self=self;
		live_custom_other=other;
		var l_ccThread=l_ccProgram.h_call_v(l_ccPath,array_create(0));
		if(l_ccThread.h_status!=3){
			l_ccError=l_ccThread.h_error_text;
			if(l_ccError==undefined)l_ccError=l_ccPath+": unknown execution error";
		}
	}
	if(l_ccProgram!=undefined)l_ccProgram.h_destroy();
	if(l_ccError!=undefined)live_log_script(l_ccError,2);
}

if(live_enabled)
function live_room_loader_init_physics(l_phs){
	// live_room_loader_init_physics(phs:live_yy_YyRoomPhySettings)
	/// @ignore
	if(l_phs==undefined)exit;
	if(ds_map_find_value(l_phs, "PhysicsWorld")){
		live_room_loader_use_physics=true;
		physics_world_create(ds_map_find_value(l_phs, "PhysicsWorldPixToMeters"));
		physics_world_gravity(ds_map_find_value(l_phs, "PhysicsWorldGravityX"),ds_map_find_value(l_phs, "PhysicsWorldGravityY"));
	} else live_room_loader_use_physics=false;
}

if(live_enabled)
function live_room_loader_anim_speed(l_val,l_type){
	// live_room_loader_anim_speed(val:number, type:string)->number
	/// @ignore
	if(l_type=="0")return l_val/room_speed; else return l_val;
}

if(live_enabled)
function live_room_loader_run_yy_inst_cc(l_inst,l_qinst){
	// live_room_loader_run_yy_inst_cc(inst:instance, qinst:live_yy_YyRoomInstance)
	/// @ignore
	with (l_inst) {
		var l_rname=ds_map_find_value(l_qinst, "name");
		event_perform(14,0);
		var l_rcc=ds_map_find_value(l_qinst, "propertyCode");
		if(l_rcc!=undefined&&l_rcc!="")live_room_loader_run_cc(l_rcc,l_rname+":Properties");
		event_perform(ev_create,0);
		l_rcc=ds_map_find_value(l_qinst, "creationCode");
		if(l_rcc!=undefined&&l_rcc!="")live_room_loader_run_cc(l_rcc,l_rname+":CreationCode");
	}
}

if(live_enabled)
function live_room_loader_add_layer(l_ql){
	// live_room_loader_add_layer(ql:live_yy_YyRoomLayer)
	/// @ignore
	var l_ql_depth=ds_map_find_value(l_ql, "depth");
	var l_ql_name=ds_map_find_value(l_ql, "name");
	var l_ql_sublayers=ds_map_find_value(l_ql, "layers");
	var l_ql_sublayer_index;
	var l_ql_sublayer_count=ds_list_size(l_ql_sublayers);
	var l_rl,l_i,l_n,l_f,l_s,l_aval,l_rx,l_ry;
	var l__g=ds_map_find_value(l_ql, "modelName");
	if(l__g==undefined){
		show_debug_message("Unknown layer type "+gml_std_Std_stringify(ds_map_find_value(l_ql, "modelName")));
	} else switch(l__g){
		case "GMRLayer":
			l_rl=layer_get_id(l_ql_name);
			if(l_rl==-1){
				l_rl=layer_create(l_ql_depth,l_ql_name);
				if(ds_map_find_value(l_ql, "visible")!=undefined)layer_set_visible(l_rl,ds_map_find_value(l_ql, "visible"));
			}
			if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
				l_ql_sublayer_index=0;
				while(l_ql_sublayer_index<l_ql_sublayer_count){
					live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers,l_ql_sublayer_index++));
				}
			}
			break;
		case "GMRBackgroundLayer":
			if(live_room_loader_apply_backgrounds){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(ds_map_find_value(l_ql, "visible")!=undefined)layer_set_visible(l_rl,ds_map_find_value(l_ql, "visible"));
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					while(l_ql_sublayer_index<l_ql_sublayer_count){
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers,l_ql_sublayer_index++));
					}
				}
				var l_qb=l_ql;
				l_s=ds_map_find_value(l_qb, "sprite");
				var l_rb=layer_background_create(l_rl,(l_s!=undefined?asset_get_index(l_s):-1));
				l_aval=ds_map_find_value(l_qb, "color");
				if(l_aval<0)l_aval+=4294967296.;
				if(l_aval!=undefined){
					layer_background_blend(l_rb,(l_aval&16777215));
					layer_background_alpha(l_rb,((l_aval>>24)/255));
				}
				l_aval=ds_map_find_value(l_qb, "htiled");
				if(l_aval!=undefined)layer_background_htiled(l_rb,l_aval); else layer_background_htiled(l_rb,true);
				l_aval=ds_map_find_value(l_qb, "vtiled");
				if(l_aval!=undefined)layer_background_vtiled(l_rb,l_aval); else layer_background_vtiled(l_rb,true);
				l_aval=ds_map_find_value(l_qb, "stretch");
				if(l_aval!=undefined)layer_background_stretch(l_rb,l_aval); else layer_background_stretch(l_rb,false);
				l_aval=ds_map_find_value(l_qb, "animationFPS");
				if(l_aval!=undefined)layer_background_speed(l_rb,live_room_loader_anim_speed(l_aval,ds_map_find_value(l_qb, "animationSpeedType")));
				l_aval=ds_map_find_value(l_qb, "x");
				if(l_aval==undefined)l_aval=0;
				layer_x(l_rl,live_room_loader_room_x+l_aval);
				l_aval=ds_map_find_value(l_qb, "y");
				if(l_aval==undefined)l_aval=0;
				layer_y(l_rl,live_room_loader_room_y+l_aval);
			}
			break;
		case "GMRTileLayer":
			if(live_room_loader_apply_tiles){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(ds_map_find_value(l_ql, "visible")!=undefined)layer_set_visible(l_rl,ds_map_find_value(l_ql, "visible"));
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					while(l_ql_sublayer_index<l_ql_sublayer_count){
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers,l_ql_sublayer_index++));
					}
				}
				var l_qt=l_ql;
				var l_qtt=ds_map_find_value(l_qt, "tiles");
				var l_qtb64=ds_map_find_value(l_qtt, "TileSerialiseDataZL");
				var l_qtw=ds_map_find_value(l_qtt, "SerialiseWidth");
				var l_qth=ds_map_find_value(l_qtt, "SerialiseHeight");
				var l_tileset1=(is_string(ds_map_find_value(l_qt, "tileset"))?asset_get_index(ds_map_find_value(l_qt, "tileset")):-1);
				var l_rx=0;
				var l_ry=0;
				var l_rt=layer_tilemap_create(l_rl,live_room_loader_room_x+ds_map_find_value(l_qt, "x"),live_room_loader_room_y+ds_map_find_value(l_qt, "y"),l_tileset1,l_qtw,l_qth);
				if(is_string(l_qtb64)){
					var l_qtbz=buffer_base64_decode(l_qtb64);
					if(l_qtbz==-1)show_error("Couldn't decode base64-decoded data",true);
					var l_qtb=buffer_decompress(l_qtbz);
					if(l_qtb==-1)show_error("Couldn't decompress ZLIB-compressed tile data",true);
					var l_qti=0;
					for(var l_y=0;l_y<l_qth;l_y++){
						for(var l_x=0;l_x<l_qtw;l_x++){
							var l_td=buffer_peek(l_qtb,l_qti*4,buffer_u32);
							l_qti++;
							if(tile_get_empty(l_td))l_td=0;
							tilemap_set(l_rt,l_td,l_rx+l_x,l_ry+l_y);
						}
					}
					buffer_delete(l_qtbz);
					buffer_delete(l_qtb);
				} else {
					var l_qtd=ds_map_find_value(l_qtt, "TileSerialiseData");
					var l_qti=0;
					for(var l_y=0;l_y<l_qth;l_y++){
						for(var l_x=0;l_x<l_qtw;l_x++){
							var l_td=ds_list_find_value(l_qtd,l_qti++);
							if(tile_get_empty(l_td))l_td=0;
							tilemap_set(l_rt,l_td,l_rx+l_x,l_ry+l_y);
						}
					}
				}
			}
			break;
		case "GMRInstanceLayer":
			if(live_room_loader_apply_instances){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(ds_map_find_value(l_ql, "visible")!=undefined)layer_set_visible(l_rl,ds_map_find_value(l_ql, "visible"));
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					while(l_ql_sublayer_index<l_ql_sublayer_count){
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers,l_ql_sublayer_index++));
					}
				}
				var l_qi=l_ql;
				l_rx=live_room_loader_room_x;
				l_ry=live_room_loader_room_y;
				var l_instances=ds_map_find_value(l_qi, "instances");
				l_n=ds_list_size(l_instances);
				var l_base=live_blank_object;
				if(l_n!=0){
					if(!object_exists(l_base))show_error("Please add a blank object and set live_blank_object to point at it in obj_gmlive's create event.",true);
				}
				var l_lco=live_room_loader_object_cache;
				l_i=-1;
				while(++l_i<l_n){
					var l_qinst=ds_list_find_value(l_instances,l_i);
					var l_rnext=instance_create_layer((l_rx+ds_map_find_value(l_qinst, "x")),(l_ry+ds_map_find_value(l_qinst, "y")),l_rl,l_base);
					var l_qid=ds_map_find_value(l_qinst, "name");
					ds_map_set(live_room_loader_inst_map_yy,l_qid,l_qinst);
					ds_map_set(live_room_loader_inst_map_gml,l_qid,l_rnext);
					with (l_rnext) {
						gml_const_add(ds_map_find_value(l_qinst, "name"),real(int64(self.id)));
						l_aval=ds_map_find_value(l_qinst, "rotation");
						if(l_aval!=undefined)self.image_angle=l_aval;
						l_aval=ds_map_find_value(l_qinst, "scaleX");
						if(l_aval!=undefined)self.image_xscale=l_aval;
						l_aval=ds_map_find_value(l_qinst, "scaleY");
						if(l_aval!=undefined)self.image_yscale=l_aval;
						l_aval=ds_map_find_value(l_qinst, "imageIndex");
						if(l_aval!=undefined)self.image_index=l_aval;
						l_aval=ds_map_find_value(l_qinst, "imageSpeed");
						if(l_aval!=undefined)self.image_speed=l_aval;
						l_f=ds_map_find_value(l_qinst, "color");
						if(l_f<0)l_f+=4294967296.;
						if(l_f!=undefined){
							self.image_blend=(l_f&16777215);
							self.image_alpha=(l_f>>24)/255;
						}
						l_s=ds_map_find_value(l_qinst, "obj");
						var l_id=ds_map_find_value(l_lco,l_s);
						if(l_id==undefined){
							l_id=asset_get_index(l_s);
							ds_map_set(l_lco,l_s,l_id);
						}
						instance_change(l_id,false);
					}
				}
			}
			break;
		case "GMRAssetLayer":
			if(live_room_loader_apply_sprites){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(ds_map_find_value(l_ql, "visible")!=undefined)layer_set_visible(l_rl,ds_map_find_value(l_ql, "visible"));
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					while(l_ql_sublayer_index<l_ql_sublayer_count){
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers,l_ql_sublayer_index++));
					}
				}
				var l_sprites=ds_map_find_value(l_ql, "assets");
				l_n=ds_list_size(l_sprites);
				var l_lcs=live_room_loader_sprite_cache;
				l_rx=live_room_loader_room_x;
				l_ry=live_room_loader_room_y;
				l_i=l_n;
				while(--l_i>=0){
					var l_qspr=ds_list_find_value(l_sprites,l_i);
					l_s=ds_map_find_value(l_qspr, "sprite");
					var l_rspr=l_rx+ds_map_find_value(l_qspr, "x");
					var l_rspr1=l_ry+ds_map_find_value(l_qspr, "y");
					var l_id=ds_map_find_value(l_lcs,l_s);
					if(l_id==undefined){
						l_id=asset_get_index(l_s);
						ds_map_set(l_lcs,l_s,l_id);
					}
					var l_rspr2=layer_sprite_create(l_rl,l_rspr,l_rspr1,l_id);
					l_aval=ds_map_find_value(l_qspr, "frameIndex");
					if(l_aval!=undefined)layer_sprite_index(l_rspr2,l_aval);
					l_aval=ds_map_find_value(l_qspr, "scaleX");
					if(l_aval!=undefined)layer_sprite_xscale(l_rspr2,l_aval);
					l_aval=ds_map_find_value(l_qspr, "scaleY");
					if(l_aval!=undefined)layer_sprite_yscale(l_rspr2,l_aval);
					l_aval=ds_map_find_value(l_qspr, "rotation");
					if(l_aval!=undefined)layer_sprite_angle(l_rspr2,l_aval);
					l_f=ds_map_find_value(l_qspr, "color");
					if(l_f<0)l_f+=4294967296.;
					if(l_f!=undefined){
						layer_sprite_blend(l_rspr2,(l_f&16777215));
						layer_sprite_alpha(l_rspr2,((l_f>>24)/255));
					}
					if(ds_map_find_value(l_qspr, "animationFPS")!=undefined)layer_sprite_speed(l_rspr2,live_room_loader_anim_speed(ds_map_find_value(l_qspr, "animationFPS"),ds_map_find_value(l_qspr, "animationSpeedType")));
				}
			}
			break;
		case "GMREffectLayer":
			if(live_room_loader_apply_filters){
				l_rl=layer_get_id(l_ql_name);
				if(l_rl==-1){
					l_rl=layer_create(l_ql_depth,l_ql_name);
					if(ds_map_find_value(l_ql, "visible")!=undefined)layer_set_visible(l_rl,ds_map_find_value(l_ql, "visible"));
				}
				if(l_ql_sublayers!=undefined&&l_ql_sublayers!=pointer_null){
					l_ql_sublayer_index=0;
					while(l_ql_sublayer_index<l_ql_sublayer_count){
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers,l_ql_sublayer_index++));
					}
				}
				var l_fxl=l_ql;
				l_s=ds_map_find_value(l_fxl, "effectType");
				if(l_s==undefined||l_s==pointer_null)exit;
				var l_fx1=fx_create(l_s);
				var l__g_list=ds_map_find_value(l_fxl, "properties");
				var l__g_index=0;
				while(l__g_index<ds_list_size(l__g_list)){
					var l_pp=ds_list_find_value(l__g_list,l__g_index++);
					switch(ds_map_find_value(l_pp, "type")){
						case 1:
							l_s=ds_map_find_value(l_pp, "value");
							if(string_ord_at(l_s,1)!=35)continue;
							l_f=real(int64(ptr(string_delete(l_s,1,1))));
							if(l_f<0)l_f+=4294967296.;
							fx_set_parameter(l_fx1,ds_map_find_value(l_pp, "name"),l_f%256/255,(l_f/256|0)%256/255,(l_f/65536|0)%256/255,(l_f/16777216|0)/255);
							break;
						case 0:
							l_f=real(ds_map_find_value(l_pp, "value"));
							fx_set_parameter(l_fx1,ds_map_find_value(l_pp, "name"),l_f);
							break;
						case 2:
							l_s=ds_map_find_value(l_pp, "value");
							if(l_s==undefined||l_s==pointer_null)continue;
							l_f=asset_get_index(l_s);
							if(l_f!=-1)fx_set_parameter(l_fx1,ds_map_find_value(l_pp, "name"),l_f);
							break;
						default:live_log_script("Unknown effect parameter type "+string(ds_map_find_value(l_pp, "type")),1);
					}
				}
				layer_set_fx(l_rl,l_fx1);
			}
			break;
		case "GMRPathLayer":break;
		default:show_debug_message("Unknown layer type "+gml_std_Std_stringify(ds_map_find_value(l_ql, "modelName")));
	}
}

if(live_enabled)
function live_room_loader_run_impl2(l_rm){
	// live_room_loader_run_impl2(rm:live_yy_YyRoom)
	/// @ignore
	live_log_script("Loading "+ds_map_find_value(l_rm, "name")+"...",0);
	ds_map_clear(live_room_loader_inst_map_gml);
	ds_map_clear(live_room_loader_inst_map_yy);
	if(live_room_loader_apply_settings){
		room_width=ds_map_find_value(ds_map_find_value(l_rm, "roomSettings"), "Width");
		room_height=ds_map_find_value(ds_map_find_value(l_rm, "roomSettings"), "Height");
		live_room_loader_init_physics(ds_map_find_value(l_rm, "physicsSettings"));
	}
	var l_aval;
	if(live_room_loader_apply_views){
		l_aval=ds_map_find_value(ds_map_find_value(l_rm, "viewSettings"), "enableViews");
		if(l_aval!=undefined)view_enabled=l_aval; else view_enabled=false;
		var l_qvs=ds_map_find_value(l_rm, "views");
		if(l_qvs!=undefined){
			for(var l_i=0,l__g1=ds_list_size(l_qvs);l_i<l__g1;l_i++){
				var l_qv=ds_list_find_value(l_qvs,l_i);
				if(l_qv==undefined)continue;
				var l_rv=l_i;
				l_aval=ds_map_find_value(l_qv, "visible");
				if(l_aval!=undefined)view_visible[l_rv]=l_aval; else view_visible[l_rv]=false;
				l_aval=ds_map_find_value(l_qv, "xport");
				if(l_aval!=undefined)view_xport[l_rv]=l_aval; else view_xport[l_rv]=0;
				l_aval=ds_map_find_value(l_qv, "yport");
				if(l_aval!=undefined)view_yport[l_rv]=l_aval; else view_yport[l_rv]=0;
				l_aval=ds_map_find_value(l_qv, "wport");
				if(l_aval!=undefined)view_wport[l_rv]=l_aval; else view_wport[l_rv]=1024;
				l_aval=ds_map_find_value(l_qv, "hport");
				if(l_aval!=undefined)view_hport[l_rv]=l_aval; else view_hport[l_rv]=768;
				var l_rc=view_camera[l_rv];
				var l_vx,l_vy;
				l_vx=ds_map_find_value(l_qv, "xview");
				if(l_vx==undefined)l_vx=0;
				l_vy=ds_map_find_value(l_qv, "yview");
				if(l_vy==undefined)l_vy=0;
				camera_set_view_pos(l_rc,live_room_loader_room_x+l_vx,live_room_loader_room_y+l_vy);
				l_vx=ds_map_find_value(l_qv, "wview");
				if(l_vx==undefined)l_vx=1024;
				l_vy=ds_map_find_value(l_qv, "hview");
				if(l_vy==undefined)l_vy=768;
				camera_set_view_size(l_rc,l_vx,l_vy);
				l_aval=ds_map_find_value(l_qv, "obj");
				if(l_aval!=undefined)camera_set_view_target(l_rc,asset_get_index(l_aval));
				l_vx=ds_map_find_value(l_qv, "hspeed");
				if(l_vx==undefined)l_vx=-1;
				l_vy=ds_map_find_value(l_qv, "vspeed");
				if(l_vy==undefined)l_vy=-1;
				camera_set_view_speed(l_rc,l_vx,l_vy);
				l_vx=ds_map_find_value(l_qv, "hborder");
				if(l_vx==undefined)l_vx=32;
				l_vy=ds_map_find_value(l_qv, "vborder");
				if(l_vy==undefined)l_vy=32;
				camera_set_view_border(l_rc,l_vx,l_vy);
			}
		}
	}
	var l_lrs=ds_map_find_value(l_rm, "layers");
	var l_lrk=ds_list_size(l_lrs);
	for(var l_lri=0,l__g1=ds_list_size(l_lrs);l_lri<l__g1;l_lri++){
		live_room_loader_add_layer(ds_list_find_value(l_lrs,l_lrk));
	}
	var l__g_list=ds_map_find_value(l_rm, "instanceCreationOrderIDs");
	var l__g_index=0;
	while(l__g_index<ds_list_size(l__g_list)){
		var l_id=ds_list_find_value(l__g_list,l__g_index++);
		var l_qinst=ds_map_find_value(live_room_loader_inst_map_yy,l_id);
		if(l_qinst==undefined){
			live_log_script(l_id+" is in instanceCreationOrderIDs but no instance exists.",1);
			continue;
		}
		live_room_loader_run_yy_inst_cc(ds_map_find_value(live_room_loader_inst_map_gml,l_id),l_qinst);
	}
	ds_map_clear(live_room_loader_inst_map_gml);
	ds_map_clear(live_room_loader_inst_map_yy);
	var l_s=ds_map_find_value(l_rm, "creationCode");
	if(l_s!=undefined&&l_s!="")live_room_loader_run_cc(l_s,ds_map_find_value(l_rm, "name")+":CreationCode");
}

function live_room_start(){
	/// live_room_start()
	/// @returns {void}
	if(live_enabled){
		var l_rq=live_live_room;
		if(!room_exists(l_rq))show_error("No live room was specified.",true);
		var l_rd=ds_map_find_value(live_live_room_data,l_rq);
		if(l_rd==undefined){
			live_log_script(("Warning: no live data had been received yet for "+room_get_name(l_rq)+", transitioning to the regular version."),1);
			room_goto(l_rq);
			exit;
		}
		var l_rm2=json_decode(l_rd);
		live_room_loader_run_impl2(l_rm2);
		ds_map_destroy(l_rm2);
	}
}

if(live_enabled)
function live_bits_gmlive_indexer_add_assets(){
	// live_bits_gmlive_indexer_add_assets()
	/// @ignore
	var l_s;
	var l_i=0;
	while(sprite_exists(l_i)){
		gml_asset_add(sprite_get_name(l_i),l_i);
		l_i++;
	}
	for(l_i=0;font_exists(l_i);l_i++){
		gml_asset_add(font_get_name(l_i),l_i);
	}
	for(l_i=0;object_exists(l_i);l_i++){
		gml_asset_add(object_get_name(l_i),l_i);
	}
	for(l_i=0;audio_exists(l_i);l_i++){
		gml_asset_add(audio_get_name(l_i),l_i);
	}
	for(l_i=0;l_i<1024&&string_ord_at(tileset_get_name(l_i),1)!=60;l_i++){
		gml_asset_add(tileset_get_name(l_i),l_i);
	}
	for(l_i=0;room_exists(l_i);l_i++){
		gml_asset_add(room_get_name(l_i),l_i);
	}
	for(l_i=0;path_exists(l_i);l_i++){
		gml_asset_add(path_get_name(l_i),l_i);
	}
	for(l_i=0;timeline_exists(l_i);l_i++){
		gml_asset_add(timeline_get_name(l_i),l_i);
	}
	for(l_i=0;l_i<256;l_i++){
		l_s=audio_group_name(l_i);
		if(l_s=="<undefined>"||l_s==""||l_s==undefined)break;
		gml_asset_add(l_s,l_i);
	}
}

if(live_enabled)
function live_bits_gmlive_indexer_add_scripts(){
	// live_bits_gmlive_indexer_add_scripts()
	/// @ignore
	var l_start=100000;
	for(var l_k=l_start,l__g1=l_start+100000;l_k<l__g1;l_k++){
		if(!script_exists(l_k))break;
		var l_name=script_get_name(l_k);
		if(string_ord_at(l_name,1)==60)continue;
		if(variable_struct_exists(gml_func_map,l_name))continue;
		if(asset_get_index(l_name)!=l_k)continue;
		var l_f=new gml_func();
		l_f.h_init_mystery(l_name,l_k);
		variable_struct_set(gml_func_map,l_name,l_f);
	}
}

if(live_enabled)
function live_bits_gmlive_ready_run(){
	// live_bits_gmlive_ready_run()
	/// @ignore
	vm_gml_thread_exec_slice_funcs=vm_gml_thread_exec_slice_init();
	vm_impl_gml_thread_construct_funcs=vm_impl_gml_thread_construct_init();
	vm_group_op_funcs=vm_group_op_impl();
	vm_v2_gml_thread_v2_handlers=vm_v2_gml_thread_v2_handlers_init();
}

if(live_enabled)
function gml_link(l_value,l_next)constructor{
	// gml_link(value:T, next:gml_link<T>)
	/// @ignore
	static h_value=undefined; /// @is {T}
	static h_next=undefined; /// @is {gml_link<T>}
	self.h_value=l_value;
	self.h_next=l_next;
	//
}

if(live_enabled)
function gml_action_list_print_action_value(l_v){
	// gml_action_list_print_action_value(v:any)->string
	/// @ignore
	if(l_v==undefined){
		return "null";
	} else if(is_numeric(l_v)){
		if(!is_real(l_v)||sign(frac(l_v))==0)return string(l_v); else return json_stringify(l_v);
	} else if(is_string(l_v)){
		return json_stringify(l_v);
	} else {
		if(is_struct(l_v)&&variable_struct_exists(l_v,"dump"))return l_v.dump();
		return gml_std_Std_stringify(l_v);
	}
}

if(live_enabled)
function gml_action_list_print_action_get_func_name(l_func){
	// gml_action_list_print_action_get_func_name(func:any)->string
	/// @ignore
	var l_label=undefined;
	var l_name;
	if(is_method(l_func)){
		var l_scr=method_get_index(l_func);
		l_name=script_get_name(l_scr);
		l_label=ds_map_find_value(gml_func_name,l_scr);
	} else if(is_numeric(l_func)&&script_exists(l_func)){
		l_name=script_get_name(l_func);
		l_label=ds_map_find_value(gml_func_name,l_func);
	} else l_name=string(l_func);
	if(l_label==undefined||l_label==l_name)return l_name; else return l_label+"@"+l_name;
}

if(live_enabled)
function gml_action_list_print_action(l_act){
	// gml_action_list_print_action(act:gml_action)->string
	/// @ignore
	var l_pos=gml_std_haxe_enum_tools_getParameter(l_act,0);
	var l_pre="L"+string(l_pos[1])+"\tc"+string(l_pos[2])+"\t";
	var l_r=l_pre+gml_std_Type_enumConstructor(l_act);
	switch(l_act.__enumIndex__){
		case 123:return l_pre+("{ tag : \""+l_act.h_tag+"\",")+string_delete(string(l_act.h_ctx),1,1);
		case 63:return l_r+"("+l_act.h_script.h_name+", "+string(l_act.h_argc)+")";
		case 9:return l_r+"("+gml_std_gml_internal_ArrayImpl_join(l_act.h_fields,",")+")";
		case 42:return l_r+"(\""+gml_action_list_print_action_get_func_name(l_act.h_f)+"\", \""+gml_action_list_print_action_get_func_name(l_act.h_ch)+"\")";
		case 41:return l_r+"(\""+gml_action_list_print_action_get_func_name(l_act.h_f)+"\")";
		case 66:
			var l_args1=l_act.h_args;
			l_r+="(\""+gml_action_list_print_action_get_func_name(l_act.h_func)+"\", "+string(l_act.h_argc)+", [";
			var l_sep=false;
			var l__g=0;
			while(l__g<array_length(l_args1)){
				var l_f=l_args1[l__g];
				l__g++;
				if(l_sep)l_r+=","; else l_sep=true;
				l_r+=script_get_name(l_f);
			}
			l_r+="], "+script_get_name(l_act.h_rest)+(", "+gml_std_Std_stringify(l_act.h_inst)+", "+(string(l_act.h_out))+")");
			return l_r;
		case 97:return l_r+"(jt: "+vm__gml_value_map_gml_value_map_impl__print(l_act.h_jumptable)+", default: "+string(l_act.h_defaultPos)+")";
		case 67:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 68:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 69:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 70:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 71:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 72:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 73:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 74:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 75:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 76:return l_r+"(func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 77:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 78:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 79:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 80:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 81:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 82:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 83:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 84:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 85:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
		case 86:return l_r+"(ind: "+string(l_act.h_local)+", func: "+gml_action_list_print_action_get_func_name(l_act.h_func)+")";
	}
	if(is_struct(l_act)){
		var l_enumParams=l_act.__enumParams__;
		var l_argc=array_length(l_enumParams);
		if(l_argc>1){
			l_r+="(";
			for(var l_k=1;l_k<l_argc;l_k++){
				if(l_k>1)l_r+=", ";
				var l_f=l_enumParams[l_k];
				l_r+=l_f+": "+gml_action_list_print_action_value(variable_struct_get(l_act,l_f));
			}
			l_r+=")";
		}
		return l_r;
	}
	var l_argc=gml_std_haxe_enum_tools_getParameterCount(l_act);
	if(l_argc>1){
		l_r+="(";
		for(var l_k=1;l_k<l_argc;l_k++){
			if(l_k>1)l_r+=", ";
			l_r+=gml_action_list_print_action_value(gml_std_haxe_enum_tools_getParameter(l_act,l_k));
		}
		l_r+=")";
	}
	return l_r;
}

if(live_enabled)
function gml_action_list_print(l_this1){
	// gml_action_list_print(this:ds_list<gml_action>)->string
	/// @ignore
	var l_r=new gml_std_StringBuf();
	for(var l_i=0,l__g1=ds_list_size(l_this1);l_i<l__g1;l_i++){
		var l_act=ds_list_find_value(l_this1,l_i);
		if(l_i>0)l_r.h_addChar(10);
		var l_actStr=gml_action_list_print_action(l_act);
		l_act.__string__=l_actStr;
		l_r.h_add(l_i);
		l_r.h_addChar(9);
		l_r.h_add(l_actStr);
	}
	return l_r.h_toString();
}

if(live_enabled)
function gml_thread_scope_create(l_actions,l_offset,l_args1,l_locals,l_self1,l_other1,l_next,l_program){
	// gml_thread_scope_create(actions:gml_action_list, offset:int, args:array<any>, locals:array<any>, self:any, other:any, next:gml_thread_scope, program:gml_program)
	/// @ignore
	var l_this=[mt_gml_thread_scope];
	array_copy(l_this,1,mq_gml_thread_scope,1,10);
	/// @typedef {tuple<any,actions:gml_action_list,offset:int,args:array<any>,locals:array<any>,stack:gml_stack<any>,inst:gml_stack<any>,with:gml_with_scope,xhdl:gml_link<int>,program:gml_program,next:gml_thread_scope>} gml_thread_scope
	l_this[@8]=undefined;
	l_this[@7]=undefined;
	l_this[@5]=array_create(16);
	l_this[@1]=l_actions;
	l_this[@2]=l_offset;
	l_this[@3]=l_args1;
	l_this[@4]=l_locals;
	l_this[@9]=l_program;
	l_this[@6]=[2,l_other1,l_self1];
	l_this[@10]=l_next;
	return l_this;
}

if(live_enabled)
function vm_gml_thread_exec_slice_longcall(l_fn,l_arr,l_ofs,l_argc){
	// vm_gml_thread_exec_slice_longcall(fn:any, arr:array<any>, ofs:int, argc:int)->any
	/// @ignore
	if(is_method(l_fn)){
		var l_scr=method_get_index(l_fn);
		var l_me=method_get_self(l_fn);
		if(l_me==undefined)return script_execute_ext(l_scr,l_arr,l_ofs,l_argc); else with (l_me) return script_execute_ext(l_scr,l_arr,l_ofs,l_argc);
		gml_thread_error("Instance that the function is bound to no longer exists");
		return undefined;
	} else return script_execute_ext(l_fn,l_arr,l_ofs,l_argc);
}

if(live_enabled)
function vm_gml_thread_exec_slice_init(){
	// vm_gml_thread_exec_slice_init()->array<function<f:any;w:array<any>;i:int;any>>
	/// @ignore
	return [vm_gml_thread_exec_slice_with0,vm_gml_thread_exec_slice_with1,vm_gml_thread_exec_slice_with2,vm_gml_thread_exec_slice_with3,vm_gml_thread_exec_slice_with4,vm_gml_thread_exec_slice_with5,vm_gml_thread_exec_slice_with6,vm_gml_thread_exec_slice_with7,vm_gml_thread_exec_slice_with8,vm_gml_thread_exec_slice_with9,vm_gml_thread_exec_slice_with10,vm_gml_thread_exec_slice_with11,vm_gml_thread_exec_slice_with12,vm_gml_thread_exec_slice_with13,vm_gml_thread_exec_slice_with14,vm_gml_thread_exec_slice_with15,vm_gml_thread_exec_slice_with16,vm_gml_thread_exec_slice_with17,vm_gml_thread_exec_slice_with18,vm_gml_thread_exec_slice_with19,vm_gml_thread_exec_slice_with20,vm_gml_thread_exec_slice_with21,vm_gml_thread_exec_slice_with22,vm_gml_thread_exec_slice_with23,vm_gml_thread_exec_slice_with24,vm_gml_thread_exec_slice_with25,vm_gml_thread_exec_slice_with26,vm_gml_thread_exec_slice_with27,vm_gml_thread_exec_slice_with28,vm_gml_thread_exec_slice_with29,vm_gml_thread_exec_slice_with30,vm_gml_thread_exec_slice_with31,vm_gml_thread_exec_slice_with32,vm_gml_thread_exec_slice_with33,vm_gml_thread_exec_slice_with34,vm_gml_thread_exec_slice_with35,vm_gml_thread_exec_slice_with36,vm_gml_thread_exec_slice_with37,vm_gml_thread_exec_slice_with38,vm_gml_thread_exec_slice_with39,vm_gml_thread_exec_slice_with40,vm_gml_thread_exec_slice_with41,vm_gml_thread_exec_slice_with42,vm_gml_thread_exec_slice_with43,vm_gml_thread_exec_slice_with44,vm_gml_thread_exec_slice_with45,vm_gml_thread_exec_slice_with46,vm_gml_thread_exec_slice_with47,vm_gml_thread_exec_slice_with48,vm_gml_thread_exec_slice_with49,vm_gml_thread_exec_slice_with50,vm_gml_thread_exec_slice_with51,vm_gml_thread_exec_slice_with52,vm_gml_thread_exec_slice_with53,vm_gml_thread_exec_slice_with54,vm_gml_thread_exec_slice_with55,vm_gml_thread_exec_slice_with56,vm_gml_thread_exec_slice_with57,vm_gml_thread_exec_slice_with58,vm_gml_thread_exec_slice_with59,vm_gml_thread_exec_slice_with60,vm_gml_thread_exec_slice_with61,vm_gml_thread_exec_slice_with62,vm_gml_thread_exec_slice_with63,vm_gml_thread_exec_slice_with64,vm_gml_thread_exec_slice_with65,vm_gml_thread_exec_slice_with66,vm_gml_thread_exec_slice_with67,vm_gml_thread_exec_slice_with68,vm_gml_thread_exec_slice_with69,vm_gml_thread_exec_slice_with70,vm_gml_thread_exec_slice_with71,vm_gml_thread_exec_slice_with72,vm_gml_thread_exec_slice_with73,vm_gml_thread_exec_slice_with74,vm_gml_thread_exec_slice_with75,vm_gml_thread_exec_slice_with76,vm_gml_thread_exec_slice_with77,vm_gml_thread_exec_slice_with78,vm_gml_thread_exec_slice_with79,vm_gml_thread_exec_slice_with80];
}

if(live_enabled)
function vm_gml_thread_exec_slice_with0(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with0(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f();
}

if(live_enabled)
function vm_gml_thread_exec_slice_with1(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with1(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with2(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with2(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with3(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with3(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with4(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with4(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with5(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with5(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with6(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with6(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with7(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with7(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with8(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with8(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with9(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with9(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with10(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with10(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with11(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with11(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with12(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with12(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with13(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with13(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with14(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with14(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with15(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with15(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with16(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with16(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with17(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with17(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with18(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with18(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with19(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with19(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with20(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with20(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with21(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with21(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with22(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with22(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with23(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with23(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with24(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with24(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with25(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with25(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with26(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with26(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with27(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with27(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with28(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with28(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with29(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with29(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with30(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with30(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with31(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with31(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with32(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with32(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with33(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with33(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with34(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with34(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with35(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with35(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with36(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with36(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with37(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with37(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with38(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with38(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with39(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with39(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with40(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with40(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with41(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with41(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with42(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with42(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with43(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with43(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with44(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with44(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with45(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with45(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with46(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with46(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with47(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with47(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with48(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with48(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with49(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with49(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with50(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with50(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with51(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with51(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with52(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with52(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with53(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with53(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with54(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with54(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with55(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with55(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with56(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with56(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with57(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with57(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with58(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with58(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with59(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with59(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with60(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with60(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with61(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with61(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with62(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with62(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with63(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with63(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with64(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with64(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with65(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with65(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with66(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with66(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with67(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with67(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with68(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with68(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with69(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with69(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with70(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with70(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with71(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with71(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with72(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with72(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with73(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with73(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with74(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with74(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with75(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with75(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with76(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with76(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with77(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with77(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with78(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with78(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76],l_w[l_i+77]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with79(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with79(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76],l_w[l_i+77],l_w[l_i+78]);
}

if(live_enabled)
function vm_gml_thread_exec_slice_with80(l_f,l_w,l_i){
	// vm_gml_thread_exec_slice_with80(f:any, w:array<any>, i:int)->any
	/// @ignore
	return l_f(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76],l_w[l_i+77],l_w[l_i+78],l_w[l_i+79]);
}

if(live_enabled)
function gml_type_check_init(){
	// gml_type_check_init()->tools_Dictionary<gml_type_check>
	/// @ignore
	var l_r={}
	variable_struct_set(l_r,"any",gml_type_check_any);
	variable_struct_set(l_r,"bool",gml_type_check_number);
	variable_struct_set(l_r,"number",gml_type_check_number);
	variable_struct_set(l_r,"?number",gml_type_check_z_number);
	variable_struct_set(l_r,"float",gml_type_check_number);
	variable_struct_set(l_r,"?float",gml_type_check_z_number);
	variable_struct_set(l_r,"real",gml_type_check_number);
	variable_struct_set(l_r,"?real",gml_type_check_z_number);
	variable_struct_set(l_r,"color",gml_type_check_number);
	variable_struct_set(l_r,"date",gml_type_check_number);
	variable_struct_set(l_r,"int",gml_type_check_int);
	variable_struct_set(l_r,"index",gml_type_check_index);
	variable_struct_set(l_r,"id",gml_type_check_index);
	variable_struct_set(l_r,"sprite",gml_type_check_index);
	variable_struct_set(l_r,"background",gml_type_check_index);
	variable_struct_set(l_r,"sound",gml_type_check_index);
	variable_struct_set(l_r,"font",gml_type_check_index);
	variable_struct_set(l_r,"script",gml_type_check_index);
	variable_struct_set(l_r,"shader",gml_type_check_index);
	variable_struct_set(l_r,"timeline",gml_type_check_index);
	variable_struct_set(l_r,"object",gml_type_check_index);
	variable_struct_set(l_r,"room",gml_type_check_index);
	variable_struct_set(l_r,"buffer",gml_type_check_index);
	variable_struct_set(l_r,"list",gml_type_check_index);
	variable_struct_set(l_r,"grid",gml_type_check_index);
	variable_struct_set(l_r,"string",gml_type_check_string);
	variable_struct_set(l_r,"?string",gml_type_check_z_string);
	variable_struct_set(l_r,"array",gml_type_check_array);
	variable_struct_set(l_r,"?array",gml_type_check_z_array);
	variable_struct_set(l_r,"sprite",gml_type_check_index);
	variable_struct_set(l_r,"background",gml_type_check_index);
	variable_struct_set(l_r,"sound",gml_type_check_index);
	variable_struct_set(l_r,"font",gml_type_check_index);
	variable_struct_set(l_r,"path",gml_type_check_index);
	variable_struct_set(l_r,"timeline",gml_type_check_index);
	variable_struct_set(l_r,"script",gml_type_check_index);
	variable_struct_set(l_r,"object",gml_type_check_index);
	variable_struct_set(l_r,"room",gml_type_check_index);
	return l_r;
}

if(live_enabled)
function gml_type_check_any(l_v){
	// gml_type_check_any(v:any)->string
	/// @ignore
	return "";
}

if(live_enabled)
function gml_type_check_number(l_v){
	// gml_type_check_number(v:any)->string
	/// @ignore
	if(is_numeric(l_v))return "";
	return "Expected a number";
}

if(live_enabled)
function gml_type_check_int(l_v){
	// gml_type_check_int(v:any)->string
	/// @ignore
	if(is_real(l_v)&&l_v%1==0)return "";
	if(is_numeric(l_v))return "";
	if(is_string(l_v))return "";
	return "Expected an integer";
}

if(live_enabled)
function gml_type_check_index(l_v){
	// gml_type_check_index(v:any)->string
	/// @ignore
	if(is_real(l_v)&&l_v%1==0)return "";
	if(is_numeric(l_v))return "";
	if(is_string(l_v))return "";
	return "Expected an index";
}

if(live_enabled)
function gml_type_check_string(l_v){
	// gml_type_check_string(v:any)->string
	/// @ignore
	if(is_string(l_v))return "";
	if(is_numeric(l_v))return "";
	return "Expected a string";
}

if(live_enabled)
function gml_type_check_array(l_v){
	// gml_type_check_array(v:any)->string
	/// @ignore
	if(is_array(l_v))return "";
	return "Expected an array";
}

if(live_enabled)
function gml_type_check_z_number(l_v){
	// gml_type_check_z_number(v:any)->string
	/// @ignore
	if(l_v==undefined||is_numeric(l_v))return "";
	if(is_string(l_v))return "";
	return "Expected a number or null";
}

if(live_enabled)
function gml_type_check_z_string(l_v){
	// gml_type_check_z_string(v:any)->string
	/// @ignore
	if(l_v==undefined||is_string(l_v))return "";
	if(is_numeric(l_v))return "";
	return "Expected a string or null";
}

if(live_enabled)
function gml_type_check_z_array(l_v){
	// gml_type_check_z_array(v:any)->string
	/// @ignore
	if(l_v==undefined||is_array(l_v))return "";
	return "Expected an array or null";
}

if(live_enabled)
function gml_value_list_copy(l_this1){
	// gml_value_list_copy(this:array<any>)->array<any>
	/// @ignore
	var l_n=array_length(l_this1);
	var l_r=array_create(l_n);
	array_copy(l_r,0,l_this1,0,l_n);
	return l_r;
}

if(live_enabled)
function gml_value_list_pad_to_size_with_null(l_this1,l_newSize){
	// gml_value_list_pad_to_size_with_null(this:array<any>, newSize:int)
	/// @ignore
	var l_curSize=array_length(l_this1);
	if(l_curSize<l_newSize){
		array_resize(l_this1,l_newSize);
		while(l_curSize<l_newSize){
			l_this1[@l_curSize]=undefined;
			l_curSize++;
		}
	}
}

if(live_enabled)
function vm__gml_value_map_gml_value_map_impl__print(l_this1){
	// vm__gml_value_map_gml_value_map_impl__print(this:ds_map<any; T>)->string
	/// @ignore
	var l_r="{";
	var l_keys=ds_map_keys_to_array(l_this1);
	for(var l_i=0,l__g1=array_length(l_keys);l_i<l__g1;l_i++){
		var l_k=l_keys[l_i];
		if(l_i>0)l_r+=", "; else l_r+=" ";
		l_r+=gml_value_print(l_keys[l_i])+": "+gml_std_Std_stringify(ds_map_find_value(l_this1,l_k));
	}
	return l_r+" }";
}

if(live_enabled)
function gml_with_scope(l_data,l_nxt)constructor{
	// gml_with_scope(data:vm_GmlWithData, nxt:gml_with_scope)
	/// @ignore
	static h_index=undefined; /// @is {int}
	static h_length=undefined; /// @is {int}
	static h_array=undefined; /// @is {array<any>}
	static h_next=undefined; /// @is {gml_with_scope}
	static h_data=undefined; /// @is {vm_GmlWithData}
	self.h_index=0;
	self.h_data=l_data;
	self.h_length=l_data.length;
	self.h_array=l_data.items;
	self.h_next=l_nxt;
	static __class__=mt_gml_with_scope;
}

if(live_enabled)
function gml_with_scope_copy(l_q){
	// gml_with_scope_copy(q:gml_with_scope)->gml_with_scope
	/// @ignore
	if(l_q==undefined)return undefined;
	var l_q_data=l_q.h_data;
	l_q_data.refc++;
	var l_r=new gml_with_scope(l_q_data,gml_with_scope_copy(l_q.h_next));
	l_r.h_index=l_q.h_index;
	return l_r;
}

if(live_enabled)
function gml_with_scope_destroy(l_q){
	// gml_with_scope_destroy(q:gml_with_scope)
	/// @ignore
	while(l_q!=undefined){
		vm__gml_with_data_gml_with_data_impl__destroy(l_q.h_data);
		l_q=l_q.h_next;
	}
}

if(live_enabled)
function vm__gml_with_data_gml_with_data_impl__init(){
	// vm__gml_with_data_gml_with_data_impl__init()->array<ds_stack<array<any>>>
	/// @ignore
	var l_pools=array_create(5,undefined);
	l_pools[@0]=ds_stack_create();
	l_pools[@1]=ds_stack_create();
	l_pools[@2]=ds_stack_create();
	l_pools[@3]=ds_stack_create();
	l_pools[@4]=ds_stack_create();
	return l_pools;
}

if(live_enabled)
function vm__gml_with_data_gml_with_data_impl__alloc(l_size){
	// vm__gml_with_data_gml_with_data_impl__alloc(size:int)->array<any>
	/// @ignore
	var l_sln=(l_size>0?(log10(l_size)|0):0);
	if(l_sln>=5)return array_create(l_size);
	var l_pool=vm__gml_with_data_gml_with_data_impl__pools[l_sln];
	if(ds_stack_empty(l_pool))return array_create((power(10,l_sln)|0)); else return ds_stack_pop(l_pool);
}

if(live_enabled)
function vm__gml_with_data_gml_with_data_impl__destroy(l_this1){
	// vm__gml_with_data_gml_with_data_impl__destroy(this:vm_GmlWithDataImpl)
	/// @ignore
	if(--l_this1.refc!=0)exit;
	var l_size=l_this1.length;
	var l_sln=(l_size>0?(log10(l_size)|0):0);
	if(l_sln>=5)exit;
	ds_stack_push(vm__gml_with_data_gml_with_data_impl__pools[l_sln],l_this1.items);
}

if(live_enabled)
function gml_type_ref(l_name,l_path1)constructor{
	// gml_type_ref(name:string, path:string = "")
	/// @ignore
	static h_name=undefined; /// @is {string}
	static h_path=undefined; /// @is {string}
	if(l_path1==undefined)l_path1="";
	if(false)show_debug_message(argument[1]);
	self.h_name=l_name;
	self.h_path=l_path1;
	variable_struct_set(self,"",gml_type_ref_root);
	static __class__=mt_gml_type_ref;
}

if(live_enabled)
function gml_type_ref_init(){
	// gml_type_ref_init()->gml_type_ref
	/// @ignore
	gml_type_ref_root=undefined;
	var l_t=new gml_type_ref("typeref");
	variable_struct_set(l_t,"",l_t);
	return l_t;
}

if(live_enabled)
function vm_impl_gml_thread_construct_error(){
	// vm_impl_gml_thread_construct_error()->any?
	/// @ignore
	gml_thread_error("Calls only support up to "+string(81)+" arguments at this time");
	return undefined;
}

if(live_enabled)
function vm_impl_gml_thread_construct_init(){
	// vm_impl_gml_thread_construct_init()->array<function<f:any;w:array<any>;i:int;any>>
	/// @ignore
	return [vm_impl_gml_thread_construct_with0,vm_impl_gml_thread_construct_with1,vm_impl_gml_thread_construct_with2,vm_impl_gml_thread_construct_with3,vm_impl_gml_thread_construct_with4,vm_impl_gml_thread_construct_with5,vm_impl_gml_thread_construct_with6,vm_impl_gml_thread_construct_with7,vm_impl_gml_thread_construct_with8,vm_impl_gml_thread_construct_with9,vm_impl_gml_thread_construct_with10,vm_impl_gml_thread_construct_with11,vm_impl_gml_thread_construct_with12,vm_impl_gml_thread_construct_with13,vm_impl_gml_thread_construct_with14,vm_impl_gml_thread_construct_with15,vm_impl_gml_thread_construct_with16,vm_impl_gml_thread_construct_with17,vm_impl_gml_thread_construct_with18,vm_impl_gml_thread_construct_with19,vm_impl_gml_thread_construct_with20,vm_impl_gml_thread_construct_with21,vm_impl_gml_thread_construct_with22,vm_impl_gml_thread_construct_with23,vm_impl_gml_thread_construct_with24,vm_impl_gml_thread_construct_with25,vm_impl_gml_thread_construct_with26,vm_impl_gml_thread_construct_with27,vm_impl_gml_thread_construct_with28,vm_impl_gml_thread_construct_with29,vm_impl_gml_thread_construct_with30,vm_impl_gml_thread_construct_with31,vm_impl_gml_thread_construct_with32,vm_impl_gml_thread_construct_with33,vm_impl_gml_thread_construct_with34,vm_impl_gml_thread_construct_with35,vm_impl_gml_thread_construct_with36,vm_impl_gml_thread_construct_with37,vm_impl_gml_thread_construct_with38,vm_impl_gml_thread_construct_with39,vm_impl_gml_thread_construct_with40,vm_impl_gml_thread_construct_with41,vm_impl_gml_thread_construct_with42,vm_impl_gml_thread_construct_with43,vm_impl_gml_thread_construct_with44,vm_impl_gml_thread_construct_with45,vm_impl_gml_thread_construct_with46,vm_impl_gml_thread_construct_with47,vm_impl_gml_thread_construct_with48,vm_impl_gml_thread_construct_with49,vm_impl_gml_thread_construct_with50,vm_impl_gml_thread_construct_with51,vm_impl_gml_thread_construct_with52,vm_impl_gml_thread_construct_with53,vm_impl_gml_thread_construct_with54,vm_impl_gml_thread_construct_with55,vm_impl_gml_thread_construct_with56,vm_impl_gml_thread_construct_with57,vm_impl_gml_thread_construct_with58,vm_impl_gml_thread_construct_with59,vm_impl_gml_thread_construct_with60,vm_impl_gml_thread_construct_with61,vm_impl_gml_thread_construct_with62,vm_impl_gml_thread_construct_with63,vm_impl_gml_thread_construct_with64,vm_impl_gml_thread_construct_with65,vm_impl_gml_thread_construct_with66,vm_impl_gml_thread_construct_with67,vm_impl_gml_thread_construct_with68,vm_impl_gml_thread_construct_with69,vm_impl_gml_thread_construct_with70,vm_impl_gml_thread_construct_with71,vm_impl_gml_thread_construct_with72,vm_impl_gml_thread_construct_with73,vm_impl_gml_thread_construct_with74,vm_impl_gml_thread_construct_with75,vm_impl_gml_thread_construct_with76,vm_impl_gml_thread_construct_with77,vm_impl_gml_thread_construct_with78,vm_impl_gml_thread_construct_with79,vm_impl_gml_thread_construct_with80];
}

if(live_enabled)
function vm_impl_gml_thread_construct_with0(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with0(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c();
}

if(live_enabled)
function vm_impl_gml_thread_construct_with1(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with1(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with2(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with2(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with3(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with3(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with4(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with4(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with5(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with5(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with6(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with6(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with7(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with7(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with8(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with8(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with9(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with9(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with10(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with10(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with11(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with11(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with12(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with12(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with13(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with13(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with14(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with14(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with15(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with15(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with16(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with16(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with17(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with17(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with18(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with18(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with19(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with19(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with20(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with20(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with21(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with21(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with22(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with22(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with23(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with23(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with24(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with24(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with25(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with25(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with26(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with26(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with27(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with27(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with28(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with28(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with29(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with29(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with30(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with30(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with31(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with31(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with32(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with32(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with33(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with33(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with34(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with34(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with35(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with35(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with36(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with36(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with37(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with37(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with38(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with38(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with39(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with39(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with40(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with40(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with41(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with41(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with42(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with42(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with43(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with43(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with44(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with44(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with45(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with45(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with46(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with46(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with47(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with47(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with48(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with48(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with49(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with49(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with50(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with50(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with51(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with51(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with52(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with52(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with53(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with53(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with54(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with54(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with55(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with55(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with56(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with56(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with57(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with57(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with58(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with58(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with59(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with59(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with60(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with60(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with61(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with61(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with62(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with62(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with63(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with63(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with64(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with64(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with65(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with65(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with66(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with66(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with67(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with67(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with68(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with68(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with69(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with69(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with70(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with70(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with71(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with71(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with72(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with72(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with73(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with73(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with74(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with74(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with75(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with75(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with76(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with76(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with77(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with77(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with78(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with78(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76],l_w[l_i+77]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with79(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with79(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76],l_w[l_i+77],l_w[l_i+78]);
}

if(live_enabled)
function vm_impl_gml_thread_construct_with80(l_f,l_w,l_i){
	// vm_impl_gml_thread_construct_with80(f:any, w:array<any>, i:int)->any
	/// @ignore
	var l_c=l_f;
	return new l_c(l_w[l_i],l_w[l_i+1],l_w[l_i+2],l_w[l_i+3],l_w[l_i+4],l_w[l_i+5],l_w[l_i+6],l_w[l_i+7],l_w[l_i+8],l_w[l_i+9],l_w[l_i+10],l_w[l_i+11],l_w[l_i+12],l_w[l_i+13],l_w[l_i+14],l_w[l_i+15],l_w[l_i+16],l_w[l_i+17],l_w[l_i+18],l_w[l_i+19],l_w[l_i+20],l_w[l_i+21],l_w[l_i+22],l_w[l_i+23],l_w[l_i+24],l_w[l_i+25],l_w[l_i+26],l_w[l_i+27],l_w[l_i+28],l_w[l_i+29],l_w[l_i+30],l_w[l_i+31],l_w[l_i+32],l_w[l_i+33],l_w[l_i+34],l_w[l_i+35],l_w[l_i+36],l_w[l_i+37],l_w[l_i+38],l_w[l_i+39],l_w[l_i+40],l_w[l_i+41],l_w[l_i+42],l_w[l_i+43],l_w[l_i+44],l_w[l_i+45],l_w[l_i+46],l_w[l_i+47],l_w[l_i+48],l_w[l_i+49],l_w[l_i+50],l_w[l_i+51],l_w[l_i+52],l_w[l_i+53],l_w[l_i+54],l_w[l_i+55],l_w[l_i+56],l_w[l_i+57],l_w[l_i+58],l_w[l_i+59],l_w[l_i+60],l_w[l_i+61],l_w[l_i+62],l_w[l_i+63],l_w[l_i+64],l_w[l_i+65],l_w[l_i+66],l_w[l_i+67],l_w[l_i+68],l_w[l_i+69],l_w[l_i+70],l_w[l_i+71],l_w[l_i+72],l_w[l_i+73],l_w[l_i+74],l_w[l_i+75],l_w[l_i+76],l_w[l_i+77],l_w[l_i+78],l_w[l_i+79]);
}

if(live_enabled)
function vm_group_alarm_on_alarm(l_th,l_act,l_scope,l_st){
	// vm_group_alarm_on_alarm(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	l_st[@l_z]=l_st[l_z].alarm[l_st[l_z+1]];
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_alarm_on_alarm_set(l_th,l_act,l_scope,l_st){
	// vm_group_alarm_on_alarm_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=(l_z-1);
	l_st[l_z].alarm[l_st[l_z+1]] = l_st[l_z+2];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_alarm_on_alarm_aop(l_th,l_act,l_scope,l_st){
	// vm_group_alarm_on_alarm_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=(l_z-1);
	var l_a=l_st[l_z];
	var l_i=l_st[l_z+1];
	var l_v=l_a.alarm[l_i];
	l_v=vm_group_op_funcs[l_act.h_op](l_v,l_st[l_z+2]);
	l_a.alarm[l_i] = (l_v|0);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_count(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_count(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=array_length(l_scope[3]);
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_const(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_const(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_act.h_i;
	var l_args1=l_scope[3];
	if(l_i>=0&&l_i<array_length(l_args1)){
		var l_i1=l_st[0]+1;
		if(l_i1>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
		l_st[@l_i1]=l_args1[l_i];
		l_st[@0]=l_i1;
	} else return l_th.h_proc_error2("Argument index "+string(l_i)+" is out of range (0.."+string(array_length(l_args1))+")",l_act);
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_const_set(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_const_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_act.h_i;
	var l_args1=l_scope[3];
	if(l_i>=0&&l_i<array_length(l_args1)){
		var l_i1=l_st[0];
		var l_r=l_st[l_i1];
		l_st[@l_i1]=0;
		l_st[@0]=(l_i1-1);
		l_args1[@l_i]=l_r;
	} else return l_th.h_proc_error2("Argument index "+string(l_i)+" is out of range (0.."+string(array_length(l_args1))+")",l_act);
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_const_aop(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_const_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_o=l_act.h_o;
	var l_i=l_act.h_i;
	var l_args1=l_scope[3];
	if(l_i>=0&&l_i<array_length(l_args1)){
		var l_arg=l_args1[l_i];
		var l_i1=l_st[0];
		var l_val=l_st[l_i1];
		l_st[@l_i1]=0;
		l_st[@0]=(l_i1-1);
		l_val=vm_group_op_funcs[l_o](l_arg,l_val);
		l_args1[@l_i]=l_val;
	} else return l_th.h_proc_error2("Argument index "+string(l_i)+" is out of range (0.."+string(array_length(l_args1))+")",l_act);
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_index(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_index(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	var l_k=l_st[l_z];
	if(is_numeric(l_k)){
		var l_i=(l_k|0);
		var l_args1=l_scope[3];
		if(l_i>=0&&l_i<array_length(l_args1))l_st[@l_z]=l_args1[l_i]; else return l_th.h_proc_error2("Argument index "+string(l_i)+" is out of range (0.."+string(array_length(l_args1))+")",l_act);
	} else return l_th.h_proc_error2("Index is not a number",l_act);
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_index_set(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_index_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v,l_k;
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_k=l_st[l_z];
	l_v=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	if(is_numeric(l_k)){
		var l_i=(l_k|0);
		var l_args1=l_scope[3];
		if(l_i>=0&&l_i<array_length(l_args1))l_args1[@l_i]=l_v; else return l_th.h_proc_error2("Argument index "+string(l_i)+" is out of range (0.."+string(array_length(l_args1))+")",l_act);
	} else return l_th.h_proc_error2("Index is not a number",l_act);
	return 0;
}

if(live_enabled)
function vm_group_arg_on_arg_index_aop(l_th,l_act,l_scope,l_st){
	// vm_group_arg_on_arg_index_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_o=l_act.h_o;
	var l_v,l_k;
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_k=l_st[l_z];
	l_v=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	if(is_numeric(l_k)){
		var l_i=(l_k|0);
		var l_args1=l_scope[3];
		if(l_i>=0&&l_i<array_length(l_args1)){
			l_v=vm_group_op_funcs[l_o](l_args1[l_i],l_v);
			l_args1[@l_i]=l_v;
		} else return l_th.h_proc_error2("Argument index "+string(l_i)+" is out of range (0.."+string(array_length(l_args1))+")",l_act);
	} else return l_th.h_proc_error2("Index is not a number",l_act);
	return 0;
}

if(live_enabled)
function vm_group_array_on_index(l_th,l_act,l_scope,l_st){
	// vm_group_array_on_index(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	l_st[@l_z]=l_st[l_z][l_st[l_z+1]];
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_array_on_index_set(l_th,l_act,l_scope,l_st){
	// vm_group_array_on_index_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=(l_z-1);
	l_st[l_z][@l_st[l_z+1]]=l_st[l_z+2];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_array_on_index_aop(l_th,l_act,l_scope,l_st){
	// vm_group_array_on_index_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=(l_z-1);
	var l_a=l_st[l_z];
	var l_i=l_st[l_z+1];
	var l_v;
	l_a[@l_i]=vm_group_op_funcs[l_act.h_o](l_a[l_i],l_st[l_z+2]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_array_on_index2d(l_th,l_act,l_scope,l_st){
	// vm_group_array_on_index2d(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_a;
	var l_z=l_st[0]-2;
	l_st[@0]=l_z;
	l_a=l_st[l_z];
	l_st[@l_z]=l_a[l_st[l_z+1], l_st[l_z+2]];
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_array_on_index2d_set(l_th,l_act,l_scope,l_st){
	// vm_group_array_on_index2d_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_arr;
	var l_z=l_st[0]-3;
	l_st[@0]=(l_z-1);
	l_arr=l_st[l_z];
	l_arr[@l_st[l_z+1],l_st[l_z+2]]=l_st[l_z+3];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	l_st[@l_z+3]=0;
	return 0;
}

if(live_enabled)
function vm_group_array_on_index2d_aop(l_th,l_act,l_scope,l_st){
	// vm_group_array_on_index2d_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-3;
	l_st[@0]=(l_z-1);
	var l_a=l_st[l_z];
	var l_i=l_st[l_z+1];
	var l_k=l_st[l_z+2];
	l_a[@l_i,l_k]=vm_group_op_funcs[l_act.h_o](l_a[l_i, l_k],l_st[l_z+3]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	l_st[@l_z+3]=0;
	return 0;
}

if(live_enabled)
function vm_group_call_call_value(l_th,l_act,l_v1,l_argArray,l_argOffset,l_n){
	// vm_group_call_call_value(th:gml_thread, act:gml_action, v:any, argArray:array<any>, argOffset:int, n:int)->gml_thread_proc_result
	/// @ignore
	if(is_method(l_v1)){
		if(vm_v2_gml_thread_group_call_gml23_call_self_other_soft(l_th,l_act,l_v1,l_argArray,l_argOffset,l_n)){
			l_th.h_result=vm_group_call_call_func_result;
			return vm_group_call_call_func_status;
		} else return 1;
	}
	if(is_numeric(l_v1)){
		if(script_exists(l_v1)){
			if(vm_v2_gml_thread_group_call_gml23_call_self_other_soft(l_th,l_act,l_v1,l_argArray,l_argOffset,l_n)){
				l_th.h_result=vm_group_call_call_func_result;
				return vm_group_call_call_func_status;
			} else return 1;
		} else return l_th.h_proc_error2("Trying to call invalid script index "+gml_value_print(l_v1),l_act);
	} else return l_th.h_proc_error2("Script index must be a number, got "+gml_value_dump(l_v1),l_act);
}

if(live_enabled)
function vm_group_call_on_call_script(l_th,l_act,l_scope,l_st){
	// vm_group_call_on_call_script(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_scr=l_act.h_script;
	var l_n=l_act.h_argc;
	var l_arr=[];
	var l_k=l_st[0]-l_n;
	array_copy(l_arr,0,l_st,l_k+1,l_n);
	array_copy(l_st,l_k+1,gml_stack_fill_value_arr,0,l_n);
	l_st[@0]=l_k;
	var l_args1=l_arr;
	gml_value_list_pad_to_size_with_null(l_args1,l_scr.h_arguments);
	var l_inst=l_scope[6];
	l_th.h_scope=gml_thread_scope_create(l_scr.h_actions,0,l_args1,array_create(l_scr.h_locals),l_inst[l_inst[0]],l_inst[l_inst[0]-1],l_scope,l_scope[9]);
	return 3;
}

if(live_enabled)
function vm_group_call_on_call_script_id(l_th,l_act,l_scope,l_stack){
	// vm_group_call_on_call_script_id(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_n=l_act.h_argc;
	var l_v1=l_stack[l_stack[0]-l_n];
	var l_argOffset=l_stack[0]-l_n+1;
	l_stack[@0]=(l_stack[0]-(l_n+1));
	return vm_group_call_call_value(l_th,l_act,l_v1,l_stack,l_argOffset,l_n);
	return 0;
}

if(live_enabled)
function vm_group_call_on_call_field(l_th,l_act,l_scope,l_stack){
	// vm_group_call_on_call_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_s=l_act.h_field;
	var l_n=l_act.h_argc;
	var l_ctx=l_stack[l_stack[0]-l_n];
	var l_argOffset=l_stack[0]-l_n+1;
	var l_val=undefined;
	var l_notFound=true;
	if(typeof(l_ctx)=="ref"||is_numeric(l_ctx)&&l_ctx>=100000){
		l_val=variable_instance_get(l_ctx,l_s);
		if(l_val!=undefined||variable_instance_exists(l_ctx,l_s)){
			l_notFound=false;
		} else if(variable_instance_exists(l_ctx,"id")){
			return l_th.h_proc_error2("`"+gml_std_Std_stringify(l_ctx)+"` ("+object_get_name(l_ctx.object_index)+") does not have a variable `"+l_s+"`",l_act);
		}
	} else with (l_ctx) {
		l_val=variable_instance_get(self,l_s);
		if(l_val!=undefined||variable_instance_exists(self,l_s)){
			l_notFound=false;
			break;
		} else if(is_struct(l_ctx)&&instanceof(l_ctx)=="instance"){
			return l_th.h_proc_error2("`"+gml_std_Std_stringify(self)+"` ("+object_get_name(self.object_index)+") does not have a variable `"+l_s+"`",l_act);
		} else return l_th.h_proc_error2("`"+gml_std_Std_stringify(self)+"` does not have a variable `"+l_s+"`",l_act);
	}
	if(is_method(l_val)){
		if(method_get_self(l_val)==undefined)l_val=method(l_ctx,l_val);
		var l_this1=l_scope[6];
		var l_me=l_this1[l_this1[0]];
		with (l_me) if(gml_thread_allow_exceptions){
			var l_r=vm_group_call_call_value(l_th,l_act,l_val,l_stack,l_argOffset,l_n);
			gml_stack_discard_multi(l_stack,l_n+1);
			return l_r;
		} else try{
			var l_r1=vm_group_call_call_value(l_th,l_act,l_val,l_stack,l_argOffset,l_n);
			gml_stack_discard_multi(l_stack,l_n+1);
			return l_r1;
		}catch(l__g){
			var l_x=gml_std_haxe_Exception_caught(l__g).h_unwrap();
			gml_stack_discard_multi(l_stack,l_n+1);
			return l_th.h_proc_error2(l_x,l_act);
		}
	}
	if(gml_thread_allow_exceptions){
		var l_r=vm_group_call_call_value(l_th,l_act,l_val,l_stack,l_argOffset,l_n);
		gml_stack_discard_multi(l_stack,l_n+1);
		return l_r;
	} else try{
		var l_r=vm_group_call_call_value(l_th,l_act,l_val,l_stack,l_argOffset,l_n);
		gml_stack_discard_multi(l_stack,l_n+1);
		return l_r;
	}catch(l__g){
		var l_x=gml_std_haxe_Exception_caught(l__g).h_unwrap();
		gml_stack_discard_multi(l_stack,l_n+1);
		return l_th.h_proc_error2(l_x,l_act);
	}
	return 0;
}

if(live_enabled)
function vm_group_call_on_construct(l_th,l_act,l_scope,l_stack){
	// vm_group_call_on_construct(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__argc=l_act.h_argc;
	var l_args1=gml_stack_pop_multi(l_stack,l__argc+1);
	var l_v1=l_args1[0];
	if(is_numeric(l_v1)){
		if(!script_exists((l_v1|0)))return l_th.h_proc_error2(gml_value_print(l_v1)+" is not a valid script index.",l_act);
	} else if(is_method(l_v1)){
		var l_isCtr,l_ctx;
		if(gml_std_haxe_boot_isJS){
			l_ctx=method_get_self(l_v1);
			l_isCtr=is_struct(l_ctx)&&variable_struct_get(l_ctx,"live:isConstructor");
		} else {
			l_isCtr=method_get_index(l_v1)==vm_v2_gml_thread_group_func_literal_ctr_impl;
			l_ctx=(l_isCtr?method_get_self(l_v1):undefined);
		}
		if(l_isCtr){
			with (new vm_v2_GmlStructBase()) {
				gml_std_gml_internal_ArrayImpl_shift(l_args1);
				var l_args2=l_args1;
				var l_self1=self;
				var l_result;
				do {
					var l_ctx1=variable_struct_get(l_ctx,"live:context");
					var l_pg;
					if(l_ctx1!=undefined){
						var l_livedata=variable_struct_get(live_live_map,l_ctx1);
						if(l_livedata==undefined)show_error("Trying to call a nonexistent GMLive program: "+gml_std_Std_stringify(l_ctx1),true);
						l_pg=l_livedata[0];
						if(l_pg==undefined){
							live_log_script("Trying to call a broken GMLive program "+gml_std_Std_stringify(l_ctx1)+", returning undefined",2);
							l_result=undefined;
							break;
						}
					} else {
						l_pg=variable_struct_get(l_ctx,"live:program");
						if(l_pg==undefined)show_error("It would appear that you've re-bound a GMLive function to a different scope. Please use live_method() rather than method() to do so.",true);
					}
					live_custom_self=l_self1;
					live_custom_other=other;
					var l_th1=l_pg.h_call_v(variable_struct_get(l_ctx,"live:function"),l_args2,false);
					if(l_th1==undefined){
						l_result=undefined;
						break;
					}
					if(l_th1.h_status==3){
						l_result=l_th1.h_result;
					} else if(l_th1.h_status==4){
						live_log_script(("Runtime error: "+l_th1.h_get_error()),2);
						l_result=undefined;
					} else l_result=undefined;
				} until(true);
				l_th.h_result=self;
			}
			return 0;
		}
	} else return l_th.h_proc_error2(gml_value_print(l_v1)+" ("+gml_value_get_type(l_v1)+") is not a callable type.",l_act);
	if(vm_v2_gml_thread_group_call_gml23_call_construct(l_th,l_act,l_v1,l_args1,1,l__argc)){
		l_th.h_result=vm_group_call_call_func_result;
		return vm_group_call_call_func_status;
	} else return 1;
	return 0;
}

if(live_enabled)
function vm_group_call_on_call_script_with_array(l_th,l_act,l_scope,l_stack){
	// vm_group_call_on_call_script_with_array(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v1,l_arr;
	var l_z=l_stack[0]-1;
	l_stack[@0]=(l_z-1);
	l_v1=l_stack[l_z];
	l_arr=l_stack[l_z+1];
	l_stack[@l_z]=0;
	l_stack[@l_z+1]=0;
	if(is_array(l_arr))return vm_group_call_call_value(l_th,l_act,l_v1,l_arr,0,array_length(l_arr)); else return l_th.h_proc_error2("Expected an array with arguments, got "+gml_value_dump(l_arr),l_act);
	return 0;
}

if(live_enabled)
function vm_group_call_on_call_func(l_th,l_act,l_scope,l_stack){
	// vm_group_call_on_call_func(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__func=l_act.h_func;
	var l__argc=l_act.h_argc;
	var l__inst=l_act.h_inst;
	var l__out=l_act.h_out;
	var l_k=l_stack[0]-l__argc;
	l_stack[@0]=l_k;
	l_k++;
	if(vm_v2_gml_thread_group_call_gml23_funcs[l__inst+7](l_th,l_act,l__func,l_stack,l_k,l__argc)){
		if(l__out){
			var l_i=l_stack[0]+1;
			if(l_i>=array_length(l_stack))l_stack[@array_length(l_stack)*2]=0;
			l_stack[@l_i]=vm_group_call_call_func_result;
			l_stack[@0]=l_i;
		}
		return vm_group_call_call_func_status;
	} else return 1;
	return 0;
}

function vm_v2_GmlStructBase()constructor{
	/// vm_v2_GmlStructBase()
	if(live_enabled){
		
	}
	static __class__=mt_vm_v2_GmlStructBase;
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_init(){
	// vm_v2_gml_thread_group_call_gml23_init()->array<vm_v2_GmlThreadGroupCallGML_func>
	/// @ignore
	var l_arr=[];
	for(var l__=0,l__g1=3-(-7)+1;l__<l__g1;l__++){
		array_push(l_arr,vm_v2_gml_thread_group_call_gml23_call_unknown);
	}
	l_arr[@0+7]=vm_v2_gml_thread_group_call_gml23_call_basic;
	l_arr[@3+7]=vm_v2_gml_thread_group_call_gml23_call_self_other_soft;
	l_arr[@2+7]=vm_v2_gml_thread_group_call_gml23_call_self_other_soft;
	l_arr[@1+7]=vm_v2_gml_thread_group_call_gml23_call_self;
	l_arr[@-5+7]=vm_v2_gml_thread_group_call_gml23_call_raw;
	l_arr[@-6+7]=vm_v2_gml_thread_group_call_gml23_call_construct;
	return l_arr;
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_call_unknown(l_th,l_act,l_func,l_array1,l_arrOffset,l_argc){
	// vm_v2_gml_thread_group_call_gml23_call_unknown(th:gml_thread, act:gml_action, func:any, array:array<any>, arrOffset:int, argc:int)->bool
	/// @ignore
	vm_group_call_call_func_result=undefined;
	vm_group_call_call_func_status=l_th.h_proc_error2("Call type not supported",l_act);
	return false;
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_call_basic(l_th,l_act,l_func,l_array1,l_arrOffset,l_argc){
	// vm_v2_gml_thread_group_call_gml23_call_basic(th:gml_thread, act:gml_action, func:any, array:array<any>, arrOffset:int, argc:int)->bool
	/// @ignore
	vm_group_call_call_func_result=(l_argc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_gml_thread_exec_slice_longcall(l_func,l_array1,l_arrOffset,l_argc));
	vm_group_call_call_func_status=0;
	return true;
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_call_self_other_soft(l_th,l_act,l_func,l_array1,l_arrOffset,l_argc){
	// vm_v2_gml_thread_group_call_gml23_call_self_other_soft(th:gml_thread, act:gml_action, func:any, array:array<any>, arrOffset:int, argc:int)->bool
	/// @ignore
	var l_inst=l_th.h_scope[6];
	var l__other=l_inst[l_inst[0]-1];
	var l__self=l_inst[l_inst[0]];
	var l_val=l__self;
	if(!(instanceof(l_val)=="instance"||is_struct(l_val)||is_numeric(l_val)||typeof(l_val)=="ref")){
		vm_group_call_call_func_result=(l_argc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_gml_thread_exec_slice_longcall(l_func,l_array1,l_arrOffset,l_argc));
		vm_group_call_call_func_status=0;
		return true;
	}
	var l_val=l__other;
	if(!(instanceof(l_val)=="instance"||is_struct(l_val)||is_numeric(l_val)||typeof(l_val)=="ref")){
		with (l__self) {
			vm_group_call_call_func_result=(l_argc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_gml_thread_exec_slice_longcall(l_func,l_array1,l_arrOffset,l_argc));
			vm_group_call_call_func_status=0;
			return true;
		}
		return l_th.h_proc_error("Can't call instance-specific function - instance `"+gml_value_print(l_inst[l_inst[0]])+("` ("+gml_value_get_type(l_inst[l_inst[0]])+") does not exist."),l_act);
	}
	with (l__other) with (l__self) {
		vm_group_call_call_func_result=(l_argc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_gml_thread_exec_slice_longcall(l_func,l_array1,l_arrOffset,l_argc));
		vm_group_call_call_func_status=0;
		return true;
	}
	with (l__self) {
		vm_group_call_call_func_result=(l_argc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_gml_thread_exec_slice_longcall(l_func,l_array1,l_arrOffset,l_argc));
		vm_group_call_call_func_status=0;
		return true;
	}
	return l_th.h_proc_error("Can't call instance-specific function - instance `"+gml_value_print(l_inst[l_inst[0]])+("` ("+gml_value_get_type(l_inst[l_inst[0]])+") does not exist."),l_act);
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_call_self(l_th,l_act,l_func,l_array1,l_arrOffset,l_argc){
	// vm_v2_gml_thread_group_call_gml23_call_self(th:gml_thread, act:gml_action, func:any, array:array<any>, arrOffset:int, argc:int)->bool
	/// @ignore
	var l_inst=l_th.h_scope[6];
	with (l_inst[l_inst[0]]) {
		vm_group_call_call_func_result=(l_argc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_gml_thread_exec_slice_longcall(l_func,l_array1,l_arrOffset,l_argc));
		vm_group_call_call_func_status=0;
		return true;
	}
	return l_th.h_proc_error("Can't call instance-specific function - instance `"+gml_value_print(l_inst[l_inst[0]])+("` ("+gml_value_get_type(l_inst[l_inst[0]])+") does not exist."),l_act);
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_call_construct(l_th,l_act,l_func,l_array1,l_arrOffset,l_argc){
	// vm_v2_gml_thread_group_call_gml23_call_construct(th:gml_thread, act:gml_action, func:any, array:array<any>, arrOffset:int, argc:int)->bool
	/// @ignore
	vm_group_call_call_func_status=0;
	var l_inst=l_th.h_scope[6];
	with (l_inst[l_inst[0]]) {
		vm_group_call_call_func_result=(l_argc<81?script_execute(vm_impl_gml_thread_construct_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_impl_gml_thread_construct_error());
		return true;
	}
	vm_group_call_call_func_result=(l_argc<81?script_execute(vm_impl_gml_thread_construct_funcs[l_argc],l_func,l_array1,l_arrOffset):vm_impl_gml_thread_construct_error());
	return true;
}

if(live_enabled)
function vm_v2_gml_thread_group_call_gml23_call_raw(l_th,l_act,l_func,l_array1,l_arrOffset,l_argc){
	// vm_v2_gml_thread_group_call_gml23_call_raw(th:gml_thread, act:gml_action, func:any, array:array<any>, arrOffset:int, argc:int)->bool
	/// @ignore
	l_th.h_result=undefined;
	vm_group_call_call_func_result=undefined;
	vm_group_call_call_func_status=l_func(l_array1,l_arrOffset,l_argc);
	return true;
}

if(live_enabled)
function vm_group_ensure_plus_on_ensure_array_for_local(l_th,l_act,l_scope,l_st){
	// vm_group_ensure_plus_on_ensure_array_for_local(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_ind=l_act.h_ind;
	var l_locals=l_scope[4];
	var l_val=l_locals[l_ind];
	if(!is_array(l_val)){
		l_val=[];
		l_locals[@l_ind]=l_val;
	}
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_val;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_ensure_plus_on_ensure_array_for_global(l_th,l_act,l_scope,l_st){
	// vm_group_ensure_plus_on_ensure_array_for_global(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_name=l_act.h_name;
	var l_val=variable_global_get(l_name);
	if(!is_array(l_val)){
		l_val=[];
		variable_global_set(l_name,l_val);
	}
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_val;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_ensure_plus_on_ensure_array_for_field(l_th,l_act,l_scope,l_st){
	// vm_group_ensure_plus_on_ensure_array_for_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_name=l_act.h_field;
	var l_z=l_st[0];
	var l_obj=l_st[l_z];
	var l_val=variable_instance_get(l_obj,l_name);
	if(!is_array(l_val)){
		l_val=[];
		variable_instance_set(l_obj,l_name,l_val);
	}
	l_st[@l_z]=l_val;
	return 0;
}

if(live_enabled)
function vm_group_ensure_plus_on_ensure_array_for_index(l_th,l_act,l_scope,l_st){
	// vm_group_ensure_plus_on_ensure_array_for_index(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	var l_arr=l_st[l_z];
	var l_ind=l_st[l_z+1];
	var l_val;
	if(l_ind<array_length(l_arr)){
		l_val=l_arr[l_ind];
		if(!is_array(l_val)){
			l_val=[];
			l_arr[@l_ind]=l_val;
		}
	} else {
		l_val=[];
		l_arr[@l_ind]=l_val;
	}
	l_st[@l_z]=l_val;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_ensure_plus_on_ensure_array_for_index2d(l_th,l_act,l_scope,l_st){
	// vm_group_ensure_plus_on_ensure_array_for_index2d(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=l_z;
	var l_arr=l_st[l_z];
	var l_val;
	var l_ind=l_st[l_z+1];
	if(l_ind<array_length(l_arr)){
		l_val=l_arr[l_ind];
		if(!is_array(l_val)){
			l_val=[];
			l_arr[@l_ind]=l_val;
		}
	} else {
		l_val=[];
		l_arr[@l_ind]=l_val;
	}
	l_arr=l_val;
	var l_ind=l_st[l_z+2];
	if(l_ind<array_length(l_arr)){
		l_val=l_arr[l_ind];
		if(!is_array(l_val)){
			l_val=[];
			l_arr[@l_ind]=l_val;
		}
	} else {
		l_val=[];
		l_arr[@l_ind]=l_val;
	}
	l_arr=l_val;
	l_st[@l_z]=l_val;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_env_on_env(l_th,l_act,l_scope,l_st){
	// vm_group_env_on_env(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=l_act.h_f(false,undefined);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_env_on_env_set(l_th,l_act,l_scope,l_st){
	// vm_group_env_on_env_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	l_act.h_f(true,l_r);
	return 0;
}

if(live_enabled)
function vm_group_env_on_env_aop(l_th,l_act,l_scope,l_st){
	// vm_group_env_on_env_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_op=l_act.h_o;
	var l_fn=l_act.h_f;
	var l_ev=l_fn(false,undefined);
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	l_ev=vm_group_op_funcs[l_op](l_ev,l_r);
	l_fn(true,l_ev);
	return 0;
}

if(live_enabled)
function vm_group_env_on_env1d(l_th,l_act,l_scope,l_st){
	// vm_group_env_on_env1d(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_fn=l_act.h_f;
	var l_z=l_st[0];
	var l_i=l_st[l_z];
	if(is_numeric(l_i))l_st[@l_z]=l_fn(false,undefined,(l_i|0)); else return l_th.h_proc_error2("Index "+gml_value_print(l_i)+" is not a number.",l_act);
	return 0;
}

if(live_enabled)
function vm_group_env_on_env1d_set(l_th,l_act,l_scope,l_st){
	// vm_group_env_on_env1d_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_fn=l_act.h_f;
	var l_i,l_v;
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_i=l_st[l_z];
	l_v=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	if(is_numeric(l_i))l_fn(true,l_v,(l_i|0)); else return l_th.h_proc_error2("Index "+gml_value_print(l_i)+" is not a number.",l_act);
	return 0;
}

if(live_enabled)
function vm_group_env_on_env1d_aop(l_th,l_act,l_scope,l_st){
	// vm_group_env_on_env1d_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_o=l_act.h_o;
	var l_fn=l_act.h_f;
	var l_i,l_v;
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_i=l_st[l_z];
	l_v=l_st[l_z+1];
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	if(!is_numeric(l_i))return l_th.h_proc_error2("Index "+gml_value_print(l_i)+" is not a number.",l_act);
	var l_ev=l_fn(false,undefined,(l_i|0));
	l_ev=vm_group_op_funcs[l_o](l_ev,l_v);
	l_fn(true,l_ev,(l_i|0));
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func0(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func0(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_act.h_func();
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func0o(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func0o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=l_act.h_func();
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func1(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func1(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__func=l_act.h_func;
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	l__func(l_r);
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func1o(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func1o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=l_act.h_func(l_st[l_z]);
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func2(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func2(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	l_act.h_func(l_st[l_z],l_st[l_z+1]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func2o(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func2o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	l_st[@l_z]=l_act.h_func(l_st[l_z],l_st[l_z+1]);
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func3(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func3(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=(l_z-1);
	l_act.h_func(l_st[l_z],l_st[l_z+1],l_st[l_z+2]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func3o(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func3o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-2;
	l_st[@0]=l_z;
	l_st[@l_z]=l_act.h_func(l_st[l_z],l_st[l_z+1],l_st[l_z+2]);
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func4(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func4(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-3;
	l_st[@0]=(l_z-1);
	l_act.h_func(l_st[l_z],l_st[l_z+1],l_st[l_z+2],l_st[l_z+3]);
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	l_st[@l_z+3]=0;
	return 0;
}

if(live_enabled)
function vm_group_fast_call_on_call_func4o(l_th,l_act,l_scope,l_st){
	// vm_group_fast_call_on_call_func4o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-3;
	l_st[@0]=l_z;
	l_st[@l_z]=l_act.h_func(l_st[l_z],l_st[l_z+1],l_st[l_z+2],l_st[l_z+3]);
	l_st[@l_z+1]=0;
	l_st[@l_z+2]=0;
	l_st[@l_z+3]=0;
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==77)l_act.h_func(l_scope[4][l_act.h_local]);
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0o(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==78){
		var l_v=l_act.h_func(l_scope[4][l_act.h_local]);
		var l_i=l_st[0]+1;
		if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
		l_st[@l_i]=l_v;
		l_st[@0]=l_i;
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==79){
		var l__func=l_act.h_func;
		var l_scope1=l_scope[4][l_act.h_local];
		var l_i=l_st[0];
		var l_r=l_st[l_i];
		l_st[@l_i]=0;
		l_st[@0]=(l_i-1);
		l__func(l_scope1,l_r);
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1o(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==80){
		var l_z=l_st[0];
		l_st[@l_z]=l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z]);
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==81){
		var l_z=l_st[0]-1;
		l_st[@0]=(l_z-1);
		l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z],l_st[l_z+1]);
		l_st[@l_z]=0;
		l_st[@l_z+1]=0;
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2o(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==82){
		var l_z=l_st[0]-1;
		l_st[@0]=l_z;
		l_st[@l_z]=l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z],l_st[l_z+1]);
		l_st[@l_z+1]=0;
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==83){
		var l_z=l_st[0]-2;
		l_st[@0]=(l_z-1);
		l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z],l_st[l_z+1],l_st[l_z+2]);
		l_st[@l_z]=0;
		l_st[@l_z+1]=0;
		l_st[@l_z+2]=0;
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3o(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==84){
		var l_z=l_st[0]-2;
		l_st[@0]=l_z;
		l_st[@l_z]=l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z],l_st[l_z+1],l_st[l_z+2]);
		l_st[@l_z+1]=0;
		l_st[@l_z+2]=0;
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==85){
		var l_z=l_st[0]-3;
		l_st[@0]=(l_z-1);
		l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z],l_st[l_z+1],l_st[l_z+2],l_st[l_z+3]);
		l_st[@l_z]=0;
		l_st[@l_z+1]=0;
		l_st[@l_z+2]=0;
		l_st[@l_z+3]=0;
	}
	return 0;
}

if(live_enabled)
function vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4o(l_th,l_act,l_scope,l_st){
	// vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4o(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	if(l_act.__enumIndex__==86){
		var l_z=l_st[0]-3;
		l_st[@0]=l_z;
		l_st[@l_z]=l_act.h_func(l_scope[4][l_act.h_local],l_st[l_z],l_st[l_z+1],l_st[l_z+2],l_st[l_z+3]);
		l_st[@l_z+1]=0;
		l_st[@l_z+2]=0;
		l_st[@l_z+3]=0;
	}
	return 0;
}

if(live_enabled)
function vm_group_field_dump_no_var(l_th,l_act,l_ctx,l_fd){
	// vm_group_field_dump_no_var(th:gml_thread, act:gml_action, ctx:data_GmlExtInstance, fd:string)->gml_thread_proc_result
	/// @ignore
	var l_post=" does not have a variable `"+l_fd+"`";
	if(is_numeric(l_ctx)){
		if(object_exists(l_ctx)){
			return l_th.h_proc_error2(gml_std_Std_stringify(l_ctx)+" ("+object_get_name(l_ctx)+l_post,l_act);
		} else if(variable_instance_exists(l_ctx,"id")){
			return l_th.h_proc_error2(gml_std_Std_stringify(l_ctx)+" ("+object_get_name(l_ctx.object_index)+")"+l_post,l_act);
		} else return l_th.h_proc_error2(gml_value_print(l_ctx)+l_post,l_act);
	} else if(instanceof(l_ctx)=="instance"){
		return l_th.h_proc_error2(string(l_ctx.id)+" ("+object_get_name(l_ctx.object_index)+")"+l_post,l_act);
	} else {
		var l_val=l_ctx;
		return l_th.h_proc_error2(gml_value_print(l_val)+" ("+gml_value_get_type(l_val)+")"+l_post,l_act);
	}
}

if(live_enabled)
function vm_group_field_on_field(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_s=l_act.h_fd;
	var l_z=l_st[0];
	var l_ctx=l_st[l_z];
	var l_val;
	if(typeof(l_ctx)=="ref"||is_numeric(l_ctx)&&l_ctx>=100000){
		l_val=variable_instance_get(l_ctx,l_s);
		if(l_val!=undefined||variable_instance_exists(l_ctx,l_s)){
			l_st[@l_z]=l_val;
			return 0;
		}
		if(variable_instance_exists(l_ctx,"id"))return vm_group_field_dump_no_var(l_th,l_act,l_ctx,l_s);
	} else with (l_ctx) {
		l_val=variable_instance_get(self,l_s);
		if(l_val!=undefined||variable_instance_exists(self,l_s)){
			l_st[@l_z]=l_val;
			return 0;
		}
		return vm_group_field_dump_no_var(l_th,l_act,l_ctx,l_s);
	}
	if(is_numeric(l_ctx)&&object_exists(l_ctx))return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+" ("+object_get_name(l_ctx)+")",l_act); else return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+".",l_act);
	return 0;
}

if(live_enabled)
function vm_group_field_on_field_set(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_field_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_varname=l_act.h_fd;
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_ctx=l_st[l_z];
	var l_val=l_st[l_z+1];
	var l_checkExists;
	if(typeof(l_ctx)=="ref"||is_numeric(l_ctx)&&l_ctx>=100000){
		try{
			l_checkExists=l_ctx.id
		}catch(l__g){
			var l_x=gml_std_haxe_Exception_caught(l__g).h_unwrap();
			l_st[@l_z]=0;
			l_st[@l_z+1]=0;
			return l_th.h_proc_error2(l_x,l_act);
		}
		variable_instance_set(l_ctx,l_varname,l_val);
		l_st[@l_z]=0;
		l_st[@l_z+1]=0;
		return 0;
	} else with (l_ctx) {
		variable_instance_set(self,l_varname,l_val);
		l_st[@l_z]=0;
		l_st[@l_z+1]=0;
		return 0;
	}
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	if(is_numeric(l_ctx)&&object_exists(l_ctx))return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+" ("+object_get_name(l_ctx)+")",l_act); else return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+".",l_act);
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_field_aop(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_field_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_obj=l_st[l_z];
	l_act.h_setter(l_obj,vm_group_op_funcs[l_act.h_o](l_act.h_getter(l_obj),l_st[l_z+1]));
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_field_on_field_aop(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_field_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_o=l_act.h_o;
	var l_s=l_act.h_fd;
	var l_z=l_st[0]-1;
	l_st[@0]=(l_z-1);
	var l_ctx=l_st[l_z];
	var l_val=l_st[l_z+1];
	var l_checkExists,l_cur;
	if(typeof(l_ctx)=="ref"||is_numeric(l_ctx)&&l_ctx>=100000){
		try{
			l_checkExists=l_ctx.id
		}catch(l__g){
			var l_x=gml_std_haxe_Exception_caught(l__g).h_unwrap();
			l_st[@l_z]=0;
			l_st[@l_z+1]=0;
			return l_th.h_proc_error2(l_x,l_act);
		}
		l_cur=variable_instance_get(l_ctx,l_s);
		if(l_cur!=undefined||variable_instance_exists(l_ctx,l_s)){
			l_cur=vm_group_op_funcs[l_o](l_cur,l_val);
			variable_instance_set(l_ctx,l_s,l_cur);
			l_st[@l_z]=0;
			l_st[@l_z+1]=0;
			return 0;
		} else {
			l_st[@l_z]=0;
			l_st[@l_z+1]=0;
			return l_th.h_proc_error2("`"+gml_std_Std_stringify(l_ctx)+"` ("+object_get_name(l_ctx.object_index)+") does not have a variable `"+l_s+"`",l_act);
		}
	} else {
		l_checkExists=false;
		with (l_ctx) {
			l_cur=variable_instance_get(self,l_s);
			if(l_cur!=undefined||variable_instance_exists(l_ctx,l_s)){
				l_cur=vm_group_op_funcs[l_o](l_cur,l_val);
				variable_instance_set(self,l_s,l_cur);
				l_checkExists=true;
			} else if(is_numeric(l_ctx)){
				l_st[@l_z]=0;
				l_st[@l_z+1]=0;
				return l_th.h_proc_error2("`"+gml_std_Std_stringify(l_ctx)+"` ("+object_get_name(l_ctx.object_index)+") does not have a variable `"+l_s+"`",l_act);
			} else {
				l_st[@l_z]=0;
				l_st[@l_z+1]=0;
				return l_th.h_proc_error2("`"+gml_value_print(l_ctx)+"` ("+typeof(l_ctx)+") does not have a variable `"+l_s+"`",l_act);
			}
		}
		if(l_checkExists){
			l_st[@l_z]=0;
			l_st[@l_z+1]=0;
			return 0;
		}
	}
	l_st[@l_z]=0;
	l_st[@l_z+1]=0;
	if(is_numeric(l_ctx)&&object_exists(l_ctx))return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+" ("+object_get_name(l_ctx)+")",l_act); else return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+".",l_act);
	return 0;
}

if(live_enabled)
function vm_group_field_on_self_field(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_self_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__field=l_act.h_fd;
	var l_this1=l_scope[6];
	var l_obj=l_this1[l_this1[0]];
	var l_val=variable_struct_get(l_obj,l__field);
	if(l_val==undefined){
		if(!variable_struct_exists(l_obj,l__field)){
			if(is_numeric(l_obj)){
				if(object_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj)+") does not have a variable `"+l__field+"`.");
				} else if(instance_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`.");
				} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else if(typeof(l_obj)=="ref"){
				if(instance_exists(l_obj))gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`."); else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
		}
	}
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_val;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_field_on_self_field_set(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_self_field_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__field=l_act.h_fd;
	var l_this1=l_scope[6];
	variable_struct_set(l_this1[l_this1[0]],l__field,gml_stack_pop(l_st));
	return 0;
}

if(live_enabled)
function vm_group_field_on_self_field_aop(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_self_field_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__op=l_act.h_o;
	var l__field=l_act.h_fd;
	var l_this1=l_scope[6];
	var l_obj=l_this1[l_this1[0]];
	var l_cur=variable_struct_get(l_obj,l__field);
	if(l_cur==undefined){
		if(!variable_struct_exists(l_obj,l__field)){
			if(is_numeric(l_obj)){
				if(object_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj)+") does not have a variable `"+l__field+"`.");
				} else if(instance_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`.");
				} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else if(typeof(l_obj)=="ref"){
				if(instance_exists(l_obj))gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`."); else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
		}
	}
	var l_this1=l_scope[6];
	variable_struct_set(l_this1[l_this1[0]],l__field,vm_group_op_funcs[l__op](l_cur,gml_stack_pop(l_st)));
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_self_field(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_self_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=l_scope[6];
	var l_v=l_act.h_getter(l_this1[l_this1[0]]);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_self_field_set(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_self_field_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__setter=l_act.h_setter;
	var l_this1=l_scope[6];
	l__setter(l_this1[l_this1[0]],gml_stack_pop(l_st));
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_self_field_aop(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_self_field_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_this1=l_scope[6];
	var l_obj=l_this1[l_this1[0]];
	l_act.h_setter(l_obj,vm_group_op_funcs[l_act.h_o](l_act.h_getter(l_obj),gml_stack_pop(l_st)));
	return 0;
}

if(live_enabled)
function vm_group_field_on_local_field(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_local_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_act.h_localIndex;
	var l__field=l_act.h_fd;
	var l_obj=l_scope[4][l_i];
	var l_val=variable_struct_get(l_obj,l__field);
	if(l_val==undefined){
		if(!variable_struct_exists(l_obj,l__field)){
			if(is_numeric(l_obj)){
				if(object_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj)+") does not have a variable `"+l__field+"`.");
				} else if(instance_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`.");
				} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else if(typeof(l_obj)=="ref"){
				if(instance_exists(l_obj))gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`."); else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
		}
	}
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_val;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_field_on_local_field_set(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_local_field_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	variable_struct_set(l_scope[4][l_act.h_localIndex],l_act.h_fd,gml_stack_pop(l_st));
	return 0;
}

if(live_enabled)
function vm_group_field_on_local_field_aop(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_local_field_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_act.h_localIndex;
	var l__op=l_act.h_o;
	var l__field=l_act.h_fd;
	var l_obj=l_scope[4][l_i];
	var l_cur=variable_struct_get(l_obj,l__field);
	if(l_cur==undefined){
		if(!variable_struct_exists(l_obj,l__field)){
			if(is_numeric(l_obj)){
				if(object_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj)+") does not have a variable `"+l__field+"`.");
				} else if(instance_exists(l_obj)){
					gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`.");
				} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else if(typeof(l_obj)=="ref"){
				if(instance_exists(l_obj))gml_thread_error(gml_std_Std_stringify(l_obj)+" ("+object_get_name(l_obj.object_index)+") does not have a variable `"+l__field+"`."); else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
			} else gml_thread_error(gml_value_dump(l_obj)+" does not have a variable `"+l__field+"`.");
		}
	}
	variable_struct_set(l_obj,l__field,vm_group_op_funcs[l__op](l_cur,gml_stack_pop(l_st)));
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_local_field(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_local_field(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_v=l_act.h_getter(l_scope[4][l_act.h_localIndex]);
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_local_field_set(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_local_field_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_act.h_setter(l_scope[4][l_act.h_localIndex],gml_stack_pop(l_st));
	return 0;
}

if(live_enabled)
function vm_group_field_on_fast_local_field_aop(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_fast_local_field_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_obj=l_scope[4][l_act.h_localIndex];
	l_act.h_setter(l_obj,vm_group_op_funcs[l_act.h_o](l_act.h_getter(l_obj),gml_stack_pop(l_st)));
	return 0;
}

if(live_enabled)
function vm_group_field_on_in(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_in(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_not=l_act.h_not;
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	var l_ctx=l_st[l_z+1];
	if(typeof(l_ctx)=="ref"||is_numeric(l_ctx)&&l_ctx>=100000){
		l_st[@l_z]=l_not!=variable_instance_exists(l_ctx,l_st[l_z]);
		return 0;
	} else with (l_ctx) {
		l_st[@l_z]=l_not!=variable_instance_exists(self,l_st[l_z]);
		return 0;
	}
	if(is_numeric(l_ctx)&&object_exists(l_ctx))return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+" ("+object_get_name(l_ctx)+")",l_act); else return l_th.h_proc_error2("Couldn't find any instances of "+gml_std_Std_stringify(l_ctx)+".",l_act);
	return 0;
}

if(live_enabled)
function vm_group_field_on_in_const(l_th,l_act,l_scope,l_st){
	// vm_group_field_on_in_const(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=l_act.h_not!=variable_struct_exists(l_st[l_z],l_act.h_field);
	return 0;
}

if(live_enabled)
function vm_group_global_on_global(l_th,l_act,l_scope,l_st){
	// vm_group_global_on_global(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_s=l_act.h_fd;
	if(variable_global_exists(l_s)){
		var l_v=variable_global_get(l_s);
		var l_i=l_st[0]+1;
		if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
		l_st[@l_i]=l_v;
		l_st[@0]=l_i;
	} else return l_th.h_proc_error2("Global variable `"+l_s+"` is not set.",l_act);
	return 0;
}

if(live_enabled)
function vm_group_global_on_global_set(l_th,l_act,l_scope,l_st){
	// vm_group_global_on_global_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	variable_global_set(l_act.h_fd,l_r);
	return 0;
}

if(live_enabled)
function vm_group_global_on_global_aop(l_th,l_act,l_scope,l_st){
	// vm_group_global_on_global_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_o=l_act.h_o;
	var l_s=l_act.h_fd;
	if(variable_global_exists(l_s)){
		var l_i=l_st[0];
		var l_r=l_st[l_i];
		l_st[@l_i]=0;
		l_st[@0]=(l_i-1);
		variable_global_set(l_s,vm_group_op_funcs[l_o](variable_global_get(l_s),l_r));
	} else return l_th.h_proc_error2("Global variable `"+l_s+"` is not set.",l_act);
	return 0;
}

if(live_enabled)
function vm_group_jump_on_jump(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_jump(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[@2]=l_act.h_p;
	return 2;
}

if(live_enabled)
function vm_group_jump_on_jump_if(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_jump_if(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	if(l_r){
		l_scope[@2]=l_p;
		return 2;
	}
	return 0;
}

if(live_enabled)
function vm_group_jump_on_jump_unless(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_jump_unless(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	if(!l_r){
		l_scope[@2]=l_p;
		return 2;
	}
	return 0;
}

if(live_enabled)
function vm_group_jump_on_bool_and(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_bool_and(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	if(l_st[l_st[0]]){
		var l_i=l_st[0];
		l_st[@l_i]=0;
		l_st[@0]=(l_i-1);
	} else {
		l_scope[@2]=l_p;
		return 2;
	}
	return 0;
}

if(live_enabled)
function vm_group_jump_on_bool_or(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_bool_or(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	if(l_st[l_st[0]]){
		l_scope[@2]=l_p;
		return 2;
	} else {
		var l_i=l_st[0];
		l_st[@l_i]=0;
		l_st[@0]=(l_i-1);
	}
	return 0;
}

if(live_enabled)
function vm_group_jump_on_switch(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_switch(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_jt=l_act.h_jumptable;
	var l_p=l_act.h_defaultPos;
	var l_i=l_st[0];
	var l_val=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	if(is_real(l_val)){
		if(frac(l_val)!=0){
			l_scope[@2]=l_p;
			return 2;
		}
		var l_vi=int64(l_val);
		if(l_vi!=l_val){
			l_scope[@2]=l_p;
			return 2;
		} else l_val=l_vi;
	}
	if(gml_std_haxe_boot_isJS&&is_int64(l_val)){
		var l_vr=real(l_val);
		if(l_vr==l_val&&ds_map_exists(l_jt,l_vr)){
			l_scope[@2]=ds_map_find_value(l_jt,l_vr);
			return 2;
		}
	}
	if(ds_map_exists(l_jt,l_val))l_scope[@2]=ds_map_find_value(l_jt,l_val); else l_scope[@2]=l_p;
	return 2;
}

if(live_enabled)
function vm_group_jump_on_switch_case(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_switch_case(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	if(l_st[l_st[0]]==l_r){
		gml_stack_discard(l_st);
		l_scope[@2]=l_p;
		return 2;
	}
	return 0;
}

if(live_enabled)
function vm_group_jump_on_null_co(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_null_co(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_val=l_st[l_st[0]];
	if(l_val!=undefined&&l_val!=pointer_null){
		l_scope[@2]=l_p;
		return 2;
	} else gml_stack_discard(l_st);
	return 0;
}

if(live_enabled)
function vm_group_jump_on_repeat_pre(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_repeat_pre(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_val=l_st[l_st[0]];
	if(is_numeric(l_val)){
		if(l_val<1){
			l_scope[@2]=l_p;
			var l_i=l_st[0];
			l_st[@l_i]=0;
			l_st[@0]=(l_i-1);
			return 2;
		}
	} else return l_th.h_proc_error2("Repeat `times` must be a number",l_act);
	return 0;
}

if(live_enabled)
function vm_group_jump_on_repeat_jump(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_repeat_jump(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_f=l_st[l_st[0]]-1;
	l_st[@l_st[0]]=l_f;
	if(l_f>=1){
		l_scope[@2]=l_p;
		return 2;
	}
	return 0;
}

if(live_enabled)
function vm_group_jump_on_break(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_break(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[@2]=l_act.h_lp;
	return 2;
}

if(live_enabled)
function vm_group_jump_on_continue(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_continue(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[@2]=l_act.h_lp;
	return 2;
}

if(live_enabled)
function vm_group_jump_on_return(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_return(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_r=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	l_th.h_result=l_r;
	l_scope[@2]=ds_list_size(l_scope[1]);
	return 2;
}

if(live_enabled)
function vm_group_jump_on_return_const(l_th,l_act,l_scope,l_st){
	// vm_group_jump_on_return_const(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_th.h_result=l_act.h_val;
	l_scope[@2]=ds_list_size(l_scope[1]);
	return 2;
}

if(live_enabled)
function vm_group_literal_on_undefined(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_undefined(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=undefined;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_number(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_number(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_act.h_f;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_cstring(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_cstring(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_act.h_s;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_const(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_const(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_act.h_v;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_self(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_self(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_inst=l_scope[6];
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_inst[l_inst[0]];
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_other(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_other(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_inst=l_scope[6];
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_inst[l_inst[0]-1];
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_result(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_result(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_th.h_result;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_array_decl(l_th,l_act,l_scope,l_st){
	// vm_group_literal_on_array_decl(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_n=l_act.h_size;
	var l_arr=[];
	var l_k=l_st[0]-l_n;
	array_copy(l_arr,0,l_st,l_k+1,l_n);
	array_copy(l_st,l_k+1,gml_stack_fill_value_arr,0,l_n);
	l_st[@0]=l_k;
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_arr;
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_literal_on_object_decl(l_th,l_act,l_scope,l_stack){
	// vm_group_literal_on_object_decl(th:gml_thread, act:gml_action, scope:gml_thread_scope, stack:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_fields=l_act.h_fields;
	var l_obj={}
	var l_n=array_length(l_fields);
	var l_stackStart=l_stack[0]-l_n+1;
	var l_i=l_n;
	while(--l_i>=0){
		var l_fd=l_fields[l_i];
		var l_val=l_stack[l_stackStart+l_i];
		if(l_fd.bindFunc)l_val=live_method(l_obj,l_val);
		variable_struct_set(l_obj,l_fd.name,l_val);
	}
	gml_stack_discard_multi(l_stack,l_n);
	var l_i=l_stack[0]+1;
	if(l_i>=array_length(l_stack))l_stack[@array_length(l_stack)*2]=0;
	l_stack[@l_i]=l_obj;
	l_stack[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_local_on_local(l_th,l_act,l_scope,l_st){
	// vm_group_local_on_local(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i1=l_st[0]+1;
	if(l_i1>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i1]=l_scope[4][l_act.h_i];
	l_st[@0]=l_i1;
	return 0;
}

if(live_enabled)
function vm_group_local_on_local_set(l_th,l_act,l_scope,l_st){
	// vm_group_local_on_local_set(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i1=l_st[0];
	var l_r=l_st[l_i1];
	l_st[@l_i1]=0;
	l_st[@0]=(l_i1-1);
	l_scope[4][@l_act.h_i]=l_r;
	return 0;
}

if(live_enabled)
function vm_group_local_on_local_aop(l_th,l_act,l_scope,l_st){
	// vm_group_local_on_local_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_op=l_act.h_o;
	var l_i=l_act.h_i;
	var l_locals=l_scope[4];
	var l_i1=l_st[0];
	var l_r=l_st[l_i1];
	l_st[@l_i1]=0;
	l_st[@0]=(l_i1-1);
	l_locals[@l_i]=vm_group_op_funcs[l_op](l_locals[l_i],l_r);
	return 0;
}

if(live_enabled)
function vm_group_op_impl_unknown(l_a,l_b){
	// vm_group_op_impl_unknown(a:any, b:any)->any
	/// @ignore
	show_error("No idea how to apply this operator",true);
}

if(live_enabled)
function vm_group_op_impl_add(l_a,l_b){
	// vm_group_op_impl_add(a:any, b:any)->any
	/// @ignore
	return l_a+l_b;
}

if(live_enabled)
function vm_group_op_impl_sub(l_a,l_b){
	// vm_group_op_impl_sub(a:any, b:any)->any
	/// @ignore
	return l_a-l_b;
}

if(live_enabled)
function vm_group_op_impl_mul(l_a,l_b){
	// vm_group_op_impl_mul(a:any, b:any)->any
	/// @ignore
	return l_a*l_b;
}

if(live_enabled)
function vm_group_op_impl_div1(l_a,l_b){
	// vm_group_op_impl_div1(a:any, b:any)->any
	/// @ignore
	if(l_b==0&&is_int64(l_b)&&is_int64(l_a))gml_thread_error("Division by zero");
	return l_a/l_b;
}

if(live_enabled)
function vm_group_op_impl_mod(l_a,l_b){
	// vm_group_op_impl_mod(a:any, b:any)->any
	/// @ignore
	return l_a%l_b;
}

if(live_enabled)
function vm_group_op_impl_idiv(l_a,l_b){
	// vm_group_op_impl_idiv(a:any, b:any)->any
	/// @ignore
	return (l_a div l_b);
}

if(live_enabled)
function vm_group_op_impl_and(l_a,l_b){
	// vm_group_op_impl_and(a:any, b:any)->any
	/// @ignore
	return (l_a&l_b);
}

if(live_enabled)
function vm_group_op_impl_or(l_a,l_b){
	// vm_group_op_impl_or(a:any, b:any)->any
	/// @ignore
	return (l_a|l_b);
}

if(live_enabled)
function vm_group_op_impl_xor(l_a,l_b){
	// vm_group_op_impl_xor(a:any, b:any)->any
	/// @ignore
	return (l_a^l_b);
}

if(live_enabled)
function vm_group_op_impl_shl(l_a,l_b){
	// vm_group_op_impl_shl(a:any, b:any)->any
	/// @ignore
	return (l_a<<l_b);
}

if(live_enabled)
function vm_group_op_impl_shr(l_a,l_b){
	// vm_group_op_impl_shr(a:any, b:any)->any
	/// @ignore
	return (l_a>>l_b);
}

if(live_enabled)
function vm_group_op_impl_eq(l_a,l_b){
	// vm_group_op_impl_eq(a:any, b:any)->any
	/// @ignore
	return l_a==l_b;
}

if(live_enabled)
function vm_group_op_impl_ne(l_a,l_b){
	// vm_group_op_impl_ne(a:any, b:any)->any
	/// @ignore
	return l_a!=l_b;
}

if(live_enabled)
function vm_group_op_impl_gt(l_a,l_b){
	// vm_group_op_impl_gt(a:any, b:any)->any
	/// @ignore
	return l_a>l_b;
}

if(live_enabled)
function vm_group_op_impl_ge(l_a,l_b){
	// vm_group_op_impl_ge(a:any, b:any)->any
	/// @ignore
	return l_a>=l_b;
}

if(live_enabled)
function vm_group_op_impl_lt(l_a,l_b){
	// vm_group_op_impl_lt(a:any, b:any)->any
	/// @ignore
	return l_a<l_b;
}

if(live_enabled)
function vm_group_op_impl_le(l_a,l_b){
	// vm_group_op_impl_le(a:any, b:any)->any
	/// @ignore
	return l_a<=l_b;
}

if(live_enabled)
function vm_group_op_impl(){
	// vm_group_op_impl()->array<function<any;any;any>>
	/// @ignore
	var l_num=112;
	var l_fns=array_create(l_num,undefined);
	for(var l_i=0;l_i<l_num;l_i++){
		l_fns[@l_i]=vm_group_op_impl_unknown;
	}
	l_fns[@16]=vm_group_op_impl_add;
	l_fns[@17]=vm_group_op_impl_sub;
	l_fns[@0]=vm_group_op_impl_mul;
	l_fns[@1]=vm_group_op_impl_div1;
	l_fns[@2]=vm_group_op_impl_mod;
	l_fns[@3]=vm_group_op_impl_idiv;
	l_fns[@49]=vm_group_op_impl_and;
	l_fns[@48]=vm_group_op_impl_or;
	l_fns[@50]=vm_group_op_impl_xor;
	l_fns[@32]=vm_group_op_impl_shl;
	l_fns[@33]=vm_group_op_impl_shr;
	l_fns[@64]=vm_group_op_impl_eq;
	l_fns[@65]=vm_group_op_impl_ne;
	l_fns[@68]=vm_group_op_impl_gt;
	l_fns[@69]=vm_group_op_impl_ge;
	l_fns[@66]=vm_group_op_impl_lt;
	l_fns[@67]=vm_group_op_impl_le;
	return l_fns;
}

if(live_enabled)
function vm_group_op_on_bin_op(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_bin_op(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	l_st[@l_z]=vm_group_op_funcs[l_act.h_o](l_st[l_z],l_st[l_z+1]);
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_op_on_un_op(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_un_op(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	switch(l_act.h_o){
		case 2:l_st[@l_z]=~l_st[l_z];break;
		case 1:l_st[@l_z]=!l_st[l_z];break;
		case 0:l_st[@l_z]=-l_st[l_z];break;
	}
	return 0;
}

if(live_enabled)
function vm_group_op_on_equ_op(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_equ_op(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	l_st[@l_z]=l_st[l_z]==l_st[l_z+1];
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_op_on_neq_op(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_neq_op(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	l_st[@l_z]=l_st[l_z]!=l_st[l_z+1];
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_op_on_add_int(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_add_int(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0];
	l_st[@l_z]=l_st[l_z]+l_act.h_i;
	return 0;
}

if(live_enabled)
function vm_group_op_on_concat(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_concat(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_z=l_st[0]-1;
	l_st[@0]=l_z;
	var l_v2=l_st[l_z+1];
	if(!is_string(l_v2))l_v2=gml_value_print(l_v2);
	var l_v1=l_st[l_z];
	if(!is_string(l_v1))l_v1=gml_value_print(l_v1);
	l_st[@l_z]=l_v1+l_v2;
	l_st[@l_z+1]=0;
	return 0;
}

if(live_enabled)
function vm_group_op_on_ds_aop(l_th,l_act,l_scope,l_st){
	// vm_group_op_on_ds_aop(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l__o=l_act.h_o;
	var l_setterArgc=l_act.h_argc;
	var l_getterFunc=l_act.h_get;
	var l_setterFunc=l_act.h_set;
	var l_k=1+l_st[0]-l_setterArgc;
	var l_getterArgc=l_setterArgc-1;
	var l_arr=l_st;
	var l_v=(l_getterArgc<81?script_execute(vm_gml_thread_exec_slice_funcs[l_getterArgc],l_getterFunc,l_arr,l_k):vm_gml_thread_exec_slice_longcall(l_getterFunc,l_arr,l_k,l_getterArgc));
	l_v=vm_group_op_funcs[l__o](l_v,l_st[l_k+l_getterArgc]);
	l_st[@l_k+l_getterArgc]=l_v;
	var l_arr=l_st;
	if(l_setterArgc<81)script_execute(vm_gml_thread_exec_slice_funcs[l_setterArgc],l_setterFunc,l_arr,l_k); else vm_gml_thread_exec_slice_longcall(l_setterFunc,l_arr,l_k,l_setterArgc);
	if(l_act.h_out){
		gml_stack_pop_multi(l_st,l_getterArgc);
		l_st[@l_st[0]]=l_v;
	} else gml_stack_pop_multi(l_st,l_setterArgc);
	return 0;
}

if(live_enabled)
function vm_group_special_on_wait(l_th,l_act,l_scope,l_st){
	// vm_group_special_on_wait(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_t=gml_stack_pop(l_st);
	l_th.h_status=5;
	l_th.h_wait_time=(is_numeric(l_t)?l_t:0);
	ds_list_add(l_scope[9].h_wait_list,l_th);
	return 1;
	return 0;
}

if(live_enabled)
function vm_group_special_on_fork(l_th,l_act,l_scope,l_st){
	// vm_group_special_on_fork(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_out=l_act.h_out;
	if(l_out)gml_stack_push(l_st,1);
	l_th.h_fork().h_exec();
	if(l_out)l_st[@l_st[0]]=0;
	return 2;
}

if(live_enabled)
function vm_group_special_on_try(l_th,l_act,l_scope,l_st){
	// vm_group_special_on_try(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[@8]=new gml_link(l_act.h_hdl,l_scope[8]);
	return 0;
}

if(live_enabled)
function vm_group_special_on_catch(l_th,l_act,l_scope,l_st){
	// vm_group_special_on_catch(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[@8]=l_scope[8].h_next;
	l_scope[4][@l_act.h_v]=l_th.h_error_text;
	l_th.h_error_text=undefined;
	return 0;
}

if(live_enabled)
function vm_group_special_on_finally(l_th,l_act,l_scope,l_st){
	// vm_group_special_on_finally(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	l_scope[@8]=l_scope[8].h_next;
	l_scope[@2]=l_act.h_p;
	return 2;
}

if(live_enabled)
function vm_group_special_on_throw(l_th,l_act,l_scope,l_st){
	// vm_group_special_on_throw(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	return l_th.h_proc_error2(gml_std_Std_stringify(gml_stack_pop(l_st)),l_act);
	return 0;
}

if(live_enabled)
function vm_group_stack_on_discard(l_th,l_act,l_scope,l_st){
	// vm_group_stack_on_discard(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	return 0;
}

if(live_enabled)
function vm_group_stack_on_dup(l_th,l_act,l_scope,l_st){
	// vm_group_stack_on_dup(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+1;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i]=l_st[l_i-1];
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_stack_on_dup2x(l_th,l_act,l_scope,l_st){
	// vm_group_stack_on_dup2x(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+2;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i-1]=l_st[l_i-3];
	l_st[@l_i]=l_st[l_i-2];
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_stack_on_dup3x(l_th,l_act,l_scope,l_st){
	// vm_group_stack_on_dup3x(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0]+3;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	l_st[@l_i-2]=l_st[l_i-5];
	l_st[@l_i-1]=l_st[l_i-4];
	l_st[@l_i]=l_st[l_i-3];
	l_st[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_stack_on_dup_in(l_th,l_act,l_scope,l_st){
	// vm_group_stack_on_dup_in(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_v=l_st[l_i++];
	l_st[@0]=l_i;
	var l_k=l_i-l_act.h_z;
	if(l_i>=array_length(l_st))l_st[@array_length(l_st)*2]=0;
	while(--l_i>=l_k){
		l_st[@l_i+1]=l_st[l_i];
	}
	l_st[@l_k]=l_v;
	return 0;
}

if(live_enabled)
function vm_group_with_on_with_pre(l_th,l_act,l_scope,l_st){
	// vm_group_with_on_with_pre(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_i=l_st[0];
	var l_val=l_st[l_i];
	l_st[@l_i]=0;
	l_st[@0]=(l_i-1);
	var l_ctx=l_val;
	var l_arr,l_i,l_n;
	if(is_numeric(l_val)){
		if(l_ctx>=100000){
			if(instance_exists(l_ctx)){
				l_arr=vm__gml_with_data_gml_with_data_impl__alloc(1);
				l_arr[@0]=l_ctx;
				var l__this=gml_std_haxe_enum_tools_getParameter(l_act,0);
				if(!l_scope[9].h_get_source(l__this[0]).h_version.h_int_self)with (l_ctx) {
					l_arr[@0]=self;
					break;
				}
				l_n=1;
			} else {
				l_arr=vm__gml_with_data_gml_with_data_impl__alloc(0);
				l_n=0;
			}
			l_scope[@7]=new gml_with_scope({length:l_n,items:l_arr,refc:1},l_scope[7]);
		} else {
			l_n=instance_number(l_ctx);
			l_arr=vm__gml_with_data_gml_with_data_impl__alloc(l_n);
			l_i=0;
			with (l_ctx) {
				l_arr[@l_i]=self;
				l_i++;
			}
			l_scope[@7]=new gml_with_scope({length:l_i,items:l_arr,refc:1},l_scope[7]);
		}
	} else {
		l_arr=vm__gml_with_data_gml_with_data_impl__alloc(1);
		l_i=0;
		with (l_ctx) {
			l_arr[@l_i]=self;
			l_i++;
		}
		l_scope[@7]=new gml_with_scope({length:l_i,items:l_arr,refc:1},l_scope[7]);
	}
	var l_inst=l_scope[6];
	var l_i=l_inst[0]+1;
	if(l_i>=array_length(l_inst))l_inst[@array_length(l_inst)*2]=0;
	l_inst[@l_i]=undefined;
	l_inst[@0]=l_i;
	return 0;
}

if(live_enabled)
function vm_group_with_on_with_next(l_th,l_act,l_scope,l_st){
	// vm_group_with_on_with_next(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_p=l_act.h_p;
	var l_with1=l_scope[7];
	if(l_with1.h_index<l_with1.h_length){
		var l_inst=l_scope[6];
		l_inst[@l_inst[0]]=l_with1.h_array[l_with1.h_index++];
	} else {
		l_scope[@2]=l_p;
		return 2;
	}
	return 0;
}

if(live_enabled)
function vm_group_with_on_with_post(l_th,l_act,l_scope,l_st){
	// vm_group_with_on_with_post(th:gml_thread, act:gml_action, scope:gml_thread_scope, st:gml_stack<any>)->gml_thread_proc_result
	/// @ignore
	var l_with1=l_scope[7];
	if(l_with1!=undefined){
		var l_this1=l_with1.h_data;
		if(--l_this1.refc==0){
			var l_size=l_this1.length;
			var l_sln=(l_size>0?(log10(l_size)|0):0);
			if(l_sln<5)ds_stack_push(vm__gml_with_data_gml_with_data_impl__pools[l_sln],l_this1.items);
		}
		l_scope[@7]=l_with1.h_next;
		var l_this1=l_scope[6];
		var l_i=l_this1[0];
		l_this1[@l_i]=0;
		l_this1[@0]=(l_i-1);
	}
	return 0;
}

globalvar gml_builder_build_line_is_stat; /// @is {bool}
globalvar gml_builder_build_line_is_expr; /// @is {bool}
/// @typedef {array} gml_node
globalvar compile_gml_compile_args_get_simple_val; /// @is {any}
globalvar compile_gml_compile_args_get_simple_kind; /// @is {compile__GmlCompileArgs_GmlArgSimpleKind}
globalvar gml_func_name; /// @is {ds_map<any; string>}
if(live_enabled)gml_func_name=ds_map_create();
globalvar gml_func_script_id; /// @is {tools_Dictionary<script>}
if(live_enabled)gml_func_script_id={}
globalvar gml_const_map; /// @is {tools_Dictionary<bool>}
if(live_enabled)gml_const_map={}
globalvar gml_const_val; /// @is {tools_Dictionary<any>}
if(live_enabled)gml_const_val={}
globalvar gml_asset_index; /// @is {tools_Dictionary<int>}
if(live_enabled)gml_asset_index={}
globalvar gml_enum_map; /// @is {tools_Dictionary<gml_enum>}
if(live_enabled)gml_enum_map={}
globalvar compile_groups_gml_compile_group_static_has_statics; /// @is {bool}
if(live_enabled)compile_groups_gml_compile_group_static_has_statics=compile_groups_gml_compile_group_static_has_statics_init();
globalvar gml_func_map; /// @is {tools_Dictionary<gml_func>}
if(live_enabled)gml_func_map={}
globalvar vm_value_gml_value_printer_print_refs; /// @is {ds_map<any; string>}
if(live_enabled)vm_value_gml_value_printer_print_refs=ds_map_create();
globalvar vm_value_gml_value_printer_print_num; /// @is {int}
if(live_enabled)vm_value_gml_value_printer_print_num=0;
globalvar gml_op_apply_fns; /// @is {array<ast_GmlOpFunc>}
if(live_enabled)gml_op_apply_fns=gml_op_apply_init();
globalvar gml_thread_default_callback; /// @is {function<gml_thread;void>}
if(live_enabled)gml_thread_default_callback=undefined;
globalvar gml_thread_verbose_stack_traces; /// @is {bool}
if(live_enabled)gml_thread_verbose_stack_traces=false;
globalvar gml_thread_allow_exceptions; /// @is {bool}
if(live_enabled)gml_thread_allow_exceptions=false;
globalvar gml_thread_current; /// @is {gml_thread}
if(live_enabled)gml_thread_current=undefined;
globalvar gml_stack_fill_value_arr; /// @is {array<any>}
if(live_enabled)gml_stack_fill_value_arr=array_create(1024,0);
globalvar gml_compile_error_text; /// @is {string}
globalvar gml_compile_error_pos; /// @is {gml_pos}
globalvar gml_compile_curr_script; /// @is {gml_script}
if(live_enabled)gml_compile_curr_script=gml_compile_init();
globalvar gml_compile_curr_program; /// @is {gml_program}
globalvar gml_compile_curr_break; /// @is {int}
if(live_enabled)gml_compile_curr_break=-1;
globalvar gml_compile_curr_continue; /// @is {int}
if(live_enabled)gml_compile_curr_continue=-1;
globalvar gml_compile_const_val_of_val; /// @is {any}
globalvar gml_compile_def_indexes; /// @is {Map<string; int>}
globalvar gml_compile_handlers; /// @is {array<function<q:ast_GmlNode;actions:gml_action_list;out:bool;bool?>>}
globalvar api_api_version_v1; /// @is {api_api_version}
if(live_enabled)api_api_version_v1=api_api_version_create(14);
globalvar api_api_version_v2; /// @is {api_api_version}
if(live_enabled)api_api_version_v2=api_api_version_create(22);
globalvar api_api_version_v23; /// @is {api_api_version}
if(live_enabled)api_api_version_v23=api_api_version_create(23);
globalvar gml_parser_template_func; /// @is {string}
if(live_enabled)gml_parser_template_func="string";
globalvar gml_parser_default_version; /// @is {api_api_version}
if(live_enabled)gml_parser_default_version=api_api_version_v23;
globalvar gml_parser_curr_version; /// @is {api_api_version}
if(live_enabled)gml_parser_curr_version=undefined;
globalvar gml_parser_token_acc; /// @is {GmlParserOut}
if(live_enabled)gml_parser_token_acc=ds_list_create();
globalvar gml_parser_fast_buf; /// @is {buffer}
if(live_enabled)gml_parser_fast_buf=buffer_create(1024,buffer_fast,1);
globalvar gml_parser_str_buf; /// @is {buffer}
if(live_enabled)gml_parser_str_buf=buffer_create(1024,buffer_grow,1);
globalvar gml_parser_buf_sub_buf; /// @is {buffer}
if(live_enabled)gml_parser_buf_sub_buf=buffer_create(1024,buffer_grow,1);
globalvar gml_parser_error_text; /// @is {string}
globalvar gml_parser_error_pos; /// @is {gml_pos}
globalvar gml_parser_char_is_space; /// @is {array<bool>}
if(live_enabled)gml_parser_char_is_space=gml_parser_char_is_space_init();
globalvar _gml_parser_gml_parser_string_buf_impl____buf; /// @is {buffer}
if(live_enabled)_gml_parser_gml_parser_string_buf_impl____buf=buffer_create(1024,buffer_grow,1);
globalvar gml_program_seek_inst; /// @is {gml_program}
globalvar gml_program_seek_func; /// @is {function<ast_GmlNode;tools_ArrayList<ast_GmlNode>;bool>}
globalvar gml_program_seek_script; /// @is {gml_script}
globalvar gml_std_StringBuf_buffer; /// @is {buffer}
if(live_enabled)gml_std_StringBuf_buffer=buffer_create(128,buffer_grow,1);
globalvar gml_fast_field_getters; /// @is {tools_Dictionary<api_ApiFastFieldGetter>}
if(live_enabled)gml_fast_field_getters={}
globalvar gml_fast_field_setters; /// @is {tools_Dictionary<api_ApiFastFieldSetter>}
if(live_enabled)gml_fast_field_setters={}
globalvar api_api_var_map; /// @is {tools_Dictionary<api_api_var>}
if(live_enabled)api_api_var_map={}
globalvar ast_gml_macro_proc_list; /// @is {tools_ArrayList<gml_parser_macro>}
if(live_enabled)ast_gml_macro_proc_list=ds_list_create();
globalvar ast_gml_macro_proc_map; /// @is {tools_Dictionary<gml_parser_macro>}
if(live_enabled)ast_gml_macro_proc_map={}
globalvar ast_gml_macro_proc_exclude_map; /// @is {tools_Dictionary<bool>}
if(live_enabled)ast_gml_macro_proc_exclude_map={}
globalvar ast_gml_macro_proc_next_exclude_list; /// @is {tools_ArrayList<string>}
if(live_enabled)ast_gml_macro_proc_next_exclude_list=ds_list_create();
globalvar ast_gml_macro_proc_next_exclude_map; /// @is {tools_Dictionary<bool>}
if(live_enabled)ast_gml_macro_proc_next_exclude_map={}
globalvar ast_gml_node_def_info_array; /// @is {array<ast_gml_node_def_ctr>}
if(live_enabled)ast_gml_node_def_info_array=[new ast_gml_node_def_ctr("Undefined",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Boolean",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("value",13)]),new ast_gml_node_def_ctr("Number",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("value",13),new ast_gml_node_def_param("src",13)]),new ast_gml_node_def_ctr("CString",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("value",13)]),new ast_gml_node_def_ctr("OtherConst",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("value",13)]),new ast_gml_node_def_ctr("EnumCtr",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("e",6),new ast_gml_node_def_param("ctr",7)]),new ast_gml_node_def_ctr("ArrayDecl",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("values",1)]),new ast_gml_node_def_ctr("ObjectDecl",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("keys",14),new ast_gml_node_def_param("values",1)]),new ast_gml_node_def_ctr("EnsureArrayForLocal",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("EnsureArrayForGlobal",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("EnsureArrayForField",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("fd",13)]),new ast_gml_node_def_ctr("EnsureArrayForIndex",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("ind",0)]),new ast_gml_node_def_ctr("EnsureArrayForIndex2d",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("ind1",0),new ast_gml_node_def_param("ind2",0)]),new ast_gml_node_def_ctr("Ident",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("id",13)]),new ast_gml_node_def_ctr("Self",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Other",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("GlobalRef",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Script",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("ref",5)]),new ast_gml_node_def_ctr("NativeScript",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("id",12)]),new ast_gml_node_def_ctr("Const",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("ArgConst",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("index",13)]),new ast_gml_node_def_ctr("ArgIndex",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("index",0)]),new ast_gml_node_def_ctr("ArgCount",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Call",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("CallScript",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("CallScriptAt",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("inst",0),new ast_gml_node_def_param("script",13),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("CallScriptId",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("CallScriptWithArray",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("array",0)]),new ast_gml_node_def_ctr("CallField",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("field",13),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("CallFunc",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("func",11),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("CallFuncAt",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0),new ast_gml_node_def_param("fname",13),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("Construct",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("ctr",0),new ast_gml_node_def_param("args",1)]),new ast_gml_node_def_ctr("FuncLiteral",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("unbound",13)]),new ast_gml_node_def_ctr("Prefix",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0),new ast_gml_node_def_param("inc",13)]),new ast_gml_node_def_ctr("Postfix",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0),new ast_gml_node_def_param("inc",13)]),new ast_gml_node_def_ctr("UnOp",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0),new ast_gml_node_def_param("op",8)]),new ast_gml_node_def_ctr("BinOp",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("a",0),new ast_gml_node_def_param("b",0)]),new ast_gml_node_def_ctr("SetOp",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("a",0),new ast_gml_node_def_param("b",0)]),new ast_gml_node_def_ctr("Delete",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0)]),new ast_gml_node_def_ctr("NullCo",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("a",0),new ast_gml_node_def_param("b",0)]),new ast_gml_node_def_ctr("ToBool",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("FromBool",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("In",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("fd",0),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("not",13)]),new ast_gml_node_def_ctr("Local",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("LocalSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("LocalAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Static",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("StaticSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("val",0),new ast_gml_node_def_param("isInit",13)]),new ast_gml_node_def_ctr("StaticAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Global",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("GlobalSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("GlobalAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("ScriptStatic",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("scr",13),new ast_gml_node_def_param("name",13)]),new ast_gml_node_def_ctr("ScriptStaticSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("scr",13),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("ScriptStaticAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("scr",13),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Field",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("field",13)]),new ast_gml_node_def_ctr("FieldSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("field",13),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("FieldAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("field",13),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Env",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("v",10)]),new ast_gml_node_def_ctr("EnvSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("EnvAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("EnvFd",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("v",10)]),new ast_gml_node_def_ctr("EnvFdSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("EnvFdAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Env1d",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("index",0)]),new ast_gml_node_def_ctr("Env1dSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Env1dAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("v",10),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Alarm",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("index",0)]),new ast_gml_node_def_ctr("AlarmSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("AlarmAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Index",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index",0)]),new ast_gml_node_def_ctr("IndexSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("IndexAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Index2d",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0)]),new ast_gml_node_def_ctr("Index2dSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Index2dAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("RawId",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index",0)]),new ast_gml_node_def_ctr("RawIdSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("RawIdAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("RawId2d",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0)]),new ast_gml_node_def_ctr("RawId2dSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("RawId2dAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("arr",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("DsList",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("list",0),new ast_gml_node_def_param("index",0)]),new ast_gml_node_def_ctr("DsListSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("list",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("DsListAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("list",0),new ast_gml_node_def_param("index",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("DsMap",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("map",0),new ast_gml_node_def_param("key",0)]),new ast_gml_node_def_ctr("DsMapSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("map",0),new ast_gml_node_def_param("key",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("DsMapAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("map",0),new ast_gml_node_def_param("key",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("DsGrid",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("grid",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0)]),new ast_gml_node_def_ctr("DsGridSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("grid",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("DsGridAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("grid",0),new ast_gml_node_def_param("index1",0),new ast_gml_node_def_param("index2",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("KeyId",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("key",0)]),new ast_gml_node_def_ctr("KeyIdSet",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("key",0),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("KeyIdAop",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("obj",0),new ast_gml_node_def_param("key",0),new ast_gml_node_def_param("op",9),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("VarDecl",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("name",13),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Block",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("nodes",1)]),new ast_gml_node_def_ctr("IfThen",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("cond",0),new ast_gml_node_def_param("then",0),new ast_gml_node_def_param("not",0)]),new ast_gml_node_def_ctr("Ternary",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("cond",0),new ast_gml_node_def_param("then",0),new ast_gml_node_def_param("not",0)]),new ast_gml_node_def_ctr("Switch",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("expr",0),new ast_gml_node_def_param("cases",4),new ast_gml_node_def_param("def",0)]),new ast_gml_node_def_ctr("Wait",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("time",0)]),new ast_gml_node_def_ctr("Fork",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("While",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("cond",0),new ast_gml_node_def_param("loop",0)]),new ast_gml_node_def_ctr("DoUntil",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("loop",0),new ast_gml_node_def_param("cond",0)]),new ast_gml_node_def_ctr("DoWhile",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("loop",0),new ast_gml_node_def_param("cond",0)]),new ast_gml_node_def_ctr("Repeat",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("times",0),new ast_gml_node_def_param("loop",0)]),new ast_gml_node_def_ctr("For",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("pre",0),new ast_gml_node_def_param("cond",0),new ast_gml_node_def_param("post",0),new ast_gml_node_def_param("loop",0)]),new ast_gml_node_def_ctr("With",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("ctx",0),new ast_gml_node_def_param("loop",0)]),new ast_gml_node_def_ctr("Once",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("loop",0)]),new ast_gml_node_def_ctr("Return",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("val",0)]),new ast_gml_node_def_ctr("Exit",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Break",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Continue",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("Debugger",[new ast_gml_node_def_param("pos",2)]),new ast_gml_node_def_ctr("TryCatch",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("block",0),new ast_gml_node_def_param("capvar",13),new ast_gml_node_def_param("catcher",0)]),new ast_gml_node_def_ctr("Throw",[new ast_gml_node_def_param("pos",2),new ast_gml_node_def_param("err",0)])];
globalvar ast_gml_node_tools_ni_concat_pos_pos; /// @is {gml_pos}
globalvar gml_script_index_offset; /// @is {int}
if(live_enabled)gml_script_index_offset=0;
globalvar gml_source_unknown; /// @is {gml_source}
if(live_enabled)gml_source_unknown=gml_source_init_unknown();
globalvar gml_source_builtin; /// @is {gml_source}
if(live_enabled)gml_source_builtin=gml_source_init_builtin();
/// @typedef {array} gml_token
globalvar data_gml_keyword_mapper_map; /// @is {tools_Dictionary<data_GmlKeywordMapperFunc>}
if(live_enabled)data_gml_keyword_mapper_map=data_gml_keyword_mapper_init();
globalvar gml_seek_eval_error_text; /// @is {string}
globalvar gml_seek_eval_error_pos; /// @is {gml_pos}
globalvar gml_seek_eval_eval_rec; /// @is {bool}
globalvar gml_seek_eval_eval_thread; /// @is {gml_thread}
if(live_enabled)gml_seek_eval_eval_thread=undefined;
globalvar gml_seek_eval_eval_actions; /// @is {gml_action_list}
if(live_enabled)gml_seek_eval_eval_actions=ds_list_create();
globalvar gml_seek_eval_invalid_value; /// @is {any}
if(live_enabled)gml_seek_eval_invalid_value=[];
globalvar gml_seek_set_op_resolve_set_op_safe; /// @is {bool}
globalvar gml_seek_set_op_resolve_set_op_xw; /// @is {ast_GmlNode}
globalvar gml_std_gml_internal_ArrayImpl_join_buf; /// @is {buffer}
if(live_enabled)gml_std_gml_internal_ArrayImpl_join_buf=undefined;
globalvar gml_std_haxe_boot_isJS; /// @is {bool}
if(live_enabled)gml_std_haxe_boot_isJS=os_browser!=browser_not_a_browser;
globalvar live_live_sprites; /// @is {ds_map<sprite; bool>}
if(live_enabled)live_live_sprites=ds_map_create();
globalvar live_live_sprites_start; /// @is {ds_list<sprite>}
if(live_enabled)live_live_sprites_start=ds_list_create();
globalvar live_live_sprites_stop; /// @is {ds_list<sprite>}
if(live_enabled)live_live_sprites_stop=ds_list_create();
globalvar live_live_point_paths; /// @is {ds_map<path; bool>}
if(live_enabled)live_live_point_paths=ds_map_create();
globalvar live_live_point_paths_start; /// @is {ds_list<path>}
if(live_enabled)live_live_point_paths_start=ds_list_create();
globalvar live_live_point_paths_stop; /// @is {ds_list<path>}
if(live_enabled)live_live_point_paths_stop=ds_list_create();
globalvar live_live_anim_curves; /// @is {ds_map<animcurve; int>}
if(live_enabled)live_live_anim_curves=ds_map_create();
globalvar live_live_anim_curves_start; /// @is {ds_list<animcurve>}
if(live_enabled)live_live_anim_curves_start=ds_list_create();
globalvar live_live_anim_curves_stop; /// @is {ds_list<animcurve>}
if(live_enabled)live_live_anim_curves_stop=ds_list_create();
globalvar live_live_included_files; /// @is {ds_map<string; live_GMLiveIncludedFilePair>}
if(live_enabled)live_live_included_files=ds_map_create();
globalvar live_live_included_files_start; /// @is {ds_list<string>}
if(live_enabled)live_live_included_files_start=ds_list_create();
globalvar live_live_included_files_stop; /// @is {ds_list<string>}
if(live_enabled)live_live_included_files_stop=ds_list_create();
globalvar live_live_room; /// @is {room}
if(live_enabled)live_live_room=-1;
globalvar live_live_room_data; /// @is {ds_map<room; string>}
if(live_enabled)live_live_room_data=ds_map_create();
globalvar live_live_rooms; /// @is {ds_map<room; bool>}
if(live_enabled)live_live_rooms=ds_map_create();
globalvar live_live_rooms_start; /// @is {ds_list<room>}
if(live_enabled)live_live_rooms_start=ds_list_create();
globalvar live_live_rooms_stop; /// @is {ds_list<room>}
if(live_enabled)live_live_rooms_stop=ds_list_create();
globalvar live_blank_object; /// @is {object}
if(live_enabled)live_blank_object=-1;
globalvar live_blank_room; /// @is {room}
if(live_enabled)live_blank_room=-1;
globalvar live_sprite_updated; /// @is {function<sprite;void>}
if(live_enabled)live_sprite_updated=live_default_update;
globalvar live_path_updated; /// @is {function<path;void>}
if(live_enabled)live_path_updated=live_default_update;
globalvar live_animcurve_updated; /// @is {function<animcurve;void>}
if(live_enabled)live_animcurve_updated=live_default_update;
globalvar live_code_updated; /// @is {function<name:string;displayName:string;void>}
if(live_enabled)live_code_updated=live_default_update;
globalvar live_room_updated; /// @is {function<room;void>}
if(live_enabled)live_room_updated=live_room_updated_impl;
globalvar live_last_warn_at; /// @is {number}
if(live_enabled)live_last_warn_at=0;
globalvar live_auto_call_data; /// @is {live_cache_data}
globalvar live_async_http_1_found; /// @is {tools_Dictionary<bool>}
if(live_enabled)live_async_http_1_found={}
globalvar live_async_http_1_acc; /// @is {sf_ds_ArrayList<gml_source>}
if(live_enabled)live_async_http_1_acc=ds_list_create();
globalvar live_gmlive_patcher_error_text; /// @is {string}
globalvar live_shader_updated; /// @is {function<shader;string;string;void>}
if(live_enabled)live_shader_updated=live_shader_updated_default;
globalvar live_shader_live_shaders; /// @is {ds_map<shader; bool>}
if(live_enabled)live_shader_live_shaders=ds_map_create();
globalvar live_shader_live_shaders_start; /// @is {ds_list<shader>}
if(live_enabled)live_shader_live_shaders_start=ds_list_create();
globalvar live_shader_live_shaders_stop; /// @is {ds_list<shader>}
if(live_enabled)live_shader_live_shaders_stop=ds_list_create();
globalvar vm_v2_gml_thread_v2_handlers; /// @is {array<vm_v2_GmlThreadProc>}
globalvar live_log_impl_levels; /// @is {array<string>}
if(live_enabled)live_log_impl_levels=["info","WARN","ERROR"];
globalvar live_is_ready; /// @is {bool}
if(live_enabled)live_is_ready=false;
globalvar live_request_url; /// @is {string}
if(live_enabled)live_request_url=undefined;
globalvar live_request_guid; /// @is {live_yy_YyGUID}
if(live_enabled)live_request_guid=undefined;
globalvar live_request_id; /// @is {http}
if(live_enabled)live_request_id=undefined;
globalvar live_config; /// @is {string}
if(live_enabled)live_config=undefined;
globalvar live_runtime_version; /// @is {string}
if(live_enabled)live_runtime_version="";
globalvar live_build_date; /// @is {number}
if(live_enabled)live_build_date=0;
globalvar live_request_time; /// @is {number}
if(live_enabled)live_request_time=-100000;
globalvar live_request_rate; /// @is {number}
if(live_enabled)live_request_rate=1;
globalvar live_request_password; /// @is {string}
if(live_enabled)live_request_password="";
globalvar live_result; /// @is {any}
if(live_enabled)live_result="";
globalvar live_allow_trailing_args; /// @is {bool}
if(live_enabled)live_allow_trailing_args=true;
globalvar live_init_timeout; /// @is {int}
if(live_enabled)live_init_timeout=30;
globalvar live_init_attempts; /// @is {int}
if(live_enabled)live_init_attempts=5;
globalvar live_directory; /// @is {string}
globalvar live_live_map; /// @is {tools_Dictionary<live_cache_data>}
if(live_enabled)live_live_map={}
globalvar live_live_enums; /// @is {tools_Dictionary<gml_source>}
if(live_enabled)live_live_enums={}
globalvar live_live_macros; /// @is {tools_Dictionary<gml_source>}
if(live_enabled)live_live_macros={}
globalvar live_live_globals; /// @is {gml_source}
if(live_enabled)live_live_globals=undefined;
globalvar live_temp_path; /// @is {string}
if(live_enabled)live_temp_path=live_temp_path_init();
globalvar live_log_script; /// @is {function<string;live_GMLiveLogLevel;void>}
if(live_enabled)live_log_script=live_log_impl;
globalvar live_update_script; /// @is {function<string;string;string;void>}
if(live_enabled)live_update_script=live_update_script_impl;
globalvar live_name; /// @is {string}
if(live_enabled)live_name=undefined;
globalvar live_custom_self; /// @is {any}
if(live_enabled)live_custom_self=undefined;
globalvar live_custom_other; /// @is {any}
if(live_enabled)live_custom_other=undefined;
globalvar live_last_update_at; /// @is {number}
if(live_enabled)live_last_update_at=0;
globalvar live_warned_about_init_timeout; /// @is {bool}
if(live_enabled)live_warned_about_init_timeout=false;
globalvar live_room_loader_object_cache; /// @is {ds_map<string; object>}
if(live_enabled)live_room_loader_object_cache=ds_map_create();
globalvar live_room_loader_sprite_cache; /// @is {ds_map<string; sprite>}
if(live_enabled)live_room_loader_sprite_cache=ds_map_create();
globalvar live_room_loader_use_physics; /// @is {bool}
if(live_enabled)live_room_loader_use_physics=false;
globalvar live_room_loader_room_x; /// @is {number}
if(live_enabled)live_room_loader_room_x=0;
globalvar live_room_loader_room_y; /// @is {number}
if(live_enabled)live_room_loader_room_y=0;
globalvar live_room_loader_apply_backgrounds; /// @is {bool}
if(live_enabled)live_room_loader_apply_backgrounds=true;
globalvar live_room_loader_apply_instances; /// @is {bool}
if(live_enabled)live_room_loader_apply_instances=true;
globalvar live_room_loader_apply_tiles; /// @is {bool}
if(live_enabled)live_room_loader_apply_tiles=true;
globalvar live_room_loader_apply_views; /// @is {bool}
if(live_enabled)live_room_loader_apply_views=true;
globalvar live_room_loader_apply_settings; /// @is {bool}
if(live_enabled)live_room_loader_apply_settings=true;
globalvar live_room_loader_apply_sprites; /// @is {bool}
if(live_enabled)live_room_loader_apply_sprites=true;
globalvar live_room_loader_apply_filters; /// @is {bool}
if(live_enabled)live_room_loader_apply_filters=true;
globalvar live_room_loader_inst_map_gml; /// @is {ds_map<string; instance>}
if(live_enabled)live_room_loader_inst_map_gml=ds_map_create();
globalvar live_room_loader_inst_map_yy; /// @is {ds_map<string; live_yy_YyRoomInstance>}
if(live_enabled)live_room_loader_inst_map_yy=ds_map_create();
globalvar gml_thread_current_kind; /// @is {vm_GmlThreadKind}
if(live_enabled)gml_thread_current_kind=0;
globalvar vm_gml_thread_exec_slice_funcs; /// @is {array<vm_GmlThreadExecSliceFunc>}
globalvar gml_type_check_map; /// @is {tools_Dictionary<gml_type_check>}
if(live_enabled)gml_type_check_map=gml_type_check_init();
globalvar vm__gml_with_data_gml_with_data_impl__pools; /// @is {array<vm__GmlWithData_GmlWithPool>}
if(live_enabled)vm__gml_with_data_gml_with_data_impl__pools=vm__gml_with_data_gml_with_data_impl__init();
globalvar gml_type_ref_root; /// @is {gml_type_ref}
if(live_enabled)gml_type_ref_root=gml_type_ref_init();
globalvar vm_impl_gml_thread_construct_funcs; /// @is {array<function<any;array<any>;int;any>>}
globalvar vm_group_call_call_func_result; /// @is {any}
globalvar vm_group_call_call_func_status; /// @is {gml_thread_proc_result}
globalvar vm_v2_gml_thread_group_call_gml23_funcs; /// @is {array<vm_v2_GmlThreadGroupCallGML_func>}
if(live_enabled)vm_v2_gml_thread_group_call_gml23_funcs=vm_v2_gml_thread_group_call_gml23_init();
globalvar vm_group_op_funcs; /// @is {array<function<any;any;any>>}

if(live_enabled){
	live_validate_scripts();
	gml_parser_set_version(23);
	live_bits_gmlive_ready_run();
	live_preinit_api();
	live_preinit_project();
}

/// @typedef {function<th:gml_thread;act:gml_action;scope:gml_thread_scope;stack:gml_stack<any>;gml_thread_proc_result>} vm_v2_GmlThreadProc
/// @typedef {int} gml_thread_proc_result
/// @typedef {function<th:gml_thread;act:gml_action;func:any;array:array<any>;arrOffset:int;argc:int;bool>} vm_v2_GmlThreadGroupCallGML_func
/// @typedef {function<th:gml_thread;act:vm_v2_gml_action_closure<T>;scope:gml_thread_scope;st:gml_stack<any>;gml_thread_proc_result>} vm_v2_GmlActionClosureFunc
/// @typedef {ds_stack<array<any>>} vm__GmlWithData_GmlWithPool
/// @typedef {any} vm_GmlWithDataImpl
/// @typedef {any} vm_GmlWithData
/// @typedef {ds_map<K; V>} vm_GmlValueMap
/// @typedef {function<any;string>} gml_type_check
/// @typedef {any} vm_GmlThreadTimeTag
/// @typedef {int} gml_thread_status
/// @typedef {function<fn:any;argv:array<any>;offset:int;any>} vm_GmlThreadExecSliceFunc
/// @typedef {int} vm_GmlThreadKind
/// @typedef {ds_list<T>} gml_action_list
/// @typedef {array} gml_stack
/// @typedef {any} tools_Dictionary
/// @typedef {ds_list} tools_ArrayList
/// @typedef {ds_list<T>} sf_ds_ArrayList
/// @typedef {any} live_yy_YyRoomPhySettings
/// @typedef {any} live_yy_YyRoomLayer
/// @typedef {any} live_yy_YyRoomInstance
/// @typedef {any} live_yy_YyRoom
/// @typedef {string} live_yy_YyGUID
/// @typedef {int} live_GMLiveLogLevel
/// @typedef {ds_map<K; V>} live_GMLiveAsyncMap
/// @typedef {any} live_GMLiveIncludedFilePair
/// @typedef {array<T>} haxe_ds__Vector_VectorData
/// @typedef {function<pos:gml_pos;gml_token>} data_GmlKeywordMapperFunc
/// @typedef {int} data_GmlFuncFlags
/// @typedef {int} compile__GmlCompileArgs_GmlArgSimpleKind
/// @typedef {int} ast_GmlUnOp
/// @typedef {int} ast_GmlSourceId
/// @typedef {int} ast_GmlPosSource
/// @typedef {function<number;number;number>} ast_GmlOpFunc
/// @typedef {int} gml_op
/// @typedef {ds_list<T>} ast_GmlNodeList
/// @typedef {function<ast_GmlNode;tools_ArrayList<ast_GmlNode>;bool>} ast_GmlNodeIter
/// @typedef {int} ast_GmlNodeDefType
/// @typedef {any} ast_GmlNodeCase
/// @typedef {gml_pos} ast_GmlNodeData
/// @typedef {gml_node} ast_GmlNode
/// @typedef {function<obj:any;val:any;void>} api_ApiFastFieldSetter
/// @typedef {function<obj:any;any>} api_ApiFastFieldGetter
/// @typedef {buffer} GmlParserStringBuf
/// @typedef {ds_list<T>} GmlParserOut