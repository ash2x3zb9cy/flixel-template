package;

import flixel.group.FlxSpriteGroup;

class Spinner extends FlxSpriteGroup {
	private var speed: Float;
	public function new(Speed:Float = 100) {
		super();
		this.speed = Speed;
	}
	public override function update(elapsed: Float) {
		for (child in members) {
			child.angle += elapsed * speed;
		}
	}
}
