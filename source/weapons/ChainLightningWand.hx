package weapons;

class ChainLightningWand extends Weapon
{
	public function new()
	{
		var lightningStrikeBulletType = new LightningStrike();
		var beamWeaponPattern = new Beam(0, 0);
		super(beamWeaponPattern, lightningStrikeBulletType);
	}

	override public function fireWeapon()
	{
		createBullet();
	}

	override public function updateWeaponParams(params:Map<String, Float>)
	{
		weaponType.params.startX = params['startX'];
		weaponType.params.startY = params['startY'];
		weaponType.params.destX = params['destX'];
		weaponType.params.destY = params['destY'];
		//weaponType.params.fireAngle = null;
	}
}
