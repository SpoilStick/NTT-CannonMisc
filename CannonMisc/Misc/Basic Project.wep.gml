#define init
global.sprProject= sprite_add_weapon("sprites/sprProject.png", 1, 4);

#define weapon_name
return "BASIC PROJECT";

#define weapon_text
return "basic knowledge";

#define weapon_sprt
return global.sprProject;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_cost
return 3;

#define weapon_load
return 50;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 6;

#define weapon_fire
sound_play_gun(sndPopgun, 0.1, 0.6);

mod_script_call("mod","Misc Tools","create_basic_project",x,y,other.gunangle+random(2)-1*other.accuracy,10)

weapon_post(1, 1, 2);