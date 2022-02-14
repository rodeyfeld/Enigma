package;

import Bullet;
import BulletType;
import flixel.effects.particles.FlxEmitter;
import flixel.group.FlxGroup.FlxTypedGroup;

class Weapon
{
	public var weaponType:WeaponType;
	public var bulletType:BulletType;

	public function new(weaponType:WeaponType, bulletType:BulletType)
	{
		this.weaponType = weaponType;
		this.bulletType = bulletType;
	}

	public function fireWeapon()
	{
		var bullet:Bullet = new Bullet(weaponType, bulletType);
		return bullet;
	}

	public function updateWeaponParams(params:Map<String, Float>) {}
}
