import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Brick extends RectangleComponent with CollisionCallbacks {
  Brick({required Vector2 position})
      : super(
          position: position,
          size: Vector2(GameConstants.brickWidth, GameConstants.brickHeight),
          paint: Paint()..color = GameConstants.brickColor,
        );

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox());
  }

  void hit() {
    removeFromParent();
  }
}
