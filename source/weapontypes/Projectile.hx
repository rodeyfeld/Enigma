package weapontypes;

class Projectile extends WeaponType
{
	public function new(weaponPattern, startX, startY, fireAngle:Float = 0, magazine:Int = 0, fireAngleVariance:Float = 0)
	{
		super(WeaponTypes.PROJECTILE, weaponPattern, startX, startY, fireAngle, magazine, fireAngleVariance);
	}
}
