package weapons;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.math.FlxPoint;

class IceNovaBall extends Weapon
{
	var emitterParticle:FlxParticle;
	var regularShot:RegularShot;
	var iceBallBulletType:IceBall;
	var iceShardBulletType:IceShard;

	public function new()
	{
		iceBallBulletType = new IceBall();
		regularShot = new RegularShot();
		iceShardBulletType = new IceShard();

		super(regularShot, iceBallBulletType);
	}

	override public function fireWeapon()
	{
		var newEmitter:FlxEmitter = new FlxEmitter(regularShot.params.startX, regularShot.params.startY);
		newEmitter.launchMode = FlxEmitterMode.CIRCLE;
		for (i in 0...100)
		{
			emitterParticle = new FlxParticle();
			// emitterParticle.velocity.rotate(FlxPoint.weak(0, 0), regularShot.params.fireAngle);
			emitterParticle.lifespan = iceShardBulletType.params.lifeSpan;
			// emitterParticle.velocity.set(iceShardBulletType.params.moveSpeed);
			emitterParticle.loadGraphic(iceShardBulletType.params.graphic, true, iceShardBulletType.params.width, iceShardBulletType.params.height);
			newEmitter.add(emitterParticle);
		}
		iceBallBulletType.params.aliveEmmiter = newEmitter;
		var bullet:Bullet = new Bullet(regularShot, iceBallBulletType);
		return bullet;
	}

	override public function updateWeaponParams(params:Map<String, Float>)
	{
		regularShot.params.startX = params['startX'];
		regularShot.params.startY = params['startY'];
		// weaponType.params.destX = null;
		// weaponType.params.destY = null;
		regularShot.params.fireAngle = params['fireAngle'];
	}
}
