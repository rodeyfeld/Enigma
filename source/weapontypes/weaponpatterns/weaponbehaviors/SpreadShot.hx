package weapontypes.weaponpatterns.weaponbehaviors;

class SpreadShot extends Shot
{
	public function new()
	{
		super({
			'weaponBehavior': WeaponBehaviors.SPREADSHOT,
			'startX': 0,
			'startY': 0,
			'fireAngle': 0,
			'magazine': 5,
			'fireAngleVariance': 25
		});
	}
}
