package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Bullet extends FlxSprite
{
	public var bulletType:BulletType;
	public var damage:Float;

	public function new(playerX, playerY, fireAngle, bulletType)
	{
		this.bulletType = bulletType;
		this.damage = bulletType.damage;
		trace(damage);
		super(playerX, playerY);
		loadGraphic(bulletType.graphic, true, bulletType.width, bulletType.height);
		velocity.set(bulletType.move_speed);
		velocity.rotate(FlxPoint.weak(0, 0), fireAngle);
		// TODO: Formalize sprite oreintation, currently working for pointing up
		angle = fireAngle + 90;

		for (i in 0...bulletType.animations.length)
		{
			var bulletTypeAnimation:AnimationMap = bulletType.animations[i];
			animation.add(bulletTypeAnimation.name, bulletTypeAnimation.frames, bulletTypeAnimation.framerate, bulletTypeAnimation.animated);
		}
	}
}
