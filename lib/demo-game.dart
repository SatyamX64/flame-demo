import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flame_demo/components/agile-fly.dart';
import 'package:flame_demo/components/backyard.dart';
import 'package:flame_demo/components/drooler-fly.dart';
import 'package:flame_demo/components/house-fly.dart';
import 'package:flame_demo/components/hungry-fly.dart';
import 'package:flame_demo/components/macho-fly.dart';
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
    double x = random.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = random.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (random.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
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
