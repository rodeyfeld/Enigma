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

	override public function updateWeaponParams(params)
	{
		weaponType.params.startX = params.startX;
		weaponType.params.startY = params.startY;
		weaponType.params.destX = params.destX;
		weaponType.params.destY = params.destY;
		weaponType.params.fireAngle = params.fireAngle;
	}
}
