package weapontypes.weaponpatterns;

class Shot extends Projectile
{
	public function new(startX, startY)
	{
		super({
			'weaponPattern': WeaponPatterns.SHOT,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
			'magazine': 8
		});
	}
}
