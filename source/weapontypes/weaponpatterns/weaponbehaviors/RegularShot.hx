package weapontypes.weaponpatterns.weaponbehaviors;

class RegularShot extends Shot
{
	public function new(startX, startY)
	{
		super({
			'weaponBehavior': WeaponBehaviors.REGULARSHOT,
			'startX': startX,
			'startY': startY,
			'fireAngle': 0,
			'magazine': 1,
		});
	}
}
