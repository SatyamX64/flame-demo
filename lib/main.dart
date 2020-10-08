import 'package:flame/util.dart';
import 'package:flame_demo/demo-game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  DemoGame demoGame = DemoGame();
  runApp(demoGame.widget);
}
