package;

import flixel.FlxSprite;

class Bullet extends FlxSprite {
	public var xspeed: Float = 0;
	public var yspeed: Float = -3;
	public var team: Team;
	public override function update(elapsed: Float) {
		super.update(elapsed);
		x += xspeed;
		y += yspeed;
		if (!isOnScreen()) {
			kill();
		}
	}
}
