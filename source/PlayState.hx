package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var player:Player;
	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;
	var ground:FlxTilemap;
	// var enemies:FlxTypedGroup<Enemy>;
	// var buildings:FlxTypedGroup<Building>;
	var background:FlxSpriteGroup;
	var backdrop:FlxSpriteGroup;

	override public function create()
	{
		super.create();
		var project = new LdtkProject();
		map = new FlxOgmo3Loader(AssetPaths.enigma__ogmo, AssetPaths.level1__json);
		walls = map.loadTilemap(AssetPaths.TX_Tileset_Grass__png, "walls");
		ground = map.loadTilemap(AssetPaths.TX_Tileset_Grass__png, "ground");
		// walls.follow();
		// walls.setTileProperties(1, NONE);
		// walls.setTileProperties(2, ANY);
		add(ground);
		add(walls);

		// trace(mapData);

		player = new Player();
		add(player);
		FlxG.camera.follow(player, LOCKON, 1);
		map.loadEntities(placeEntities, "entities");
		// add(player);
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			player.setPosition(entity.x, entity.y);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
	}
}
