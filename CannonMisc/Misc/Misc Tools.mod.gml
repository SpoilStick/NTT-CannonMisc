#define init
//load stuff here
global.sprHomingMissile = sprite_add("sprites/sprHomingMissile.png", 4, 8, 8);
global.sprUltraHomingMissile = sprite_add("sprites/sprUltraHomingMissile.png", 4, 8, 8);
global.sprLegendHomingMissile = sprite_add("sprites/sprLegendHomingMissile.png", 4, 8, 8);
global.sprInfiltratorGrenade = sprite_add("sprites/sprInfiltratorGrenade.png", 1, 3, 3);
global.sprUltraInfiltratorGrenade = sprite_add("sprites/sprUltraInfiltratorGrenade.png", 1, 3, 3);
global.sprLegendInfiltratorGrenade = sprite_add("sprites/sprLegendInfiltratorGrenade.png", 1, 3, 3);
global.sprSuperInfiltratorGrenade = sprite_add("sprites/sprSuperInfiltratorGrenade.png", 1, 4.5, 4.5);
global.sprAstralFireGrenade = sprite_add("sprites/sprAstralFireGrenade.png", 1, 4.5, 4.5);

global.sprPsyBullet = sprite_add("sprites/sprPsyBullet.png", 2, 8, 8)
global.mskPsyBullet = sprite_add("sprites/sprPsyBulletMask.png", 0, 7, 3)
global.sprPsyBulletHit = sprite_add("sprites/sprPsyBulletHit.png", 4, 8, 8)

global.sprScienceOrb = sprite_add("sprites/sprScienceOrb.png", 1, 12, 12)

global.sprUltraSeekerBolt = sprite_add("sprites/sprUltraSeekerBolt.png", 2, 15/2, 15/2)

#define bullet_hit
projectile_hit(other, damage, force, direction);
instance_destroy()

#define bullet_step
if image_index = 1{
	image_speed = 0
}

#define bullet_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);

#define create_psy_bullet(_x,_y,_a,_s)
with instance_create(_x,_y,CustomProjectile) {
	name = "Psy Bullet"
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprPsyBullet
	mask_index = global.mskPsyBullet
	hitid = [global.sprPsyBullet, "PSY BULLET"]
	image_speed = 1
	damage = 6
	force = 10
	typ = 2
	recycle_amount = 2
	
	timer = 11 + irandom(8)
	maxspeed = 5
	
	on_step = script_ref_create(psy_step)
	on_destroy = script_ref_create(psy_destroy)
	on_hit = script_ref_create(bullet_hit)
	on_draw = script_ref_create(bullet_draw)
}

#define create_seeker_missile(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "SeekerMissile";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprHomingMissile;
	mask_index = mskSeeker;
	hitid = [global.sprHomingMissile, "MISSILE"];
	image_speed = 0.4;
	damage = 2;
	force = 6;
	typ = 2;
	alarm0 = 180;

	bounce = 1
	alarm0 = 35
	hp = 5
	
	on_step = script_ref_create(missil_step);
	on_wall = script_ref_create(missil_wall);
	on_draw = script_ref_create(missil_draw);
	on_destroy = script_ref_create(missil_destroy);
}

#define create_ultra_seeker_missile(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "UltraSeekerMissile";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprUltraHomingMissile;
	mask_index = mskSeeker;
	hitid = [global.sprUltraHomingMissile, "ULTRA MISSILE"];
	image_speed = 0.4;
	damage = 14;
	force = 9;
	typ = 2;
	alarm0 = 180;

	bounce = 1
	alarm0 = 35
	hp = 8

	on_step = script_ref_create(ultra_missil_step);
	on_wall = script_ref_create(ultra_missil_wall);
	on_draw = script_ref_create(ultra_missil_draw);
	on_destroy = script_ref_create(ultra_missil_destroy);
}

#define create_legend_seeker_missile(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "LegendSeekerMissile";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprLegendHomingMissile;
	mask_index = mskSeeker;
	hitid = [global.sprLegendHomingMissile, "LEGEND MISSILE"];
	image_speed = 0.4;
	damage = 38;
	force = 12;
	typ = 2;
	alarm0 = 180;

	bounce = 5
	alarm0 = 35
	hp = 12

	on_step = script_ref_create(legend_missil_step);
	on_wall = script_ref_create(legend_missil_wall);
	on_draw = script_ref_create(legend_missil_draw);
	on_destroy = script_ref_create(legend_missil_destroy);
}

#define create_infiltrator(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "Infiltrator";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprInfiltratorGrenade;
	mask_index = sprGrenade;
	hitid = [global.sprInfiltratorGrenade, "INFILTRATOR"];
	friction = 0.1
	alarm1 = 6
	alarm0 = 45
	typ = 1
				
	on_step = script_ref_create(infilt_step);
	on_wall = script_ref_create(infilt_wall);
	on_hit = script_ref_create(infilt_hit);
	on_destroy = script_ref_create(infilt_destroy);
}

#define create_ultra_infiltrator(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "UltraInfiltrator";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprUltraInfiltratorGrenade;
	mask_index = sprGrenade;
	hitid = [global.sprUltraInfiltratorGrenade, "ULTRA INFILTRATOR"];
	friction = 0.075
	alarm1 = 6
	alarm0 = 45
	typ = 1
				
	on_step = script_ref_create(ultra_infilt_step);
	on_wall = script_ref_create(ultra_infilt_wall);
	on_hit = script_ref_create(ultra_infilt_hit);
	on_destroy = script_ref_create(ultra_infilt_destroy);
}

#define create_legend_infiltrator(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "LegendInfiltrator";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprLegendInfiltratorGrenade;
	mask_index = sprGrenade;
	hitid = [global.sprLegendInfiltratorGrenade, "LEGEND INFILTRATOR"];
	friction = 0.05
	alarm1 = 6
	alarm0 = 45
	typ = 1
				
	on_step = script_ref_create(legend_infilt_step);
	on_wall = script_ref_create(legend_infilt_wall);
	on_hit = script_ref_create(legend_infilt_hit);
	on_destroy = script_ref_create(legend_infilt_destroy);
}

#define create_super_infiltrator(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "Super Infiltrator";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprSuperInfiltratorGrenade;
	mask_index = sprGrenade;
	hitid = [global.sprSuperInfiltratorGrenade, "SUPER INFILTRATOR"];
	friction = 0.1
	alarm1 = 6
	alarm0 = 45
	typ = 1
				
	on_step = script_ref_create(super_infilt_step);
	on_wall = script_ref_create(super_infilt_wall);
	on_hit = script_ref_create(super_infilt_hit);
	on_destroy = script_ref_create(super_infilt_destroy);
}

#define create_astral_fire(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "Astral Fire";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprAstralFireGrenade;
	mask_index = sprGrenade;
	hitid = [global.sprAstralFireGrenade, "ASTRAL FIRE"];
	friction = 0.1
	alarm1 = 6
	alarm0 = 45
	typ = 1
				
	on_step = script_ref_create(astral_infilt_step);
	on_wall = script_ref_create(astral_infilt_wall);
	on_hit = script_ref_create(astral_infilt_hit);
	on_destroy = script_ref_create(astral_infilt_destroy);
}

#define create_basic_project(_x,_y,_a,_s)
with instance_create(_x,_y,CustomProjectile) {
	name = "Basic Orb";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprScienceOrb;
	mask_index = mskNone;
	//mask_index = mskPlasma;	does not go through walls -____-
	hitid = [global.sprScienceOrb, "BASIC ORB"];
	image_speed = 0;
	damage = 0;
	force = 0;
	typ = 0;

	bladerot = 0
	bladespd = 0
	bladego = 2
	
	al0 = 160
	al1 = 50
	al2 = 30+ceil(random(10))

	z = 0
	canmove = 0
	max_speed = 2;
	timer = 400

	on_step = script_ref_create(basic_project_step);
	on_draw = script_ref_create(basic_project_draw);
	on_destroy = script_ref_create(basic_project_destroy);
}

#define create_science_project(_x,_y,_a,_s)
with instance_create(_x,_y,CustomProjectile) {
	name = "Science Orb";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprScienceOrb;
	mask_index = mskNone;
	//mask_index = mskPlasma;	does not go through walls -____-
	hitid = [global.sprScienceOrb, "SCIENCE ORB"];
	image_speed = 0;
	damage = 0;
	force = 0;
	typ = 0;

	bladerot = 0
	bladespd = 0
	bladego = 2
	
	al0 = 160
	al1 = 50
	al2 = 30+ceil(random(10))

	z = 0
	canmove = 0
	max_speed = 2;
	timer = 500

	on_step = script_ref_create(science_project_step);
	on_draw = script_ref_create(science_project_draw);
	on_destroy = script_ref_create(science_project_destroy);
}

#define create_advanced_project(_x,_y,_a,_s)
with instance_create(_x,_y,CustomProjectile) {
	name = "Advanced Orb";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprScienceOrb;
	mask_index = mskNone;
	//mask_index = mskPlasma;	does not go through walls -____-
	hitid = [global.sprScienceOrb, "ADVANCED ORB"];
	image_speed = 0;
	damage = 0;
	force = 0;
	typ = 0;

	bladerot = 0
	bladespd = 0
	bladego = 2
	
	al0 = 160
	al1 = 50
	al2 = 30+ceil(random(10))

	z = 0
	canmove = 0
	max_speed = 2;
	timer = 500

	on_step = script_ref_create(advanced_project_step);
	on_draw = script_ref_create(advanced_project_draw);
	on_destroy = script_ref_create(advanced_project_destroy);
}

#define create_ninja_project(_x,_y,_a,_s)
with instance_create(_x,_y,CustomProjectile) {
	name = "Archimedes Sphere";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprScienceOrb;
	mask_index = mskNone;
	//mask_index = mskPlasma;	does not go through walls -____-
	hitid = [global.sprScienceOrb, "ARCHIMEDES SPHERE"];
	image_speed = 0;
	damage = 0;
	force = 0;
	typ = 0;

	bladerot = 0
	bladespd = 0
	bladego = 2
	
	al0 = 160
	al1 = 50
	al2 = 30+ceil(random(10))

	z = 0
	canmove = 0
	max_speed = 2;
	timer = 600

	on_step = script_ref_create(ninja_project_step);
	on_draw = script_ref_create(ninja_project_draw);
	on_destroy = script_ref_create(ninja_project_destroy);
}

#define create_ultra_seeker(_x,_y,_a,_s)
with instance_create(_x, _y, CustomProjectile) {
	name = "UltraSeeker";
	motion_add(_a,_s)
	image_angle = direction
	team = other.team
	creator = other
	sprite_index = global.sprUltraSeekerBolt
	mask_index = mskSeeker;
	hitid = [global.sprUltraSeekerBolt, "ULTRA SEEKER"];
	image_speed = 0.4;
	damage = 20;
	force = 6;
	typ = 3;
	alarm0 = 180;
	
	on_step = script_ref_create(ultra_seeker_step);
	on_wall = script_ref_create(ultra_seeker_wall);
	on_draw = script_ref_create(ultra_seeker_draw);
	on_destroy = script_ref_create(ultra_seeker_destroy);
}
#define create_zap_lightning(_x,_y)
with instance_create(_x, _y, CustomProjectile) {
	name = "ZapLightning";
	sprite_index = sprLightning;
	mask_index = mskLaser;
	hitid = [sprLightning, "ZAPPER"];
	typ = 0;
	damage = 7;
	force = 4;
	
	alarm1=-1
	image_speed = 0.4

	if skill_get(17) = true {
		image_speed = 0.3
	}
	
	on_step = script_ref_create(zap_step);
	on_anim = script_ref_create(zap_anim);
	on_draw = script_ref_create(zap_draw);
	on_hit = script_ref_create(zap_hit);
	on_wall = script_ref_create(zap_wall);
}

#define missil_step
var target;
target=instance_nearest(x,y,enemy)
if target!=noone {
    if !collision_line(x,y,target.x,target.y,Wall,1,1) {
    var targetdir, targetdist, changedir;
    targetdir=point_direction(x,y,target.x,target.y)
    targetdist=max(6,point_distance(x,y,target.x,target.y))+(0.04*power(abs(angle_difference(direction,targetdir)),1.2))
    targetdist/=2
    changedir=clamp(angle_difference(direction,targetdir),-360/targetdist,360/targetdist)
    direction-=changedir;
}}
direction+=4-random(8)
image_angle=direction

if random(5) < 1 && visible=1 
instance_create(xprevious,yprevious,Dust)

if hp<=0 {instance_destroy(); exit}

//alarms
alarm0-=1
if alarm0=0 {bounce=0}

//collisions
if place_meeting(x,y,Explosion) {hp-=1}

#define missil_wall
instance_create(x,y,Dust)
if bounce = 1 {
    move_bounce_solid(1)
    bounce = 0
}
else {instance_destroy()}

#define missil_draw
draw_sprite_ext(sprScrapBossMissileTrail,-1,x,y,1,1,direction,c_white,1)
draw_self()

#define missil_destroy
sound_play(sndExplosionS)
instance_create(x-1+random(2),y-1+random(2),SmallExplosion)

#define ultra_missil_step
var target;
target=instance_nearest(x,y,enemy)
if target!=noone {
    if !collision_line(x,y,target.x,target.y,Wall,1,1) {
    var targetdir, targetdist, changedir;
    targetdir=point_direction(x,y,target.x,target.y)
    targetdist=max(6,point_distance(x,y,target.x,target.y))+(0.04*power(abs(angle_difference(direction,targetdir)),1.2))
    targetdist/=1.5
    changedir=clamp(angle_difference(direction,targetdir),-360/targetdist,360/targetdist)
    direction-=changedir;
}}
direction+=1-random(2)
image_angle=direction

if random(4) < 1 && visible=1 
instance_create(xprevious,yprevious,Dust)

if hp<=0 {instance_destroy(); exit}

//alarms
alarm0-=1
if alarm0=0 {bounce=0}

//collisions
if place_meeting(x,y,Explosion) {hp-=1}

#define ultra_missil_wall
instance_create(x,y,Dust)
if bounce = 1 {
    move_bounce_solid(1)
    bounce = 0
}
else {instance_destroy()}

#define ultra_missil_draw
draw_sprite_ext(sprScrapBossMissileTrail,-1,x,y,1,1,direction,c_white,1)
draw_self()

#define ultra_missil_destroy
sound_play(sndExplosionS)
ang = random(360)
with instance_create(x+lengthdir_x(16,ang),y+lengthdir_y(16,ang),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}
with instance_create(x+lengthdir_x(16,ang+120),y+lengthdir_y(16,ang+120),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}
with instance_create(x+lengthdir_x(16,ang+240),y+lengthdir_y(16,ang+240),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}

#define legend_missil_step
var target;
target=instance_nearest(x,y,enemy)
if target!=noone {
//    if !collision_line(x,y,target.x,target.y,Wall,1,1) {
    var targetdir, targetdist, changedir;
    targetdir=point_direction(x,y,target.x,target.y)
    targetdist=max(6,point_distance(x,y,target.x,target.y))+(0.04*power(abs(angle_difference(direction,targetdir)),1.2))
    targetdist/=2
    changedir=clamp(angle_difference(direction,targetdir),-360/targetdist,360/targetdist)
    direction-=changedir;
//}
}
direction+=3-random(6)
image_angle=direction

if random(5) < 1 && visible=1 
instance_create(xprevious,yprevious,Dust)

if hp<=0 {instance_destroy(); exit}

//alarms
alarm0-=1
if alarm0=0 {bounce=0}

//collisions
if place_meeting(x,y,Explosion) {hp-=1}

#define legend_missil_wall
instance_create(x,y,Dust)
if bounce > 0 {
    move_bounce_solid(1)
    bounce -= 1
}
else {instance_destroy()}

#define legend_missil_draw
draw_sprite_ext(sprScrapBossMissileTrail,-1,x,y,1,1,direction,c_white,1)
draw_self()

#define legend_missil_destroy
sound_play(sndExplosionS)
var ang = random(359)
with instance_create(x,y,Explosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang),y+lengthdir_y(16,ang),SmallExplosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang+120),y+lengthdir_y(16,ang+120),SmallExplosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang+240),y+lengthdir_y(16,ang+240),SmallExplosion) image_blend = c_yellow;

#define infilt_step

//collisions
if place_meeting(x,y,Explosion) {instance_destroy(); exit}
with(instances_matching(projectile,"object_index",Slash,GuitarSlash,BloodSlash,EnergySlash,EnergyHammerSlash,LightningSlash,EnemySlash)) {
	if place_meeting(x,y,other)
	with other
	{
		direction = other.direction
		speed = 12
		friction = 0.1
		alarm1 = 6
		sleep(40)
		view_shake_at(x, y, 3);
		with instance_create(x,y,Deflect) {
			image_angle = other.direction
		}
	}
}
with(instances_matching(projectile,"object_index",Shank,EnergyShank)) {
	with other
	{
		sleep(40)
		view_shake_at(x, y, 3);
		instance_destroy()
	}
}

//alarms
alarm1-=1
if alarm1=0 {
	friction = 0.4
	
	if visible = 1 repeat(4)
	{
		with instance_create(x,y,Smoke)
		motion_add(random(360),random(2))
	}
}
alarm0-=1
if alarm0<=0 instance_destroy()

#define infilt_hit
if(projectile_canhit(other) and speed > 2)
{
	projectile_hit(other, max(1,round(speed/4)), 8, direction);
}

#define infilt_wall
sound_play_hit(sndGrenadeHitWall,0.1)
move_bounce_solid(true)
speed *= 0.6
instance_create(x,y,Dust)

#define infilt_destroy
sound_play(sndExplosionL)
ang = random(360)
instance_create(x,y,Explosion)
instance_create(x+lengthdir_x(16,ang),y+lengthdir_y(16,ang),SmallExplosion)
instance_create(x+lengthdir_x(16,ang+120),y+lengthdir_y(16,ang+120),SmallExplosion)
instance_create(x+lengthdir_x(16,ang+240),y+lengthdir_y(16,ang+240),SmallExplosion)

for (var i = random(240); i < 720; i += random(240))
with create_seeker_missile(x,y,random(359),3.5+random(1.5)) hp = 8


#define ultra_infilt_step

//collisions
if place_meeting(x,y,Explosion) {instance_destroy(); exit}
with(instances_matching(projectile,"object_index",Slash,GuitarSlash,BloodSlash,EnergySlash,EnergyHammerSlash,LightningSlash,EnemySlash)) {
	if place_meeting(x,y,other)
	with other
	{
		direction = other.direction
		speed = 14
		friction = 0.075
		alarm1 = 6
		sleep(40)
		view_shake_at(x, y, 3);
		with instance_create(x,y,Deflect) {
			image_angle = other.direction
		}
	}
}
with(instances_matching(projectile,"object_index",Shank,EnergyShank)) {
	with other
	{
		sleep(40)
		view_shake_at(x, y, 3);
		instance_destroy()
	}
}

//alarms
alarm1-=1
if alarm1=0 {
	friction = 0.4
	
	if visible = 1 repeat(4)
	{
		with instance_create(x,y,Smoke)
		motion_add(random(360),random(2))
	}
}
alarm0-=1
if alarm0<=0 instance_destroy()

#define ultra_infilt_hit
if(projectile_canhit(other) and speed > 2)
{
	projectile_hit(other, max(1,round(speed/4)), 16, direction);
}

#define ultra_infilt_wall
sound_play_hit(sndGrenadeHitWall,0.1)
move_bounce_solid(true)
speed *= 0.75
instance_create(x,y,Dust)

#define ultra_infilt_destroy
sound_play(sndExplosionL)
ang = random(360)
instance_create(x,y,GreenExplosion)
with instance_create(x+lengthdir_x(24,ang),y+lengthdir_y(24,ang),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}
with instance_create(x+lengthdir_x(24,ang+72),y+lengthdir_y(24,ang+72),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}
with instance_create(x+lengthdir_x(24,ang+144),y+lengthdir_y(24,ang+144),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}
with instance_create(x+lengthdir_x(24,ang+216),y+lengthdir_y(24,ang+216),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}
with instance_create(x+lengthdir_x(24,ang+288),y+lengthdir_y(24,ang+288),GreenExplosion) {image_xscale = 0.5; image_yscale = 0.5}

for (var i = random(160); i < 720; i += random(160))
with create_ultra_seeker_missile(x,y,random(359),5.5+random(1.5)) hp = 16

#define legend_infilt_step

//collisions
if place_meeting(x,y,Explosion) {instance_destroy(); exit}
with(instances_matching(projectile,"object_index",Slash,GuitarSlash,BloodSlash,EnergySlash,EnergyHammerSlash,LightningSlash,EnemySlash)) {
	if place_meeting(x,y,other)
	with other
	{
		direction = other.direction
		speed = 14
		friction = 0.1
		alarm1 = 6
		sleep(40)
		view_shake_at(x, y, 3);
		with instance_create(x,y,Deflect) {
			image_angle = other.direction
		}
	}
}
with(instances_matching(projectile,"object_index",Shank,EnergyShank)) {
	with other
	{
		sleep(40)
		view_shake_at(x, y, 3);
		instance_destroy()
	}
}

//alarms
alarm1-=1
if alarm1=0 {
	friction = 0.4
	
	if visible = 1 repeat(4)
	{
		with instance_create(x,y,Smoke)
		motion_add(random(360),random(2))
	}
}
alarm0-=1
if alarm0<=0 instance_destroy()

#define legend_infilt_hit
if(projectile_canhit(other) and speed > 2)
{
	projectile_hit(other, max(1,round(speed/4)), 8, direction);
}

#define legend_infilt_wall
sound_play_hit(sndGrenadeHitWall,0.1)
move_bounce_solid(true)
speed *= 0.6
instance_create(x,y,Dust)

#define legend_infilt_destroy
sound_play(sndExplosionL)
var ang = random(359)
with instance_create(x,y,Explosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang),y+lengthdir_y(16,ang),SmallExplosion)
with instance_create(x+lengthdir_x(16,ang+72),y+lengthdir_y(16,ang+72),SmallExplosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang+144),y+lengthdir_y(16,ang+144),SmallExplosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang+216),y+lengthdir_y(16,ang+216),SmallExplosion) image_blend = c_yellow;
with instance_create(x+lengthdir_x(16,ang+288),y+lengthdir_y(16,ang+288),SmallExplosion) image_blend = c_yellow;

for (var i = random(90); i < 720; i += random(90))
with create_legend_seeker_missile(x,y,random(359),7.5+random(1.5)) hp = 32

#define super_infilt_step

//collisions
if place_meeting(x,y,Explosion) {instance_destroy(); exit}
with(instances_matching(projectile,"object_index",Slash,GuitarSlash,BloodSlash,EnergySlash,EnergyHammerSlash,LightningSlash,EnemySlash)) {
	if place_meeting(x,y,other)
	with other
	{
		direction = other.direction
		speed = 9
		friction = 0.1
		alarm1 = 6
		sleep(40)
		view_shake_at(x, y, 3);
		with instance_create(x,y,Deflect) {
			image_angle = other.direction
		}
	}
}
with(instances_matching(projectile,"object_index",Shank,EnergyShank)) {
	with other
	{
		sleep(40)
		view_shake_at(x, y, 3);
		instance_destroy()
	}
}

//alarms
alarm1-=1
if alarm1=0 {
	friction = 0.4
	
	if visible = 1 repeat(4)
	{
		with instance_create(x,y,Smoke)
		motion_add(random(360),random(2))
	}
}
alarm0-=1
if alarm0<=0 instance_destroy()

#define super_infilt_hit
if(projectile_canhit(other) and speed > 2)
{
	projectile_hit(other, max(1,round(speed/4)), 8, direction);
}

#define super_infilt_wall
sound_play_hit(sndGrenadeHitWall,0.1)
move_bounce_solid(true)
speed *= 0.6
instance_create(x,y,Dust)

#define super_infilt_destroy
/*
sound_play(sndExplosionL)
ang = random(360)
instance_create(x,y,Explosion)
instance_create(x+lengthdir_x(20,ang),y+lengthdir_y(20,ang),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+72),y+lengthdir_y(20,ang+72),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+144),y+lengthdir_y(20,ang+144),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+216),y+lengthdir_y(20,ang+216),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+288),y+lengthdir_y(20,ang+288),SmallExplosion)
*/

for (var i = random(180); i < 720; i += random(180))
with create_infiltrator(x,y,random(359),11) hp = 32

#define astral_infilt_step

//collisions
if place_meeting(x,y,Explosion) {instance_destroy(); exit}
with(instances_matching(projectile,"object_index",Slash,GuitarSlash,BloodSlash,EnergySlash,EnergyHammerSlash,LightningSlash,EnemySlash)) {
	if place_meeting(x,y,other)
	with other
	{
		direction = other.direction
		speed = 16
		friction = 0.1
		alarm1 = 6
		sleep(40)
		view_shake_at(x, y, 3);
		with instance_create(x,y,Deflect) {
			image_angle = other.direction
		}
	}
}
with(instances_matching(projectile,"object_index",Shank,EnergyShank)) {
	with other
	{
		sleep(40)
		view_shake_at(x, y, 3);
		instance_destroy()
	}
}

//alarms
alarm1-=1
if alarm1=0 {
	friction = 0.4
	
	if visible = 1 repeat(4)
	{
		with instance_create(x,y,Smoke)
		motion_add(random(360),random(2))
	}
}
alarm0-=1
if alarm0<=0 instance_destroy()

#define astral_infilt_hit
if(projectile_canhit(other) and speed > 2)
{
	projectile_hit(other, max(1,round(speed/4)), 8, direction);
}

#define astral_infilt_wall
sound_play_hit(sndGrenadeHitWall,0.1)
move_bounce_solid(true)
speed *= 0.6
instance_create(x,y,Dust)

#define astral_infilt_destroy
/*
sound_play(sndExplosionL)
ang = random(360)
instance_create(x,y,Explosion)
instance_create(x+lengthdir_x(20,ang),y+lengthdir_y(20,ang),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+72),y+lengthdir_y(20,ang+72),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+144),y+lengthdir_y(20,ang+144),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+216),y+lengthdir_y(20,ang+216),SmallExplosion)
instance_create(x+lengthdir_x(20,ang+288),y+lengthdir_y(20,ang+288),SmallExplosion)
*/

with instance_create(x, y, PortalClear) {
	image_xscale *= 4
	image_yscale *= 4
}

for (var i = random(160); i < 720; i += random(160))
with create_legend_infiltrator(x,y,random(359),11) hp = 32

for (var h = 0; h < 360; h += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(h, 0.5)
		image_angle = direction
		team = other.team
		creator = other
	}
}

for (var j = 0; j < 360; j += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(j, 1)
		image_angle = direction
		team = other.team
		creator = other
	}
}
for (var k = 0; k < 360; k += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(k, 1.5)
		image_angle = direction
		team = other.team
		creator = other
	}
}
for (var l = 0; l < 360; l += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(l, 2)
		image_angle = direction
		team = other.team
		creator = other
	}
}
for (var m = 0; m < 360; m += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(m, 2.5)
		image_angle = direction
		team = other.team
		creator = other
	}
}
for (var n = 0; n < 360; n += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(n, 3)
		image_angle = direction
		team = other.team
		creator = other
	}
}
for (var o = 0; o < 360; o += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(o, 3.5)
		image_angle = direction
		team = other.team
		creator = other
	}
}
for (var p = 0; p < 360; p += 1.8) {
	with instance_create(x, y, AllyBullet) {
		damage = 10
		motion_set(p, 4)
		image_angle = direction
		team = other.team
		creator = other
	}
}

#define psy_step
if timer > 0{
	timer -= 1
}
if timer = 0 && instance_exists(enemy){
	var closeboy = instance_nearest(x,y,enemy)
	if collision_line(x,y,closeboy.x,closeboy.y,Wall,0,0) < 0 && distance_to_object(closeboy) < 220{
	var dir, spd, dmp, rot;

	dir = point_direction(x, y, closeboy.x, closeboy.y);
	spd = max(11, 0);
	dmp = clamp(.3, 0, .8);

	direction -= clamp(angle_difference(image_angle, dir) * dmp, -spd, spd); //Smoothly rotate to aim position.
image_angle = direction
	}
	if speed > maxspeed
	{
		speed = maxspeed
	}
}
if image_index >= 1{
	image_speed = 0
}

#define psy_destroy
with instance_create(x,y,BulletHit){
	sprite_index = global.sprPsyBulletHit
	image_angle = other.direction + 180
}
if place_meeting(x + hspeed,y +vspeed,Wall){sound_play_pitchvol(sndHitWall,1,100/distance_to_object(creator))}

#define basic_project_step
bladespd += bladego

if bladespd > 100
bladespd = 100;

bladerot += bladespd
z=5*sqrt(abs(bladespd))

var tar;
if canmove!=0
{
    tar = instance_nearest(x,y,enemy)
    if tar>0
	{
		motion_add(point_direction(x,y,tar.x,tar.y),max_speed/10)
	}
}
image_angle=direction
if speed>max_speed speed=max_speed

al0-=1
al1-=1
al2-=1

if(al1 = 0)
{
	if z>30 
	{
		if instance_exists(enemy) gunangle = point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y)
		else gunangle = random(359)
		
		instance_create(x, y, PortalClear)
		
		with (instance_create(x, y, Lightning)) {
			image_angle = other.gunangle + (random(30) - 15);
			team = other.team;
			ammo = 14;
			event_perform(ev_alarm, 0);
			visible = false;
			with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
		}
		al1 = 75;
	}
}

if(al2 = 0)
canmove = 1;

if (timer >= 0) timer -= 1

if (timer <= 0 || !instance_exists(enemy)) {
	with (self) {
		instance_destroy();
	}
}

#define basic_project_draw
scale = choose(0.9,1.1);
image_xscale = scale;
image_yscale = scale;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1*image_yscale, image_angle, image_blend, 1.0);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);

#define basic_project_destroy
for (var i = random(288); i < 360; i += random(288)) {
	with (instance_create(x, y, Lightning)) {
		image_angle = i;
		team = other.team;
		ammo = 14;
		event_perform(ev_alarm, 0);
		visible = false;
		with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
	}
}	
instance_create(x, y, PortalClear)

#define science_project_step
bladespd += bladego

if bladespd > 100
bladespd = 100;

bladerot += bladespd
z=5*sqrt(abs(bladespd))

var tar;
if canmove!=0
{
    tar = instance_nearest(x,y,enemy)
    if tar>0
	{
		motion_add(point_direction(x,y,tar.x,tar.y),max_speed/10)
	}
}
image_angle=direction
if speed>max_speed speed=max_speed

al0-=1
al1-=1
al2-=1

if(al1 = 0)
{
	if z>30 
	{
		if instance_exists(enemy) gunangle = point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y)
		else gunangle = random(359)
		
		instance_create(x, y, PortalClear)
		
		with (instance_create(x, y, Lightning)) {
			image_angle = other.gunangle + (random(30) - 15);
			team = other.team;
			ammo = 18;
			event_perform(ev_alarm, 0);
			visible = false;
			with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
		}
		if (random(2) < 1) {
			repeat(5+irandom(5)) {
				create_psy_bullet(x, y, other.gunangle+random(50)-25, 4+random(2))
			}
		}
		al1 = 18;
	}
}

if(al2 = 0)
canmove = 1;

if (timer >= 0) {
timer -= 1
}

if (timer <= 0 || !instance_exists(enemy)) {
	with (self) {
		instance_destroy();
	}
}
#define science_project_draw
scale = choose(0.9,1.1);
image_xscale = scale;
image_yscale = scale;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1*image_yscale, image_angle, image_blend, 1.0);
draw_sprite_ext(sprite_index, image_index, x, y, 3*image_xscale, 3*image_yscale, image_angle, image_blend, 0.15);

#define science_project_destroy
for (var i = random(240); i < 720; i += random(240)) {
	with (instance_create(x, y, Lightning)) {
		image_angle = i;
		team = other.team;
		ammo = 22;
		event_perform(ev_alarm, 0);
		visible = false;
		with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
	}
}
for (var j = random(60); j < 720; j += random(60)) {
	create_psy_bullet(x, y, j, 4+random(2))
}
instance_create(x, y, PortalClear)

#define advanced_project_step
bladespd += bladego

if bladespd > 100
bladespd = 100;

bladerot += bladespd
z=5*sqrt(abs(bladespd))

var tar;
if canmove!=0
{
    tar = instance_nearest(x,y,enemy)
    if tar>0
	{
		motion_add(point_direction(x,y,tar.x,tar.y),max_speed/10)
	}
}
image_angle=direction
if speed>max_speed speed=max_speed

al0-=1
al1-=1
al2-=1

if(al1 = 0)
{
	if z>30 
	{
		if instance_exists(enemy) gunangle = point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y)
		else gunangle = random(359)
		
		instance_create(x, y, PortalClear)
		
		if (random(2)<1) {
			repeat(2) {
				with (instance_create(x, y, Lightning)) {
					image_angle = other.gunangle + (random(50) - 25);
					team = other.team;
					ammo = 22;
					event_perform(ev_alarm, 0);
					visible = false;
					with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
				}
			}
		}
		else {
			with (instance_create(x, y, Laser)) {
				image_angle = other.gunangle + (random(2) - 1);
				team = other.team;
				event_perform(ev_alarm, 0);
			}
		}
		if (random(4) < 1) {
			repeat(5+random(5)) {
				create_psy_bullet(x, y, other.gunangle+random(10)-5, 5+random(5))
			}
			if (random(4) < 1) {
				with instance_create(x, y, PlasmaBig) {
					motion_add(other.gunangle, 2)
					team = other.team
					creator = other
					image_angle = direction
				}
			}
		}
		al1 = 5;
	}
}

if(al2 = 0)
canmove = 1;

if (timer >= 0) {
timer -= 1
}

if (timer <= 0 || !instance_exists(enemy)) {
	with (self) {
		instance_destroy();
	}
}
#define advanced_project_draw
scale = choose(0.9,1.1);
image_xscale = scale;
image_yscale = scale;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1*image_yscale, image_angle, image_blend, 1.0);
draw_sprite_ext(sprite_index, image_index, x, y, 4*image_xscale, 4*image_yscale, image_angle, image_blend, 0.2);

#define advanced_project_destroy
for (var i = random(180); i < 720; i += random(180)) {
	with (instance_create(x, y, Lightning)) {
		image_angle = i;
		team = other.team;
		ammo = 26;
		event_perform(ev_alarm, 0);
		visible = false;
		with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
	}
}
for (var j = random(20); j < 720; j += random(20)) {
	create_psy_bullet(x, y, j, 1+random(5))
}
for (var k = random(50); k < 720; k += random(50)) {
	with (instance_create(x, y, Laser)) {
		image_angle = k + (random(2) - 1);
		team = other.team;
		event_perform(ev_alarm, 0);
	}
}
for (var l = random(120); l < 720; l += random(120)) {
	with instance_create(x, y, PlasmaBig) {
		motion_add(l, 2 + random(3))
		image_angle = direction
		team = other.team
		creator = other
	}
}
instance_create(x, y, PortalClear)

#define ultra_seeker_step
with instance_create(x, y, BoltTrail) {
	image_blend = c_lime
	image_xscale = 4
	image_yscale = 4
}

var target;
target=instance_nearest(x,y,enemy)
if target!=noone {
    if !collision_line(x,y,target.x,target.y,Wall,1,1) {
    var targetdir, targetdist, changedir;
    targetdir=point_direction(x,y,target.x,target.y)
    targetdist=max(6,point_distance(x,y,target.x,target.y))+(0.04*power(abs(angle_difference(direction,targetdir)),1.2))
    targetdist/=2
    changedir=clamp(angle_difference(direction,targetdir),-360/targetdist,360/targetdist)
    direction-=changedir;
}}
direction+=5-random(10)
image_angle=direction

if random(5) < 1 && visible=1 
instance_create(xprevious,yprevious,Dust)

//alarms
alarm0-=1
if alarm0=0 {bounce=0}

//collisions
if place_meeting(x,y,Explosion) {hp-=1}

if image_index > 1 
image_speed = 0


#define ultra_seeker_wall
instance_destroy()

#define ultra_seeker_draw
draw_self()

#define ultra_seeker_destroy
sound_play(sndExplosionS)
for (var i = random(288); i < 720; i += random(288)) {
	with instance_create(x, y, Seeker) {
		motion_add(i, 2 + random(3))
		image_angle = other
		team = other.team
		creator = other
	}
}

#define zap_expand(expandtype)
if instance_exists(enemy)
dir = instance_nearest(x+lengthdir_x(80,direction),y+lengthdir_y(80,direction),enemy)
var oldx, oldy;
oldx = x
oldy = y
direction = image_angle+(random(30)-15)
speed = 4
if instance_exists(enemy)
{
	if point_distance(x,y,dir.x,dir.y) < 120
	motion_add(point_direction(x,y,dir.x,dir.y),1)
}
image_angle = direction
speed = 0

//move_contact_solid(direction,8+random(4))
var _dis = 8+random(4);
x += lengthdir_x(_dis,direction)
y += lengthdir_y(_dis,direction)

speed = 0
image_xscale = -point_distance(x,y,oldx,oldy)/2

ammo -= 1

if place_meeting(x,y,Wall)
{
	x = xprevious
	y = yprevious
	direction += 140+random(80);
	//direction += 180; less random
}

if ammo <= 0
{
	instance_create(x+lengthdir_x(image_xscale/2,image_angle),y+lengthdir_y(image_xscale/2,image_angle),LightningHit)
}
else
{
	image_index += 0.4/ammo
	with create_zap_lightning(x, y)
	{
		direction = other.direction
		image_angle = direction
		ammo = other.ammo
		team = other.team
		if expandtype=1 {zap_expand(2)}
		else {alarm1 = 1}
	}
}

#define zap_step
alarm1-=1
if alarm1=0 zap_expand(1)

#define zap_draw
image_yscale = 1+random(1.5)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale/2,image_angle,c_white,1)

#define zap_hit
if projectile_canhit(other) {
	if projectile_canhit_melee(other) {
		projectile_hit(other,damage,force,image_angle)
	}
	if other.my_health<=0 && random(250)<1 sound_play(global.sndDucked);
	sound_play_hit(other.snd_hurt,0.1)
	if random(4)<1 instance_create(x,y,Smoke)
}

#define zap_wall
//nothing

#define zap_anim
instance_destroy()