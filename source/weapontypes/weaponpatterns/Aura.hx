package weapontypes.weaponpatterns;

class Aura extends Radial
{
	public function new(startX, startY)
	{
		super({
			'weaponPattern': WeaponPatterns.AURA,
			'startX': startX,
			'startY': startY,
		});
	}
}
