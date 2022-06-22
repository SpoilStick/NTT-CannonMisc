#define init
global.sprMissileLauncher= sprite_add_weapon("sprites/sprMissileLauncher.png", 5, 3);

#define weapon_name
return "MISSILE LAUNCHER";

#define weapon_text
return "search and destroy";

#define weapon_sprt
return global.sprMissileLauncher;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 1;

#define weapon_load
return 22;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 9;

#define weapon_fire
repeat(3) {
	mod_script_call("mod","Misc Tools","create_seeker_missile",x,y,other.gunangle+(random(44)-22)*other.accuracy,3.5+random(1.5))
}

weapon_post(6, 10, 2);