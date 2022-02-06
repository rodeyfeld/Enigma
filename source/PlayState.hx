package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var player:Player;
	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;
	var ground:FlxTilemap;
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
	// Enemy Variables
	var enemies:FlxTypedGroup<Enemy>;
	var enemySpawnTimer:Float;

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

		enemySpawnTimer = 100;
		enemies = new FlxTypedGroup<Enemy>();
		add(enemies);

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

	function spawnEnemy()
	{
		var randomGenerator = new FlxRandom();

		var halfCameraHeight = camera.height / 2;
		var halfCameraWidth = camera.width / 2;
		var topLeft = [player.x - halfCameraWidth, player.y - halfCameraHeight];
		var topRight = [player.x + halfCameraWidth, player.y - halfCameraHeight];
		var botLeft = [player.x - halfCameraWidth, player.y + halfCameraHeight];
		var botRight = [player.x + halfCameraWidth, player.y + halfCameraHeight];

		var northSpawn = [player.x, randomX.float(topLeft[0], topRight[0]), player.y - halfCameraHeight];
		var eastSpawn = [player.x - halfCameraWidth, randomY.float(topLeft[1], botLeft[1])];
		var southSpawn = [player.x + randomX.float(botLeft[0], botRight[0]), player.y + halfCameraHeight];
		var westSpawn = [player.x + halfCameraWidth, randomY.float(topRight[1], botRight[1])];

		var spawnPoints = [northSpawn, eastSpawn, southSpawn, westSpawn];
		var spawnPoint = spawnPoints[randomGenerator.int(0, spawnPoints.length - 1)];
		var enemy = new Enemy(spawnPoint[0], spawnPoint[1], Enemy.EnemyType.REGULAR);
		if (!walls.overlaps(enemy))
		{
			enemies.add(enemy);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
		FlxG.overlap(player, coins, playerTouchCoin);

		// Pickup spawning logic
		if (randomChance.bool(10))
		{
			coins.add(new Coin(randomX.int(1, cast(walls.width, Int)), randomY.int(1, cast(walls.height, Int))));
		}

		// Enemy spawining logic
		if (enemySpawnTimer <= 0)
		{
			enemySpawnTimer = 100;
			spawnEnemy();
		}
		enemySpawnTimer -= 1;
		enemies.forEachAlive(checkEnemyVision);
	}

	function checkEnemyVision(enemy:Enemy)
	{
		if (walls.ray(enemy.getMidpoint(), player.getMidpoint()))
		{
			enemy.seesPlayer = true;
			enemy.playerPosition = player.getMidpoint();
		}
		else
		{
			enemy.seesPlayer = false;
		}
	}
}
