package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Enemy extends FlxSprite
{
	var VEL:Float = 100;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.RED);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	public function trackPlayer(playerX:Float, playerY:Float)
	{
		if (Math.abs(playerX - x) > Math.abs(playerY - y))
		{
			if (playerX > x)
				velocity.x = VEL;
			else
				velocity.x = -1 * VEL;
		}
		else
		{
			if (playerY > y)
				velocity.y = VEL;
			else
				velocity.y = -1 * VEL;
		}

		if ((playerX + 10 > x) && (playerX - 10 < x))
			velocity.x = 0;

		if ((velocity.x != 0) && (velocity.y != 0))
		{
			velocity.x = 0.707 * velocity.x;
			velocity.y = 0.707 * velocity.y;
		}
	}
}
