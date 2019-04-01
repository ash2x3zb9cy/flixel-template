package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends Entity {

	public var xspeed: Float = 6;
	public var yspeed: Float = 4;

	public var shotInterval = (5/60);
	public var shotTimer: Float;

	public override function new(x, y) {
		super(x, y);
		loadGraphic(AssetPaths.image__png);
		this.team = PlayerTeam;
		shotTimer = 0;
	}

	public override function update(elapsed: Float) {
		super.update(elapsed);

		shotTimer += elapsed;

		var dx: Float = 0;
		if (FlxG.keys.anyPressed([A])) {
			dx -= xspeed;
		}
		if (FlxG.keys.anyPressed([D])) {
			dx += xspeed;
		}
		x += dx;

		var dy: Float = 0;
		if (FlxG.keys.anyPressed([W])) {
			dy -= yspeed;
		}
		if (FlxG.keys.anyPressed([S])) {
			dy += yspeed;
		}
		y += dy;
	}
}
