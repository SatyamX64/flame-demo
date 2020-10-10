import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_demo/demo-game.dart';
import 'package:flame_demo/view.dart';

class StartButton {
  final DemoGame demoGame;
  Rect rect;
  Sprite sprite;

  StartButton(this.demoGame) {
    rect = Rect.fromLTWH(
      demoGame.tileSize * 1.5,
      (demoGame.screenSize.height * .75) - (demoGame.tileSize * 1.5),
      demoGame.tileSize * 6,
      demoGame.tileSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    demoGame.activeView = View.playing;
    demoGame.spawner.start();
  }
}
