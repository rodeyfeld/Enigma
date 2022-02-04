package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var player:Player;
	// var enemies:FlxTypedGroup<Enemy>;
	// var buildings:FlxTypedGroup<Building>;
	var background:FlxSpriteGroup;
	var backdrop:FlxSpriteGroup;

	public var ground:FlxTilemap;
	public var walls:FlxTilemap;

	override public function create()
	{
		super.create();
		var project = new LdtkProject();
		var ground2DArray = [
			for (i in 0...project.all_levels.Level_0.l_Ground.gridSize)
			{
				var mapItem = [
					for (j in 0...project.all_levels.Level_0.l_Ground.gridSize)
					{
						var tile = project.all_levels.Level_0.l_Ground.getTileStackAt(j, i);
						// trace(tile);
						if (tile.length > 0)
						{
							tile[0].tileId;
						}
						else
						{
							-1;
						}
					}
				];
				mapItem;
			}
		];
		var wall2DArray = [
			for (i in 0...project.all_levels.Level_0.l_Walls.gridSize)
			{
				var mapItem = [
					for (j in 0...project.all_levels.Level_0.l_Walls.gridSize)
					{
						var tile = project.all_levels.Level_0.l_Walls.getTileStackAt(j, i);
						// trace(tile);
						if (tile.length > 0)
						{
							tile[0].tileId;
						}
						else
						{
							-1;
						}
					}
				];
				mapItem;
			}
		];
		// trace(mapData);
		FlxG.camera.follow(player, LOCKON, 1);
		ground = new FlxTilemap();
		ground.loadMapFrom2DArray(ground2DArray, AssetPaths.TX_Tileset_Grass__png, 16, 16);
		add(ground);
		walls = new FlxTilemap();
		walls.loadMapFrom2DArray(wall2DArray, AssetPaths.TX_Tileset_Grass__png, 16, 16);
		add(walls);
		player = new Player();
		player.setPosition(project.all_levels.Level_0.l_Entities.all_Player[0].pixelX, project.all_levels.Level_0.l_Entities.all_Player[0].pixelY);

		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
	}
}
