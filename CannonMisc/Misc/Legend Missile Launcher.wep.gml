#define init
global.sprLegendMissileLauncher= sprite_add_weapon("sprites/sprLegendMissileLauncher.png", 5, 3);

#define weapon_name
return "LEGEND MISSILE LAUNCHER";

#define weapon_text
return "search and destroy but it looks cooler";

#define weapon_sprt
return global.sprLegendMissileLauncher;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 3;

#define weapon_load
return 22;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 25;

#define weapon_fire
repeat(5) {
	mod_script_call("mod","Misc Tools","create_legend_seeker_missile",x,y,other.gunangle+(random(72)-36)*other.accuracy,7.5+random(1.5))
}

weapon_post(6, 10, 2);