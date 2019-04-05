package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.VarTween;

private typedef TweenData = {
	values: Dynamic,
	duration: Float,
	?options: TweenOptions
}

// a tween entity, or tweentity if you will
// TODO: allow for eg circular motion using CircularMotion (FlxTween.circularMotion)
class TweenEntity extends Entity {

	var tweens: Array<TweenData>;

	function new(?X, ?Y, ?SG) {
		super(X, Y, SG);
		this.tweens = [
			{
				values: { x: 600 },
				duration: 2.0,
				options: {
					ease: FlxEase.expoInOut
				}
			}, {
				values: { y: 200 },
				duration: 5.0
			}, {
				values: { x: 0, y: 0 },
				duration: 4.0,
				options: {
					startDelay: 1
				}
			}
		];

		var d = this.tweens.shift();
		var tween: FlxTween = FlxTween.tween(
			this,
			d.values,
			d.duration,
			d.options
		);

		// queue up the tweens
		for (data in this.tweens) {
			tween = tween.then(FlxTween.tween(
				this, data.values, data.duration, data.options
			));
		}
	}
}
