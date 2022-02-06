package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxRandom;
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
	// HUD Variables
	var hud:HUD;
	var money:Int = 0;
	var health:Int = 3;
	// Coin Variables
	var coins:FlxTypedGroup<Coin>;
	var randomX = new FlxRandom();
	var randomY = new FlxRandom();
	var randomChance = new FlxRandom();
	// Camera Variables
	var mainCam:FlxCamera;

	override public function create()
	{
		// HUD Declaration
		hud = new HUD();

		super.create();

		// World Setup
		// FlxG.worldBounds = new FlxRect(0, 0, 1023, 1023);

		map = new FlxOgmo3Loader(AssetPaths.enigma__ogmo, AssetPaths.level1__json);
		walls = map.loadTilemap(AssetPaths.TX_Tileset_Grass__png, "walls");
		ground = map.loadTilemap(AssetPaths.TX_Tileset_Grass__png, "ground");
		trace(walls.widthInTiles, walls.width);
		FlxG.worldBounds.set(0, 0, walls.width, walls.height);
		add(ground);
		add(walls);

		coins = new FlxTypedGroup<Coin>();
		add(coins);

		player = new Player();
		add(player);
		add(hud);
		FlxG.camera.follow(player, LOCKON, 1);
		// mainCam = new FlxCamera(cast(player.x, Int), cast(player.y, Int), 16, 16, 1);
		// FlxG.camera.setPosition(player.x, player.y);
		map.loadEntities(placeEntities, "entities");
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			player.setPosition(entity.x, entity.y);
		}
	}

	function playerTouchCoin(player:Player, coin:Coin)
	{
		if (player.alive && player.exists && coin.alive && coin.exists)
		{
			coin.kill();
			money++;
			hud.updateHUD(health, money);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
		FlxG.collide(player, coins, playerTouchCoin);
		if (randomChance.bool(10))
		{
			coins.add(new Coin(randomX.int(1, 1024), randomY.int(1, 1024)));
		}
	}
}
