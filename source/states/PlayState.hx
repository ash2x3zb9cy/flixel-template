package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;

import flixel.text.FlxText;

class PlayState extends FlxState {
	var square: FlxSprite;
	var player: entities.Player;
	override public function create() {
		super.create();

		// enable use of trace() with the debugger
		FlxG.log.redirectTraces = true;

		square = (new FlxSprite(64, 128)).makeGraphic(32, 32, 0xffff0000);
		add(square);

		player = new entities.Player();
		add(player);

		add(new FlxText(0, 0, 0, CsonLib.readFile(AssetPaths.sampledata__cson).text));
	}

	override public function update(elapsed: Float) {
		super.update(elapsed);

		square.x++;

		FlxG.collide(player, square);
	}
}
