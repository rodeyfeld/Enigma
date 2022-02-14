package bullettypes;

import AnimationMap;

class IceBall extends BulletType
{
	public function new()
	{
		super({
			'graphic': AssetPaths.iceball__png,
			'height': 16,
			'width': 16,
			'cooldown': 200,
			'timer': 10,
			'moveSpeed': 100,
			'animations': [new AnimationMap("fire", [0, 1, 2, 3, 4, 5], true, 6)],
			'damage': 1,
			'lifeSpan': 4,
			'aliveEmmiter': null
		});
	}
}
