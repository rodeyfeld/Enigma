package weapontypes.weaponpatterns;

import flixel.FlxObject;

class Aura extends Radial
{
	public function new(startX, startY, targets)
	{
		super({
			'weaponPattern': WeaponPatterns.AURA,
			'startX': startX,
			'startY': startY,
			'targets': targets,
		});
	}
}
