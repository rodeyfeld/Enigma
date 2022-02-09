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
		if (weaponType.weaponPattern == WeaponPatterns.SHOT)
		{
			createShot(weaponType, bulletType);
		}
		else if (weaponType.weaponPattern == WeaponPatterns.FLAK)
		{
			createFlak(weaponType, bulletType);
		}
	}

	public function createShot(weaponType, bulletType)
	{
		createBullet(weaponType.startX, weaponType.startY, weaponType.fireAngle, bulletType);
	}

	public function createFlak(weaponType, bulletType)
	{
		var randomGenerator = new FlxRandom();
		var angleDirection = [1, -1];
		for (i in 0...weaponType.magazine)
		{
			// var newAngle = weaponType.fireAngle;
			var newAngle = weaponType.fireAngle
				+ (randomGenerator.float(0, weaponType.fireAngleVariance) * angleDirection[randomGenerator.int(0, angleDirection.length - 1)]);
			createBullet(weaponType.startX, weaponType.startY, newAngle, bulletType);
		}
	}

	public function createBullet(startX, startY, fireAngle, bulletType)
	{
		var bullet = new Bullet(startX, startY, fireAngle, bulletType);
		bullets.add(bullet);
	}
}
