package state;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.math.FlxRect;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

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
	var camAnchor:FlxObject;
	// UI Variables
	var healthBar:FlxBar;
	var mainCam:FlxCamera;
	// Enemy Variables
	var enemies:FlxTypedGroup<Enemy>;
	var enemySpawnTimer:Float;

	// Bullet Variables
	var playerBullets:FlxTypedGroup<Bullet>;
	var fireAngle:Float;

	override public function create()
	{
		// HUD Declaration
		hud = new HUD();

		super.create();

		// World Setup
		// FlxG.worldBounds = new FlxRect(0, 0, 1023, 1023);

		// World creation
		map = new FlxOgmo3Loader(AssetPaths.enigma__ogmo, AssetPaths.sandbox__json);
		walls = map.loadTilemap(AssetPaths.TX_Tileset_Grass__png, "walls");
		ground = map.loadTilemap(AssetPaths.TX_Tileset_Grass__png, "ground");
		FlxG.worldBounds.set(0, 0, walls.width, walls.height);
		add(ground);
		add(walls);

		// Coins
		coins = new FlxTypedGroup<Coin>();
		add(coins);

		// Enemy
		enemySpawnTimer = 10000000;
		enemies = new FlxTypedGroup<Enemy>();
		add(enemies);

		// Player
		player = new Player();
		add(player);
		add(hud);
		playerBullets = new FlxTypedGroup<Bullet>();

		// add cam anchor (or follow point or whatever) and make the camera follow it
		camAnchor = new FlxObject();
		add(camAnchor);
		FlxG.camera.follow(camAnchor, LOCKON, 0.2);

		map.loadEntities(placeEntities, "entities");

		healthBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 20, 6, player, "health", 0, 100, true);
		healthBar.createFilledBar(FlxColor.RED, FlxColor.GREEN, true);
		healthBar.trackParent(-6, 15);
		add(healthBar);
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			player.setPosition(entity.x, entity.y);
		}
		else if (entity.name == "enemy")
		{
			var enemy = new Enemy(entity.x, entity.y, BOSS);
			enemies.add(enemy);
			add(enemy.enemyHealthBar);
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

	function bulletTouchEnemy(bullet:Bullet, enemy:Enemy)
	{
		if (bullet.alive && bullet.exists && enemy.alive && enemy.exists)
		{
			enemy.health -= bullet.bulletType.params.damage;
			trace("HIT");
			// Check if bullet should remain after colliding
			if (!bullet.bulletType.params.persist)
			{
				bullet.kill();
			}
			if (enemy.health <= 0)
			{
				enemy.kill();
				if (randomChance.bool(50))
				{
					coins.add(new Coin(enemy.x, enemy.y));
				}
			}
		}
	}

	function spawnEnemy()
	{
		// Spawning logic
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
			add(enemy.enemyHealthBar);
			enemies.add(enemy);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
		FlxG.collide(enemies);
		FlxG.collide(enemies, player);
		FlxG.overlap(player, coins, playerTouchCoin);

		// Camera Update Logic
		var diffX = FlxG.mouse.screenX - (FlxG.width / 2);
		var diffY = FlxG.mouse.screenY - (FlxG.height / 2);
		var angle = Math.atan2(diffY, diffX);
		var distance = Math.sqrt(diffX * diffX + diffY * diffY);
		distance *= 0.2;
		var distanceX = Math.cos(angle) * distance;
		var distanceY = Math.sin(angle) * distance;
		camAnchor.x = distanceX + player.x;
		camAnchor.y = distanceY + player.y;

		// Enemy spawining logic
		if (enemySpawnTimer <= 0)
		{
			enemySpawnTimer = 100;
			spawnEnemy();
		}
		enemySpawnTimer -= 1;
		enemies.forEachAlive(checkEnemyVision);

		// Bullet logic
		checkWeaponLogic(player);
		checkBulletLogic();
	}

	function checkWeaponLogic(player:Player)
	{
		// trace(player.weapons);
		for (weapon in player.weapons)
		{
			if (weapon.bulletType.params.timer <= 0)
			{
				fireAngle = FlxAngle.angleBetweenMouse(player, true) % 360;
				var currentEnemy:FlxSprite = player;
				var nextEnemy:FlxSprite = enemies.getRandom();
				var updatedWeaponParams:Map<String, Float>;
				// trace(weapon);
				for (i in 0...weapon.weaponType.params.magazine)
				{
					if (weapon.weaponType.params.weaponBehavior == WeaponBehaviors.CHAINSHOT)
					{
						updatedWeaponParams = ['startX' => currentEnemy.x, 'startY' => currentEnemy.y, 'fireAngle' => fireAngle];
					}
					else
					{
						updatedWeaponParams = ['startX' => player.x, 'startY' => player.y, 'fireAngle' => fireAngle];
					}
					weapon.updateWeaponParams(updatedWeaponParams);
					var bullet:Bullet = weapon.fireWeapon();
					if (bullet.bulletType.params.aliveEmmiter != null)
					{
						// bullet.bulletType.params.aliveEmmiter.focusOn(bullet);
						bullet.bulletType.params.aliveEmmiter.start(false, .2, 0);
						add(bullet.bulletType.params.aliveEmmiter);
					}
					playerBullets.add(bullet);

					currentEnemy = nextEnemy;
					nextEnemy = enemies.getRandom();
					fireAngle = FlxAngle.angleBetween(currentEnemy, nextEnemy, true) % 360;
					add(playerBullets);

					trace("HMM1");
				}
				weapon.bulletType.params.timer = weapon.bulletType.params.cooldown;
			}
			weapon.bulletType.params.timer -= 1;
		}
	}

	function checkBulletLogic()
	{
		for (bullet in playerBullets)
		{
			var result:Bool = FlxG.overlap(bullet, enemies, bulletTouchEnemy);
			trace(result);
		}
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
