///// NTU ULTRA SEEKER PISTOL.wep.gml
#define init
global.sprUltraSeekerShotgun= sprite_add_weapon("sprites/sprUltraSeekerShotgun.png", 5, 3);
#define weapon_name
return "ULTRA SEEKER PISTOL";
#define weapon_type
return 3;
#define weapon_auto
return 0;
#define weapon_cost
return 6;
#define weapon_load
return 28;
#define weapon_sprt
return global.sprUltraSeekerShotgun;
#define weapon_area
return 22;
#define weapon_swap
return sndSwapBow;
#define weapon_text
return "I see green";
#define weapon_fire
sound_play(sndSeekerShotgun);
if GameCont.rad >= 33
{
	GameCont.rad -= 33
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 - 15 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 + 15 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 - 30 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 + 30 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 - 45 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 + 45 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 - 60 * other.accuracy, 4 + random(3))
	mod_script_call("mod", "Misc Tools", "create_ultra_seeker", x, y, other.gunangle + random(20) - 10 + 60 * other.accuracy, 4 + random(3))
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
weapon_post(-7, -30, 8);