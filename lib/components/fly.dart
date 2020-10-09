import 'dart:ui';

import 'package:flame_demo/demo-game.dart';

class Fly {
  final DemoGame demoGame;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.demoGame, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, demoGame.tileSize, demoGame.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xFF6AB04C);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, demoGame.tileSize * 12 * t);
    }
    if (flyRect.top > demoGame.screenSize.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
    isDead = true;
    flyPaint.color = Color(0xFFFF4757);
    demoGame.spawnFly();
  }
}
