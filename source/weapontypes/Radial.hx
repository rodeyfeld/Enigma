package weapontypes;

class Radial extends WeaponType
{
	public function new(weaponPattern, startX, startY, radius, target)
	{
		super(WeaponTypes.RADIAL, weaponPattern, startX, startY, radius, target);
	}
}
