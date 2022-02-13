package weapontypes.weaponpatterns;

class Shot extends Projectile
{
	public function new(params)
	{
		params.weaponType = WeaponPatterns.SHOT;
		super(params);
	}
	// override public function createBullet() {}
}