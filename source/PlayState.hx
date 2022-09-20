package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var player:Player;
	var enemy:Enemy;
	var sword:Sword;

	var playerScoreText:FlxText;
	var enemyScoreText:FlxText;
	var playerScore:Int;
	var enemyScore:Int;

	override public function create()
	{
		// add play pieces
		player = new Player(50, 50);
		add(player);
		enemy = new Enemy(200, 200);
		add(enemy);
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
		enemy.trackPlayer(player.x, player.y);
		sword.attack(player);
		FlxG.collide(player, enemy, contactKill);
		FlxG.collide(enemy, sword, contactKill);
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
