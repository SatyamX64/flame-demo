import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_demo/components/fly.dart';
import 'package:flame_demo/demo-game.dart';

class DroolerFly extends Fly {
  double get speed => demoGame.tileSize * 1.5;
  DroolerFly(DemoGame demoGame, double x, double y) : super(demoGame) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
    flyRect =
        Rect.fromLTWH(x, y, demoGame.tileSize * 1.5, demoGame.tileSize * 1.5);
  }
}
