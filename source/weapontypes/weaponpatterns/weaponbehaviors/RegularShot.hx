package weapontypes.weaponpatterns.weaponbehaviors;

class RegularShot extends Shot
{
	public function new()
	{
		super({
			'weaponBehavior': WeaponBehaviors.REGULARSHOT,
			'startX': 0,
			'startY': 0,
			'fireAngle': 0,
			'magazine': 1,
		});
	}
}
