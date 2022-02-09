package weapontypes.weaponpatterns;

class Shot extends Projectile
{
	public function new(startX, startY, fireAngle:Float)
	{
		super(WeaponPatterns.SHOT, startX, startY, fireAngle);
	}
}
