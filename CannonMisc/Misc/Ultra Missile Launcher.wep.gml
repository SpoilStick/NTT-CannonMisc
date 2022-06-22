#define init
global.sprUltraMissileLauncher= sprite_add_weapon("sprites/sprUltraMissileLauncher.png", 5, 3);

#define weapon_name
return "ULTRA MISSILE LAUNCHER";

#define weapon_text
return "search and destroy, but green";

#define weapon_sprt
return global.sprUltraMissileLauncher;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 2;

#define weapon_load
return 22;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 19;

#define weapon_fire
if GameCont.rad >= 8
{
	GameCont.rad -= 8
	repeat(4) {
		mod_script_call("mod","Misc Tools","create_ultra_seeker_missile",x,y,other.gunangle+(random(50)-25)*other.accuracy,5.5+random(1.5))
	}
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
weapon_post(6, 10, 2);