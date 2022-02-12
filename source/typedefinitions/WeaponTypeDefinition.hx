package typedefinitions;

import flixel.FlxObject;

typedef WeaponTypeDefinition =
{
	public var ?weaponPattern:WeaponPatterns;
	public var ?weaponType:WeaponTypes;
	public var ?startX:Float;
	public var ?startY:Float;
	public var ?fireAngle:Float;
	public var ?speed:Float;
	public var ?magazine:Int;
	public var ?fireAngleVariance:Float;
	public var ?radius:Float;
	public var ?target:FlxObject;
}
// redefine function to use the params typedef
// funtion myFunc(params:MyFuncParams) {
// logic and stuff
// }
// call it by passimg in an anonymous object with the typedef shape
// myFunc({c: "Hello", a: 60});
