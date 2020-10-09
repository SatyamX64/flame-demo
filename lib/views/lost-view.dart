import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_demo/demo-game.dart';

class LostView {
  final DemoGame demoGame;
  Rect rect;
  Sprite sprite;

  LostView(this.demoGame) {
    rect = Rect.fromLTWH(
      demoGame.tileSize,
      (demoGame.screenSize.height / 2) - (demoGame.tileSize * 5),
      demoGame.tileSize * 7,
      demoGame.tileSize * 5,
    );
    sprite = Sprite('bg/lose-splash.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}
}