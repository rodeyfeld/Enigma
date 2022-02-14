package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.math.FlxPoint;

class Bullet extends FlxSprite
{
	public var bulletType:BulletType;
	public var weaponType:WeaponType;
	public var test:Float;
	public var target:FlxObject;
	public var lifeSpan:Float;
	public var aliveEmitter:FlxEmitter;

	public function new(weaponType:WeaponType, bulletType:BulletType)
	{
		this.weaponType = weaponType;
		this.bulletType = bulletType;
		lifeSpan = bulletType.params.lifeSpan;
		aliveEmitter = bulletType.params.aliveEmmiter;
		super(weaponType.params.startX, weaponType.params.startY);
		loadGraphic(bulletType.params.graphic, true, bulletType.params.width, bulletType.params.height);
		addAnimations(bulletType);

		if (weaponType.params.destX == null && weaponType.params.destY == null)
		{
			velocity.set(bulletType.params.moveSpeed);
			velocity.rotate(FlxPoint.weak(0, 0), weaponType.params.fireAngle);
			angle = weaponType.params.fireAngle + 90;
		}
		// else
		// {
		// 	x = weaponType.params.destX;
		// 	y = weaponType.params.destY;
		// }
	}

	public override function update(elapsed:Float)
	{
		if (aliveEmitter != null)
		{
			// aliveEmitter.x = x;
			// aliveEmitter.y = y;
			aliveEmitter.setPosition(x, y);
		}
		if (lifeSpan >= 0)
		{
			lifeSpan -= elapsed;
		}
		else if (lifeSpan < 0 && lifeSpan > -1)
		{
			kill();
		}
		super.update(elapsed);
	}

	public override function kill()
	{
		if (aliveEmitter != null)
		{
			aliveEmitter.kill();
		}
		super.kill();
	}

	public function addAnimations(bulletType:BulletType)
	{
		for (i in 0...bulletType.params.animations.length)
		{
			var bulletTypeAnimation:AnimationMap = bulletType.params.animations[i];
			animation.add(bulletTypeAnimation.name, bulletTypeAnimation.frames, bulletTypeAnimation.framerate, bulletTypeAnimation.animated,
				bulletTypeAnimation.looped);
		}
		animation.play("fire");
	}
}
