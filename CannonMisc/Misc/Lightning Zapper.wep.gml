#define init
global.sprZapper= sprite_add_weapon("sprites/sprZapper.png", 1, 3);

#define weapon_name
return "LIGHTNING ZAPPER";

#define weapon_text
return "fun to use";

#define weapon_sprt
return global.sprZapper;

#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_cost
return 2;

#define weapon_load
return 11;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 7;

#define weapon_fire
if skill_get(17) sound_play_gun(sndLightningPistolUpg, 0.15, 0.6);
else sound_play_gun(sndLightningPistol, 0.15, 0.6);

with mod_script_call("mod","Misc Tools","create_zap_lightning",x,y)
{
	creator = other.id
	direction = other.aimDirection
	image_angle = direction
	team = other.team
	alarm1=1;
	ammo = 60;
	visible = 0;
	with instance_create(x,y,LightningSpawn)
	image_angle = other.image_angle;
}

weapon_post(5, 10, 4);