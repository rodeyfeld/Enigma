package utils;

class Step
{
	// https://www.rosettacode.org/wiki/Loops/For_with_a_specified_step#Haxe
	var end:Int;
	var step:Int;
	var index:Int;

	public inline function new(start:Int, end:Int, step:Int)
	{
		this.index = start;
		this.end = end;
		this.step = step;
	}

	public inline function hasNext()
		return step > 0 ? end >= index : index >= end;

	public inline function next()
		return (index += step) - step;
}
