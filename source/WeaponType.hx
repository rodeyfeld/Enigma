package;

class WeaponType
{
	public var params:WeaponTypeDefinition;

	public function new(params:WeaponTypeDefinition)
	{
		this.params = params;
	}

	public function checkType()
	{
		trace("CALLED IN WEAPONTYPE");
	}
}
