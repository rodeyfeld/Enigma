package weapontypes.weaponpatterns.weaponbehaviors;

class SpreadShot extends Shot
{
	public function new(startX, startY)
	{
		super({
			'weaponBehavior': WeaponBehaviors.SPREADSHOT,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
			'magazine': 5,
			'fireAngleVariance': 25
		});
	}
}
