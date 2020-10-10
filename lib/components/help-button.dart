import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_demo/demo-game.dart';
import 'package:flame_demo/view.dart';

class HelpButton {
  final DemoGame demoGame;
  Rect rect;
  Sprite sprite;

  HelpButton(this.demoGame) {
    rect = Rect.fromLTWH(
      demoGame.tileSize * .25,
      demoGame.screenSize.height - (demoGame.tileSize * 1.25),
      demoGame.tileSize,
      demoGame.tileSize,
    );
    sprite = Sprite('ui/icon-help.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    demoGame.activeView = View.help;
  }
}
