package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var player:Player;
	var enemy:Array<Enemy>;
	var sword:Sword;

	var i:Int; // Iterator variable
	var ENEMNUM:Int = 2;

	var scorecard:Scorekeeping;

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
		scorecard = new Scorekeeping();
		add(scorecard);

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
			FlxG.collide(player, enemy[i], playerKilled);
			FlxG.collide(enemy[i], sword, enemyKilled);
		}
	}

	function playerKilled(objA:FlxSprite, objB:FlxSprite):Void
	{
		contactKill(objA);
		scorecard.updateScore(0, 1);
	}

	function enemyKilled(objA:FlxSprite, objB:FlxSprite):Void
	{
		contactKill(objA);
		scorecard.updateScore(1, 0);
	}

	function contactKill(objA:FlxSprite)
	{
		//	kill and revive
		objA.kill();
		objA.revive();
		objA.x = Math.random() * FlxG.width;
		objA.y = Math.random() * FlxG.height;
	}
}
