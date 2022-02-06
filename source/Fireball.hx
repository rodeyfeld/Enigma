package;

class Fireball extends BulletType
{
	public function new()
	{
		var graphic = AssetPaths.fireball__png;
		var height = 16;
		var width = 16;
		super(graphic, width, height);
	}
}
