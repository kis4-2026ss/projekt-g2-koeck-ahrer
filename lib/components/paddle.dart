import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../breakout_game.dart';

class Paddle extends RectangleComponent with HasGameRef<BreakoutGame>, KeyboardHandler, CollisionCallbacks {
  Paddle()
      : super(
          size: Vector2(GameConstants.paddleWidth, GameConstants.paddleHeight),
          paint: Paint()..color = GameConstants.paddleColor,
        );

  int _direction = 0;

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x += _direction * GameConstants.paddleSpeed * dt;
    position.x = position.x.clamp(0, GameConstants.gameWidth - size.x);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isLeftPressed = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightPressed = keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isLeftPressed && !isRightPressed) {
      _direction = -1;
    } else if (isRightPressed && !isLeftPressed) {
      _direction = 1;
    } else {
      _direction = 0;
    }

    return true;
  }
}
