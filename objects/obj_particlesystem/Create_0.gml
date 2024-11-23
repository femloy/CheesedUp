enum part
{
	enum_start, // not to be used
	
	cloudeffect,
	crazyrunothereffect,
	highjumpcloud1,
	highjumpcloud2,
	jumpdust,
	balloonpop,
	shotgunimpact,
	impact,
	genericpoofeffect,
	keyparticles,
	teleporteffect,
	landcloud,
	ratmountballooncloud,
	groundpoundeffect,
	noisegrounddash,
	bubblepop,
	
	enum_length // not to be used
}
enum part_type
{
	normal,
	fadeout
}

if (instance_number(obj_particlesystem) > 1)
{
	instance_destroy();
	exit;
}
depth = -99;
global.particle_system = part_system_create();
global.part_map = ds_map_create();
global.part_depth = ds_map_create();
global.part_emitter = part_emitter_create(global.particle_system);
global.debris_list = ds_list_create();
global.collect_list = ds_list_create();

var p = declare_particle(part.cloudeffect, spr_cloudeffect, 0.5, -4)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.crazyrunothereffect, spr_crazyrunothereffect, 0.5, -99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.highjumpcloud1, spr_highjumpcloud1, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.highjumpcloud2, spr_highjumpcloud2, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.jumpdust, spr_jumpdust, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.balloonpop, spr_balloonpop, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.shotgunimpact, spr_shotgunimpact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.impact, spr_impact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.genericpoofeffect, spr_genericpoofeffect, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.bubblepop, spr_antigrav_bubblepop, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.keyparticles, spr_keyparticles, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.teleporteffect, spr_teleporteffect, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.landcloud, spr_landcloud, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.noisegrounddash, spr_noisegrounddasheffect, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.ratmountballooncloud, spr_ratmountballooncloud, 0.7, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(part.groundpoundeffect, spr_groundpoundeffect, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
