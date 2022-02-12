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
		else if (weaponType.params.weaponPattern == WeaponPatterns.BEAM)
		{
			createBeam(weaponType, bulletType);
		}
	}

	public function createShot(weaponType:WeaponType, bulletType:BulletType)
	{
		createBullet(weaponType, bulletType);
	}

	public function createFlak(weaponType:WeaponType, bulletType:BulletType)
	{
		var randomGenerator = new FlxRandom();
		var angleDirection = [1, -1];

		for (i in 0...weaponType.params.magazine)
		{
			var newAngle = weaponType.params.fireAngle
				+ (randomGenerator.float(0, weaponType.params.fireAngleVariance) * angleDirection[randomGenerator.int(0, angleDirection.length - 1)]);
			weaponType.params.fireAngle = newAngle;
			createBullet(weaponType, bulletType);
		}
	}

	public function createAura(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}

	public function createBeam(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}

	public function createBullet(weaponType:WeaponType, bulletType:BulletType)
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullets.add(bullet);
	}
}
