package weapontypes.weaponpatterns;

class Beam extends Projectile
{
	public function new(startX, startY)
	{
		super({
			'weaponPattern': WeaponPatterns.BEAM,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
            'magazine': 3,
		});
	}
}