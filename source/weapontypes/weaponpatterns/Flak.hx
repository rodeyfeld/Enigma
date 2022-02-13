package weapontypes.weaponpatterns;

import flixel.math.FlxRandom;

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
