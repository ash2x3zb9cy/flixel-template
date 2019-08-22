package states;

import flixel.FlxG;
import flixel.FlxState;

class MainMenuState extends FlxState {
	override public function create() {
		super.create();
		var text = new flixel.text.FlxText(0, 0, FlxG.width, "Game Name\nPress Any Key", 24);
		text.alignment = "center";
		add(text);
	}

	override public function update(elapsed: Float) {
		super.update(elapsed);
		if (FlxG.keys.firstPressed() != -1) {
			FlxG.switchState(new states.PlayState());
		}

		// skip main menu in debug mode
		#if debug
		FlxG.switchState(new states.PlayState());
		#end
	}
}
