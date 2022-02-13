package;

import Bullet;
import BulletType;
import flixel.group.FlxGroup.FlxTypedGroup;

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

	public function updateWeaponParams(params:Map<String, Float>) {}

	public function createBullet()
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullets.add(bullet);
	}

	public function createFlak() {}

	public function createBeam(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}
}
