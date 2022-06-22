#define init
global.sprSuperInfiltrator= sprite_add_weapon("sprites/sprSuperInfiltrator.png", 5, 3);

#define weapon_name
return "SUPER INFILTRATOR";

#define weapon_text
return "compacted trojan horse";

#define weapon_sprt
return global.sprSuperInfiltrator;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 9;

#define weapon_load
return 87;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 19;

#define weapon_fire
sound_play_gun(sndPopgun, 0.1, 0.6);

mod_script_call("mod","Misc Tools","create_super_infiltrator",x,y,other.gunangle+(random(10)-5)*other.accuracy,8)

weapon_post(8, 7, 2);