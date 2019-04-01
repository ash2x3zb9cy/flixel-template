package states.sub;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class GameOver extends FlxSubState {
	override public function create() {
		super.create();
		var text = new FlxText(0, 32, FlxG.width, "Game Over", 24);
		text.alignment = "center";
		add(text);

		var w = 64;
		var restartButton = new FlxButton(
			FlxG.width/2 - w/2,
			96,
			"Restart level",
			function() {
				FlxG.resetState();
			}
		);
		add(restartButton);

		var mainMenuButton = new FlxButton(
			FlxG.width/2 - w/2,
			128,
			"Main menu",
			function() {
				FlxG.switchState(new states.MainMenuState());
			}
		);
		add(mainMenuButton);
	}
}
