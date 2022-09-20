package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class Scorekeeping extends FlxTypedGroup<FlxSprite>
{
	var background:FlxSprite;
	var playerScore:Int = 0;
	var enemyScore:Int = 0;

	var playerScoreText:FlxText;
	var enemyScoreText:FlxText;

	public function new()
	{
		super();
		background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);

		playerScoreText = new FlxText(0, 2, 0, "Player: 0");
		enemyScoreText = new FlxText(0, 18, 0, "Enemy: 0");
		add(playerScoreText);
		add(enemyScoreText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	public function updateScore(pScore, eScore)
	{
		playerScore += pScore;
		enemyScore += eScore;
		playerScoreText.text = "Player: " + Std.string(playerScore);
		enemyScoreText.text = "Enemy: " + Std.string(enemyScore);
	}
}
