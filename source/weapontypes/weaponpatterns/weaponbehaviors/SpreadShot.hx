package weapontypes.weaponpatterns.weaponbehaviors;

class SpreadShot extends Shot
{
	public function new(startX, startY)
	{
		super({
			'weaponPattern': WeaponPatterns.SHOT,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
		});
	}
}
