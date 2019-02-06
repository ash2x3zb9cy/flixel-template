package states;

import haxe.Cson;
import flixel.FlxG;
import openfl.Assets;
import flixel.FlxState;

import flixel.text.FlxText;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		// enable use of trace() with the debugger
		FlxG.log.redirectTraces = true;

		// hello world
		var data = readCson(AssetPaths.sampledata__cson);
		trace(data);
		var text = new flixel.text.FlxText(0, 0, FlxG.width, data.hello, 24);
		text.alignment = "center";
		add(text);

		var spinner = new Spinner();
		add(spinner);

		// spinning square
		var square = new flixel.FlxSprite(FlxG.width/2,  120);
		square.makeGraphic(64, 64, 0xffff0000);
		spinner.add(square);

		// spinning sprite
		var sprite = new flixel.FlxSprite(FlxG.width/2, FlxG.height/2, AssetPaths.image__png);
		spinner.add(sprite);
	}

	override public function update(elapsed: Float) {
		super.update(elapsed);
	}

	function readCson(filename: String): Dynamic {
		var file = Assets.getText(filename);
		return Cson.parse(file);
	}
}
