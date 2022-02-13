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
}
