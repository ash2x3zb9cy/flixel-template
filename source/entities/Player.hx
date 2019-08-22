package entities;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite {
	override public function new() {
		super();
		this.loadGraphic(AssetPaths.image__png);

		// not exactly centre-aligned but close enough
		this.x = FlxG.width / 2;
		this.y = FlxG.height / 2;
	}
	override public function update(elapsed: Float) {
		super.update(elapsed);

		var dx = 0;
		var dy = 0;
		if (FlxG.keys.anyPressed([A, LEFT])) dx--;
		if (FlxG.keys.anyPressed([D, RIGHT])) dx++;
		if (FlxG.keys.anyPressed([W, UP])) dy--;
		if (FlxG.keys.anyPressed([S, DOWN])) dy++;

		this.x += dx * 200 * elapsed;
		this.y += dy * 200 * elapsed;

	}
}
