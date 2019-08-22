package;

import haxe.Cson;
import openfl.Assets;

class CsonLib {
	public static function readFile(filename: String): Dynamic {
		var file = Assets.getText(filename);
		return Cson.parse(file);
	}
}
