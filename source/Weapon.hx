package;

import Bullet;
import BulletType;
import flixel.group.FlxGroup.FlxTypedGroup;

class Weapon
{
	public var bullets:FlxTypedGroup<Bullet>;
	public var bulletType:BulletType;

	public function new(bulletType)
	{
		this.bullets = new FlxTypedGroup<Bullet>();
		this.bulletType = bulletType;
	}

	public function createBullet(playerX, playerY, fireAngle)
	{
		var bullet = new Bullet(playerX, playerY, fireAngle, bulletType);
		bullets.add(bullet);
	}
}
