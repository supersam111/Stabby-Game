package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;

class Sword extends FlxSprite
{
	var fight:Bool;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.GRAY);
		kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	public function attack(player:FlxSprite)
	{
		fight = FlxG.keys.pressed.SPACE;
		if (fight)
		{
			revive();
			if (player.facing == UP)
			{
				x = player.x;
				y = player.y - height;
			}
			if (player.facing == DOWN)
			{
				x = player.x;
				y = player.y + player.height;
			}
			if (player.facing == LEFT)
			{
				x = player.x - width;
				y = player.y;
			}
			if (player.facing == RIGHT)
			{
				x = player.x + player.width;
				y = player.y;
			}
		}
		else
		{
			kill();
		}
	}
}
