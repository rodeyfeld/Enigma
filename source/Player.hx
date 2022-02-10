package;

import Weapon;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	public static inline var RUN_SPEED:Int = 100;

	public var weapons = new Array<Weapon>();
	public var fireBallBulletType:Fireball;
	public var bulletBulletType:Shell;
	public var shotWeaponType:Shot;
	public var toxicCircleBulletType:ToxicCircle;
	public var auraWeaponType:Aura;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		health = 100;
		loadGraphic(AssetPaths.player__png, true, 16, 16);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d", [0, 1, 2], 6, false);
		animation.add("lr", [15, 16, 17], 6, false);
		animation.add("u", [45, 46, 47], 6, false);
		drag.x = drag.y = 1600;
		offset.set(4, 4);

		// Weapons
		// FIREBALL SHOT
		var fireBallbulletType = new Fireball();
		var shotWeaponPattern = new Shot(x, y);
		var fireBallShotWeapon = new Weapon(fireBallbulletType, shotWeaponPattern);
		weapons.push(fireBallShotWeapon);
		// SHELL FLAK
		var shellbulletType = new Shell();
		var flakWeaponPattern = new Flak(x, y);
		var shellFlakWeapon = new Weapon(shellbulletType, flakWeaponPattern);
		weapons.push(shellFlakWeapon);
		// TOXICCIRCLE AURA
		var toxicCircleBulletType = new ToxicCircle();
		var auraWeaponType = new Aura(x, y, this);
		var toxicCircleAuraWeapon = new Weapon(toxicCircleBulletType, auraWeaponType);
		// weapons.push(toxicCircleAuraWeapon);
	}

	function updateMovement(elapsed:Float)
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		// var attack:Bool = false;
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;
		var newAngle:Float = 0;
		if (up || down || left || right)
		{
			if (up)
			{
				newAngle = -90;
				if (left)
					newAngle -= 45;
				else if (right)
					newAngle += 45;
				facing = FlxObject.UP;
			}
			else if (down)
			{
				newAngle = 90;
				if (left)
					newAngle += 45;
				else if (right)
					newAngle -= 45;
				facing = FlxObject.DOWN;
			}
			else if (left)
			{
				newAngle = 180;
				facing = FlxObject.LEFT;
			}
			else if (right)
			{
				newAngle = 0;
				facing = FlxObject.RIGHT;
			}

			// determine our velocity based on angle and speed
			velocity.set(RUN_SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), newAngle);
			// if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
			if ((velocity.x != 0 || velocity.y != 0))
			{
				switch (facing)
				{
					case FlxObject.LEFT, FlxObject.RIGHT:
						animation.play("lr");
					case FlxObject.UP:
						animation.play("u");
					case FlxObject.DOWN:
						animation.play("d");
					case _:
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		updateMovement(elapsed);
		super.update(elapsed);
	}
}
