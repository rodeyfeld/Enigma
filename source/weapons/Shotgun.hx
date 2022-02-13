package weapons;

import flixel.math.FlxRandom;

class Shotgun extends Weapon
{
	public function new()
	{
		var shellbulletType = new Shell();
		var flakWeaponPattern = new Flak(0, 0);
		super(flakWeaponPattern, shellbulletType);
	}

	override public function fireWeapon()
	{
		var randomGenerator = new FlxRandom();
		var angleDirection = [1, -1];
		for (i in 0...weaponType.params.magazine)
		{
			var curAngle = weaponType.params.fireAngle;
			var newAngle = weaponType.params.fireAngle
				+ (randomGenerator.float(0, weaponType.params.fireAngleVariance) * angleDirection[randomGenerator.int(0, angleDirection.length - 1)]);
			weaponType.params.fireAngle = newAngle;
			createBullet();
			weaponType.params.fireAngle = curAngle;
		}
	}

	override public function updateWeaponParams(params:Map<String, Float>)
	{
		weaponType.params.startX = params['startX'];
		weaponType.params.startY = params['startY'];
		weaponType.params.destX = null;
		weaponType.params.destY = null;
		//weaponType.params.fireAngle = params.fireAngle;
	}
}
