package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Bullet extends FlxSprite
{
	public var bulletType:BulletType;
	public var test:Float;
	public var target:FlxObject;
	public var lifeSpan:Float;

	public function new(startX, startY, bulletType, fireAngle:Float = 0, target:FlxObject = null)
	{
		this.target = target;
		this.lifeSpan = bulletType.lifeSpan;
		this.bulletType = bulletType;
		super(startX, startY);
		loadGraphic(bulletType.graphic, true, bulletType.width, bulletType.height);
		velocity.set(bulletType.moveSpeed);
		velocity.rotate(FlxPoint.weak(0, 0), fireAngle);
		angle = fireAngle + 90;

		for (i in 0...bulletType.animations.length)
		{
			var bulletTypeAnimation:AnimationMap = bulletType.animations[i];
			animation.add(bulletTypeAnimation.name, bulletTypeAnimation.frames, bulletTypeAnimation.framerate, bulletTypeAnimation.animated);
		}
	}

	public override function update(elapsed:Float)
	{
		if (target != null)
		{
			trace(target);
			x = target.x;
			y = target.y;
		}
		if (lifeSpan >= 0)
		{
			lifeSpan -= elapsed;
		}
		else
		{
			kill();
		}
		trace(lifeSpan);
		super.update(elapsed);
	}
}
