package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

enum EnemyType
{
	REGULAR;
	BOSS;
}

class Enemy extends FlxSprite
{
	static inline var SPEED:Float = 50;

	var type:EnemyType;
	var brain:FSM;
	var idleTimer:Float;
	var moveDirection:Float;

	public var enemyHealthBar:FlxBar;

	public var totalHealth:Float;
	public var seesPlayer:Bool;
	public var playerPosition:FlxPoint;

	public function new(x:Float, y:Float, type:EnemyType)
	{
		super(x, y);
		this.type = type;
		var graphic = if (type == BOSS) AssetPaths.player__png else AssetPaths.player__png;
		loadGraphic(graphic, true, 16, 16);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d", [3, 4, 5], 6, false);
		animation.add("lr", [18, 19, 20], 6, false);
		animation.add("u", [48, 49, 50], 6, false);
		drag.x = drag.y = 1600;
		setSize(16, 16);
		offset.set(4, 4);
		brain = new FSM(idle);
		idleTimer = 0;
		playerPosition = FlxPoint.get();
		totalHealth = 100;
		health = totalHealth;
		// TODO: Move this somewhere else?
		enemyHealthBar = new FlxBar(x, y, LEFT_TO_RIGHT, 20, 6, this, "health", 0, totalHealth, true);
		enemyHealthBar.createFilledBar(FlxColor.RED, FlxColor.GREEN, true);
		enemyHealthBar.trackParent(-6, 15);
	}

	function idle(elapsed:Float)
	{
		if (seesPlayer)
		{
			// brain.activeState = chase;
		}
		else if (idleTimer <= 0)
		{
			if (FlxG.random.bool(1))
			{
				moveDirection = -1;
				velocity.x = velocity.y = 0;
			}
			else
			{
				moveDirection = FlxG.random.int(0, 8) * 45;

				velocity.set(SPEED * 0.5, 0);
				velocity.rotate(FlxPoint.weak(), moveDirection);
			}
			idleTimer = FlxG.random.int(1, 4);
		}
		else
			idleTimer -= elapsed;
	}

	function chase(elapsed:Float)
	{
		if (!seesPlayer)
		{
			brain.activeState = idle;
		}
		else
		{
			FlxVelocity.moveTowardsPoint(this, playerPosition, Std.int(SPEED));
		}
	}

	override public function update(elapsed:Float)
	{
		if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
		{
			if (Math.abs(velocity.x) > Math.abs(velocity.y))
			{
				if (velocity.x < 0)
					facing = FlxObject.LEFT;
				else
					facing = FlxObject.RIGHT;
			}
			else
			{
				if (velocity.y < 0)
					facing = FlxObject.UP;
				else
					facing = FlxObject.DOWN;
			}

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
		brain.update(elapsed);
		super.update(elapsed);
	}

	override function kill()
	{
		enemyHealthBar.kill();
		super.kill();
	}
}
