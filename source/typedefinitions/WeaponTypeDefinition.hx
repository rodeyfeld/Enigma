package typedefinitions;

import flixel.FlxObject;

typedef WeaponTypeDefinition =
{
	public var ?weaponPattern:WeaponPatterns;
	public var ?weaponType:WeaponTypes;
	public var ?startX:Float;
	public var ?startY:Float;
	public var ?destX:Float;
	public var ?destY:Float;
	public var ?fireAngle:Float;
	public var ?speed:Float;
	public var ?magazine:Int;
	public var ?fireAngleVariance:Float;
	public var ?radius:Float;
}
