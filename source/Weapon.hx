package;

import Bullet;
import BulletType;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRandom;
import weapontypes.weaponpatterns.WeaponPatterns;

class Weapon
{
	public var bullets:FlxTypedGroup<Bullet>;
	public var weaponType:WeaponType;
	public var bulletType:BulletType;

	public function new(weaponType:WeaponType, bulletType:BulletType)
	{
		this.bullets = new FlxTypedGroup<Bullet>();
		this.weaponType = weaponType;
		this.bulletType = bulletType;
	}

	public function fireWeapon() {}

	public function createBullet()
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullets.add(bullet);
	}

	public function createAura(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}

	public function createFlak() {}

	// public function updateAura()
	// {
	// 	bullets.forEach(function(weaponType.) sprite.scrollFactor.set(0, 0));
	// 	for(bullet in bullets){}
	// }

	public function updateTargetCoords() {}

	public function createBeam(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}
}
