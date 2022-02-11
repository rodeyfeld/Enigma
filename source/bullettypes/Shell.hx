package bullettypes;

import AnimationMap;

class Shell extends BulletType
{
	public function new()
	{
		super({
			'graphic': AssetPaths.shell__png,
			'height': 16,
			'width': 16,
			'cooldown': 50,
			'timer': 10,
			'moveSpeed': 100,
			'animations': [new AnimationMap("fire", [0, 1, 2, 3], true, 6)],
			'damage': 1,
		});
	}
}
