package;

import Bullet;
import BulletType;

class Weapon
{
	public var bulletType:BulletType;

	public function new(bulletType)
	{
		this.bulletType = bulletType;
	}

	public function createBullet(playerY, playerY, playerAngle)
	{
		var bullet = new Bullet(playerY, playerY, playerAngle, bulletType);
		return bullet;
	}
}
