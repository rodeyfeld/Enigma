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
		var randomGenerator = new FlxRandom();
		var angleDirection = [1, -1];
		for (i in 0...weaponType.params.magazine)
		{
			weaponType.params.startX = weaponType.params.destX;
			weaponType.params.startY = weaponType.params.destY;
			weaponType.params.destX =  randomenemyx
			weaponType.params.destY =  randomenemyy
			createBullet();
			weaponType.params.fireAngle = curAngle;
		}
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
