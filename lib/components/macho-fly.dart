import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_demo/components/fly.dart';
import 'package:flame_demo/demo-game.dart';

class MachoFly extends Fly {
  double get speed => demoGame.tileSize * 2.5;
  MachoFly(DemoGame demoGame, double x, double y) : super(demoGame) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
    flyRect = Rect.fromLTWH(x, y, demoGame.tileSize * 2.025, demoGame.tileSize * 2.025);
  }
}
