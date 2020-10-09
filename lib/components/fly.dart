import 'dart:ui';

import 'package:flame_demo/demo-game.dart';

class Fly {
  final DemoGame demoGame;
  Rect flyRect;
  Paint flyPaint;

  Fly(this.demoGame, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, demoGame.tileSize, demoGame.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xFF6AB04C);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {}
}
