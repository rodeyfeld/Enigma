package;

import flixel.FlxSprite;

class Bullet extends FlxSprite
{
	public function new(playerX, playerY, playerAngle, bulletType)
	{
		super(playerX, playerY);
		loadGraphic(bulletType.graphic, true, bulletType.width, bulletType.height);
		trace(playerAngle);

		for (i in 0...bulletType.animations.length)
		{
			trace(bulletType.animations[i]);
		}
	}
}
