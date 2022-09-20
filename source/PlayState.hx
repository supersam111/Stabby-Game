package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var player:Player;
	var enemy:Array<Enemy>;
	var sword:Sword;

	var playerScoreText:FlxText;
	var enemyScoreText:FlxText;
	var playerScore:Int;
	var enemyScore:Int;

	var i:Int; // Iterator variable
	var ENEMNUM:Int = 2;

	override public function create()
	{
		// add play pieces
		player = new Player(50, 50);
		add(player);

		// Managing multiple enemies
		enemy = new Array<Enemy>();
		for (i in 0...ENEMNUM)
		{
			enemy[i] = new Enemy(Math.random() * FlxG.width, Math.random() * FlxG.height);
			add(enemy[i]);
		}

		sword = new Sword();
		add(sword);

		// add UI
		playerScore = 0;
		enemyScore = 0;
		playerScoreText = new FlxText(0, 0, 0, "Player: 0");
		add(playerScoreText);
		enemyScoreText = new FlxText(FlxG.width / 2, 0, 0, "Enemy: 0");
		add(enemyScoreText);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		sword.attack(player);

		// Enemy movement and collision detection
		for (i in 0...enemy.length)
		{
			enemy[i].trackPlayer(player.x, player.y);
			FlxG.collide(player, enemy[i], contactKill);
			FlxG.collide(enemy[i], sword, contactKill);
		}
	}

	function contactKill(objA:FlxSprite, objB:FlxSprite):Void
	{
		//	kill and revive
		objA.kill();
		objA.revive();
		objA.x = Math.random() * FlxG.width;
		objA.y = Math.random() * FlxG.height;
	}
}
