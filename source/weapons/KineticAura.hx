package weapons;

class KineticAura extends Weapon
{
	public function new()
	{
		var energyCircleBulletType = new EnergyCircle();
		var auraWeaponPattern = new Aura(0, 0, null);
		super(auraWeaponPattern, energyCircleBulletType);
	}

	override public function fireWeapon()
	{
		var bullet = new Bullet(weaponType, bulletType);
		bullet.setSize(32, 32);
		bullet.scale.set(2, 2);
		bullet.origin.set(12, 12);
		bullets.add(bullet);
	}
}
