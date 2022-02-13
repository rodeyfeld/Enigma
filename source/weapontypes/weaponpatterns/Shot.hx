package weapontypes.weaponpatterns;

class Shot extends Projectile
{
	public function new(params)
	{
		params.weaponPattern = WeaponPatterns.SHOT;
		super(params);
	}
}
