package weapontypes.weaponpatterns.weaponbehaviors;

class ChainShot extends Shot
{
	public function new(startX, startY)
	{
		super({
			'weaponBehavior': WeaponBehaviors.CHAINSHOT,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
			'magazine': 5,
			'fireAngleVariance': 25
		});
	}
}
