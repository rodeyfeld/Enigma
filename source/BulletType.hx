package;

class BulletType
{
	public var graphic:String;
	public var width:Int;
	public var height:Int;
	public var cooldown:Int;
	public var timer:Int;
	public var animations:Array<AnimationMap>;
	public var move_speed:Float;
	public var damage:Float;
	public var lifeSpan:Float;

	public function new(graphic, width, height, cooldown, timer, animations, move_speed, damage, lifeSpan = 100)
	{
		this.graphic = graphic;
		this.width = width;
		this.height = height;
		this.cooldown = cooldown;
		this.timer = timer;
		this.animations = animations;
		this.move_speed = move_speed;
		this.damage = damage;
		this.lifeSpan = lifeSpan;
	}
}
