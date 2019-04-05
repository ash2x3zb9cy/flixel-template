package states;

import haxe.Cson;
import flixel.FlxG;
import openfl.Assets;
import flixel.FlxState;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

class PlayState extends FlxState {
	var player: Player;
	var bullets: FlxTypedGroup<Bullet>;
	var entities: FlxTypedGroup<Entity>;
	override public function create() {
		super.create();

		// enable use of trace() with the debugger
		FlxG.log.redirectTraces = true;

		bullets = new FlxTypedGroup<Bullet>();
		entities = new FlxTypedGroup<Entity>();

		player = new Player(FlxG.width/2, 400);
		entities.add(player);

		var testEnemy = new TweenEntity(100, 10);
		testEnemy.team = EnemyTeam;
		testEnemy.makeGraphic(64, 64, 0xffff00ff);
		entities.add(testEnemy);

		add(entities);
		add(bullets);
	}

	override public function update(elapsed: Float) {
		super.update(elapsed);

		if (FlxG.keys.anyPressed([SPACE])) {
			if (player.shotTimer >= player.shotInterval) {
				player.shotTimer = 0;
				var b = bullets.recycle(Bullet);
				b.makeGraphic(2, 16, flixel.util.FlxColor.WHITE);
				b.updateHitbox();
				b.x = player.x + (player.width/2) - (b.width/2);
				b.y = player.y - b.height/2;
				b.yspeed = -10;
				b.team = PlayerTeam;
			}
		}

		FlxG.overlap(bullets, entities, onBulletHit);
		FlxG.overlap(entities, entities, onEntityCollide);

		if (!player.alive) {
			openSubState(new states.sub.GameOver());
		}
	}

	function onBulletHit(bullet: Bullet, entity: Entity) {
		if (bullet.team != entity.team) {
			entity.kill();
			bullet.kill();
		}
	}

	function onEntityCollide(ent1: Entity, ent2: Entity) {
		if (ent1.team != ent2.team) {
			ent1.kill();
			ent2.kill();
		}
	}

	function readCson(filename: String): Dynamic {
		var file = Assets.getText(filename);
		return Cson.parse(file);
	}
}
