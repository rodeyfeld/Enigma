package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Bullet extends FlxSprite
{
	public var bulletType:BulletType;
	public var test:Float;

	public function new(startX, startY, bulletType, fireAngle:Float = 0, target = null)
	{
		trace(fireAngle);
		this.bulletType = bulletType;
		super(startX, startY);
		loadGraphic(bulletType.graphic, true, bulletType.width, bulletType.height);
		// if (bulletType.target != null)
		// {
		// 	follow(target);
		// }
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
		if (bulletType.lifeSpan >= 0)
		{
			bulletType.lifeSpan -= elapsed;
		}
		else
		{
			kill();
		}
		super.update(elapsed);
	}
}
