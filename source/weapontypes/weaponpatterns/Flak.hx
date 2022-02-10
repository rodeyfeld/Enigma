package weapontypes.weaponpatterns;

class Flak extends Projectile
{
	public function new(startX, startY, fireAngle:Float, magazine:Int = 5, fireAngleVariance:Float = 50)
	{
		super(WeaponPatterns.FLAK, startX, startY, fireAngle, magazine, fireAngleVariance);
	}
}
