///// NTU ULTRA SEEKER PISTOL.wep.gml
#define init
global.sprUltraSeekerPistol = sprite_add_weapon("sprites/sprUltraSeekerPistol.png", 5, 3);
#define weapon_name
return "ULTRA SEEKER PISTOL";
#define weapon_type
return 3;
#define weapon_auto
return 0;
#define weapon_cost
return 2;
#define weapon_load
return 16;
#define weapon_sprt
return global.sprUltraSeekerPistol;
#define weapon_area
return 18;
#define weapon_swap
return sndSwapBow;
#define weapon_text
return "I see green";
#define weapon_fire
sound_play(sndSeekerShotgun);
if GameCont.rad >= 22
{
	GameCont.rad -= 22
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 - 10 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 + 10 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 - 20 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 + 20 * other.accuracy, 4 + random(3))
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

weapon_post(-6, -30, 6);