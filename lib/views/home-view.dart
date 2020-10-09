import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_demo/demo-game.dart';

class HomeView {
  final DemoGame demoGame;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.demoGame) {
    titleRect = Rect.fromLTWH(
      demoGame.tileSize,
      (demoGame.screenSize.height / 2) - (demoGame.tileSize * 4),
      demoGame.tileSize * 7,
      demoGame.tileSize * 4,
    );
    titleSprite = Sprite('branding/title.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}
