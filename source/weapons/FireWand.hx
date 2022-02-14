package weapons;

class FireWand extends Weapon
{
	public function new()
	{
		var fireBallbulletType = new Fireball();
		var shotWeaponPattern = new RegularShot();
		super(shotWeaponPattern, fireBallbulletType);
	}
	// override public function fireWeapon()
	// {
	// 	createBullet();
	// }
	// override public function updateWeaponParams(params:Map<String, Float>)
	// {
	// 	weaponType.params.startX = params['startX'];
	// 	weaponType.params.startY = params['startY'];
	// 	// weaponType.params.destX = null;
	// 	// weaponType.params.destY = null;
	// 	weaponType.params.fireAngle = params['fireAngle'];
	// }
}
