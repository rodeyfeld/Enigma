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

	public function createBullet(x, y)
	{
		var bullet = new Bullet(x, y, bulletType);
		trace(bullet);
		return bullet;
	}
}
