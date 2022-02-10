package;

import flixel.FlxObject;

class WeaponType
{
	public var weaponPattern:WeaponPatterns;
	public var weaponType:WeaponTypes;
	public var startX:Float;
	public var startY:Float;
	public var fireAngle:Float;
	public var magazine:Int;
	public var fireAngleVariance:Float;
	public var radius:Float;
	public var target:FlxObject;

	public function new(weaponType, weaponPattern, startX, startY, fireAngle:Float = 0, magazine:Int = 0, fireAngleVariance:Float = 0, radius:Float = 0,
			target = null)
	{
		this.weaponType = weaponType;
		this.weaponPattern = weaponPattern;
		this.startX = startX;
		this.startY = startY;
		this.fireAngle = fireAngle;
		this.magazine = magazine;
		this.fireAngleVariance = fireAngleVariance;
		this.radius = radius;
		this.target = target;
	}
}
