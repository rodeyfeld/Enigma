package;

class AnimationMap
{
	public var name:String;
	public var frames:Array<Int>;
	public var animated:Bool;
	public var framerate:Int;
	public var looped:Bool;

	public function new(name, frames, animated, framerate, looped = false)
	{
		this.name = name;
		this.frames = frames;
		this.animated = animated;
		this.framerate = framerate;
		this.looped = looped;
	}
}
