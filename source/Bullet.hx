package;

import flixel.FlxSprite;

class Bullet extends FlxSprite
{
	public function new(x, y, bulletType)
	{
		super(x, y);
		loadGraphic(bulletType.graphic, true, bulletType.width, bulletType.height);
		// var _animations = bulletType.;
		setSize(16, 16);
		trace(bulletType);
		for (i in 0...bulletType.animations.length)
		{
			trace("hi", bulletType.animations[i]);
		}
	}
}
