package weapontypes.weaponpatterns;

class Flak extends Projectile
{
	public function new(startX, startY)
	{
		super({
			'weaponPattern': WeaponPatterns.FLAK,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
			'magazine': 5,
			'fireAngleVariance': 25
		});
	}
}
