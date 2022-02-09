package weapontypes.weaponpatterns;

class Flak extends Projectile
{
	public function new(startX, startY, fireAngle:Float, magazine:Int = 5, fireAngleVariance:Float = 50)
	{
		weaponPattern = WeaponPatterns.FLAK;
		super(weaponPattern, startX, startY, fireAngle, magazine, fireAngleVariance);
	}
}
