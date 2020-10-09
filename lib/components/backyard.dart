import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_demo/demo-game.dart';

class Backyard {
  final DemoGame demoGame;
  Sprite bgSprite;
  Rect bgRect;
  Backyard(this.demoGame) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      demoGame.screenSize.height - (demoGame.tileSize * 23),
      demoGame.tileSize * 9,
      demoGame.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
