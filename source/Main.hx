package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();
		// Modified to skip splash screen
		addChild(new FlxGame(
			0,
			0,
			states.MainMenuState,
			1,
			60,
			60,
			true
		));
	}
}
