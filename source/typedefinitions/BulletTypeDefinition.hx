package typedefinitions;

typedef BulletTypeDefinition =
{
	public var ?graphic:String;
	public var ?width:Int;
	public var ?height:Int;
	public var ?cooldown:Int;
	public var ?timer:Int;
	public var ?animations:Array<AnimationMap>;
	public var ?moveSpeed:Float;
	public var ?damage:Float;
	public var ?lifeSpan:Float;
	public var ?persist:Bool;
}
