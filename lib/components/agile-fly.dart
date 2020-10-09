import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_demo/components/fly.dart';
import 'package:flame_demo/demo-game.dart';

class AgileFly extends Fly {
  double get speed => demoGame.tileSize * 5;
  AgileFly(DemoGame demoGame, double x, double y) : super(demoGame) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
    flyRect = Rect.fromLTWH(x, y, demoGame.tileSize * 1.5, demoGame.tileSize * 1.5);
  }
}
