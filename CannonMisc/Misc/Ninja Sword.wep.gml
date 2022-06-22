#define init
global.sprNinjaSword= sprite_add_weapon("sprites/sprNinjaSword.png", 3, 3);
#define weapon_name
return "NINJA SWORD";
#define weapon_type
return 0;
#define weapon_auto
return 0;
#define weapon_cost
return 0;
#define weapon_load
return 10;
#define weapon_sprt
return global.sprNinjaSword;
#define weapon_area
return 30;
#define weapon_swap
return sndSwapSword;
#define weapon_text
return "many ninjas";
#define weapon_fire
instance_create(x, y, Dust);
with instance_create(x + lengthdir_x(skill_get(13) * 20 + 20, other.gunangle), y + lengthdir_y(skill_get(13) * 20 + 20, other.gunangle), GuitarSlash) {
	motion_add(other.gunangle, 4 + 4 * skill_get(13));
	image_angle = direction;
	team = other.team;
	creator = other;
	damage = 36 + skill_get(13) * 18
	image_blend = c_black
}
with instance_create(x + lengthdir_x(skill_get(13) * 10 + 10, other.gunangle), y + lengthdir_y(skill_get(13) * 10 + 10, other.gunangle), GuitarSlash) {
	motion_add(other.gunangle, 3 + 3 * skill_get(13));
	image_angle = direction;
	team = other.team;
	creator = other;
	damage = 36 + skill_get(13) * 18
	image_blend = c_black
}
with instance_create(x + lengthdir_x(skill_get(13), other.gunangle), y + lengthdir_y(skill_get(13), other.gunangle), GuitarSlash) {
	motion_add(other.gunangle, 2 + 2 * skill_get(13));
	image_angle = direction;
	team = other.team;
	creator = other;
	damage = 36 + skill_get(13) * 18
	image_blend = c_black
}
wepangle = -wepangle;
motion_add(gunangle,4)
weapon_post(-6, 9, 2);