package weapontypes;

class Projectile extends WeaponType
{
	public function new(params)
	{
		params.weaponType = WeaponTypes.PROJECTILE;
		super(params);
	}

	// override public function createBullet() {}
}
