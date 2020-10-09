import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';

import 'components/fly.dart';

class DemoGame extends Game with TapDetector {
  Size screenSize;
  double tileSize;
  List<Fly> flies = List();
  Random random;
  DemoGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    random = Random();
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xFF576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
  }

  void spawnFly() {
    double x = random.nextDouble() * (screenSize.width - tileSize);
    double y = random.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }
}
