package;

class AnimationMap
{
	var name:String;
	var frames:Array<Int>;
	var animated:Bool;
	var framerate:Int;

	public function new(name, frames, animated, framerate)
	{
		this.name = name;
		this.frames = frames;
		this.animated = animated;
		this.framerate = framerate;
	}
}
