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

	function fireBullet()
	{
		var bullet = new Bullet(bulletType);
	}
}
