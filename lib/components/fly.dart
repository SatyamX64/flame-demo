import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_demo/demo-game.dart';

class Fly {
  final DemoGame demoGame;
  Rect flyRect;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  Offset targetLocation;
  double get speed => demoGame.tileSize * 3;
  Fly(this.demoGame) {
    setTargetLocation();
  }
  void setTargetLocation() {
    double x = demoGame.random.nextDouble() *
        (demoGame.screenSize.width - (demoGame.tileSize * 2.025));
    double y = demoGame.random.nextDouble() *
        (demoGame.screenSize.height - (demoGame.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, demoGame.tileSize * 12 * t);
    } else {
      // To Move the Fly
      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
      // To flap the Wings
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
    }
    if (flyRect.top > demoGame.screenSize.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
    isDead = true;
    demoGame.spawnFly();
  }
}
