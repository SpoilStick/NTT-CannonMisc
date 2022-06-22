#define init
global.sprUltraInfiltrator= sprite_add_weapon("sprites/sprUltraInfiltrator.png", 5, 3);

#define weapon_name
return "ULTRA INFILTRATOR";

#define weapon_text
return "green trojan horse";

#define weapon_sprt
return global.sprUltraInfiltrator;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 9;

#define weapon_load
return 29;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 19;

#define weapon_fire
sound_play_gun(sndPopgun, 0.1, 0.6);
if GameCont.rad >= 40
{
	GameCont.rad -= 40
	mod_script_call("mod","Misc Tools","create_ultra_infiltrator",x,y,other.gunangle+(random(4)-2)*other.accuracy,13)
}
else
{
	sound_play(sndUltraEmpty)
	ammo[2] += 10
	with instance_create(x,y,PopupText)
	{
		mytext = "NOT ENOUGH RADS"
	}
}
weapon_post(8, 7, 2);