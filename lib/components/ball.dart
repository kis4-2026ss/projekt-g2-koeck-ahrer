import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../breakout_game.dart';
import 'paddle.dart';
import 'brick.dart';

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
    if (position.x <= radius || position.x >= GameConstants.gameWidth - radius) {
      velocity.x = -velocity.x;
      position.x = position.x.clamp(radius, GameConstants.gameWidth - radius);
    }

    if (position.y <= radius) {
      velocity.y = -velocity.y;
      position.y = position.y.clamp(radius, GameConstants.gameHeight);
    }

    // Ball out of bounds (bottom)
    if (position.y > GameConstants.gameHeight) {
      gameRef.loseLife();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Paddle) {
      // Bounce up
      velocity.y = -velocity.y;
      
      // Prevent sticking inside the paddle by moving the ball to the top edge
      position.y = other.position.y - radius;

      // Variable bounce angle based on hit position (logic from Python reference)
      final offset = position.x - (other.position.x + other.size.x / 2);
      
      // Speed factor mapping (Python used 5, 6, 7 where 6 was init)
      // We use GameConstants.ballSpeedX as base (which is equivalent to 6)
      final baseSpeed = GameConstants.ballSpeedX;
      
      if (offset > 0) {
        if (offset > 30) {
          velocity.x = baseSpeed * (7 / 6);
        } else if (offset > 23) {
          velocity.x = baseSpeed * (6 / 6);
        } else if (offset > 17) {
          velocity.x = baseSpeed * (5 / 6);
        }
      } else {
        if (offset < -30) {
          velocity.x = -baseSpeed * (7 / 6);
        } else if (offset < -23) {
          velocity.x = -baseSpeed * (6 / 6);
        } else if (offset < -17) {
          velocity.x = -baseSpeed * (5 / 6);
        }
      }
      
      // Optional: Add sound here later
    } else if (other is Brick) {
      // Logic from Python: check if hit from side or top/bottom
      if (position.x > other.position.x + other.size.x || position.x < other.position.x) {
        velocity.x = -velocity.x;
      } else {
        velocity.y = -velocity.y;
      }
      
      other.hit();
      gameRef.score += 10;
      gameRef.checkWinCondition();
      
      // Optional: Add sound here later
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
