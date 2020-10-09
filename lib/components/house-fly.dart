import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_demo/components/fly.dart';
import 'package:flame_demo/demo-game.dart';

class HouseFly extends Fly {
  HouseFly(DemoGame game, double x, double y) : super(game) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
  }
}
