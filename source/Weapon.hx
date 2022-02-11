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

	public function new(bulletType, weaponType)
	{
		this.bullets = new FlxTypedGroup<Bullet>();
		this.bulletType = bulletType;
		this.weaponType = weaponType;
	}

	public function fireWeapon()
	{
		if (weaponType.params.weaponPattern == WeaponPatterns.SHOT)
		{
			createShot(weaponType, bulletType);
		}
		else if (weaponType.params.weaponPattern == WeaponPatterns.FLAK)
		{
			createFlak(weaponType, bulletType);
		}
		else if (weaponType.params.weaponPattern == WeaponPatterns.AURA)
		{
			createAura(weaponType, bulletType);
		}
	}

	public function createShot(weaponType:WeaponType, bulletType:BulletType)
	{
		createBullet(weaponType.params.startX, weaponType.params.startY, bulletType, weaponType.params.fireAngle);
	}

	public function createFlak(weaponType:WeaponType, bulletType:BulletType)
	{
		var randomGenerator = new FlxRandom();
		var angleDirection = [1, -1];

		for (i in 0...weaponType.params.magazine)
		{
			var newAngle = weaponType.params.fireAngle
				+ (randomGenerator.float(0, weaponType.params.fireAngleVariance) * angleDirection[randomGenerator.int(0, angleDirection.length - 1)]);
			createBullet(weaponType.params.startX, weaponType.params.startY, bulletType, newAngle);
		}
	}

	public function createAura(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType.params.startX, weaponType.params.startY, bulletType, weaponType.params.target);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}

	public function createBullet(startX, startY, bulletType, fireAngle:Float = 0)
	{
		var bullet = new Bullet(startX, startY, bulletType, fireAngle);
		bullets.add(bullet);
	}
}
