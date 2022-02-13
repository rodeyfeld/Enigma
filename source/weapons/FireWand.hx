package weapons;

class FireWand extends Weapon
{
	public function new()
	{
		var fireBallbulletType = new Fireball();
		var shotWeaponPattern = new Shot(0, 0);
		super(shotWeaponPattern, fireBallbulletType);
	}

	override public function fireWeapon()
	{
		createBullet();
	}
}
