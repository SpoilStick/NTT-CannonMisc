#define init
global.sprLegendInfiltrator= sprite_add_weapon("sprites/sprLegendInfiltrator.png", 5, 3);

#define weapon_name
return "LEGEND INFILTRATOR";

#define weapon_text
return "trojan horse but pretty";

#define weapon_sprt
return global.sprLegendInfiltrator;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 15;

#define weapon_load
return 29;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 25;

#define weapon_fire
sound_play_gun(sndPopgun, 0.1, 0.6);

mod_script_call("mod","Misc Tools","create_legend_infiltrator",x,y,other.gunangle+(random(6)-3)*other.accuracy,15)

weapon_post(8, 7, 2);