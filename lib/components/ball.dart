import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../breakout_game.dart';

class Ball extends CircleComponent with HasGameRef<BreakoutGame>, CollisionCallbacks {
  Ball()
      : super(
          radius: GameConstants.ballRadius,
          paint: Paint()..color = GameConstants.ballColor,
          anchor: Anchor.center,
        );

  Vector2 velocity = Vector2(GameConstants.ballSpeedX, -GameConstants.ballSpeedY);

  @override
  Future<void> onLoad() async {
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    // Boundary Bouncing
    if (position.x <= radius || position.x >= gameRef.size.x - radius) {
      velocity.x = -velocity.x;
      position.x = position.x.clamp(radius, gameRef.size.x - radius);
    }

    if (position.y <= radius) {
      velocity.y = -velocity.y;
      position.y = position.y.clamp(radius, gameRef.size.y);
    }

    // Ball out of bounds (bottom)
    if (position.y > gameRef.size.y) {
      gameRef.loseLife();
    }
  }

  void reset() {
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    final random = Random();
    double vx = GameConstants.ballSpeedX;
    if (random.nextBool()) vx = -vx;
    velocity = Vector2(vx, -GameConstants.ballSpeedY);
  }
}
