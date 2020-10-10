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
import 'package:flame_demo/components/start-button.dart';
import 'package:flame_demo/controllers/spawner.dart';
import 'package:flame_demo/view.dart';
import 'package:flame_demo/views/home-view.dart';
import 'package:flame_demo/views/lost-view.dart';
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
  HomeView homeView;
  LostView lostView;
  StartButton startButton;
  FlySpawner spawner;
  DemoGame() {
    initialize();
  }
  View activeView = View.home;

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    random = Random();
    background = Backyard(this);
    homeView = HomeView(this);
    lostView = LostView(this);
    startButton = StartButton(this);
    spawner = FlySpawner(this);
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));
    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
    if (activeView == View.lost) lostView.render(canvas);
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    spawner.update(t);
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
    bool isHandled = false;
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }
    if (!isHandled) {
      bool didHitAFly = false;
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitAFly = true;
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        activeView = View.lost;
      }
    }
  }
}
