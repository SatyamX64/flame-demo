import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flame_demo/components/backyard.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/fly.dart';

class DemoGame extends Game with TapDetector {
  Size screenSize;
  double tileSize;
  List<Fly> flies = List();
  Backyard background;
  Random random;
  DemoGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    random = Random();
    background = Backyard(this);
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
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

  @override
  void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
