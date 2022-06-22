#define init
global.sprAstralFire= sprite_add_weapon("sprites/sprAstralFire.png", 5, 3);

#define weapon_name
return "ASTRAL FIRE";

#define weapon_text
return "heavenly trojan horse";

#define weapon_sprt
return global.sprAstralFire;

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
return 30;

#define weapon_fire
sound_play_gun(sndPopgun, 0.1, 0.6);

mod_script_call("mod","Misc Tools","create_astral_fire",x,y,other.gunangle+(random(10)-5)*other.accuracy,16)

weapon_post(8, 7, 2);