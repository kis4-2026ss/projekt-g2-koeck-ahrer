import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/paddle.dart';
import 'components/ball.dart';

class BreakoutGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  late Paddle paddle;
  late Ball ball;
  
  int score = 0;
  int lives = GameConstants.maxLives;

  @override
  Color backgroundColor() => GameConstants.bgColor;

  @override
  Future<void> onLoad() async {
    // The new Flame Camera system (v1.8.0+) uses a World component
    // We add our components to the world, and the camera looks at the world.
    final world = World();
    
    // Set up the camera with a fixed resolution
    camera = CameraComponent.withFixedResolution(
      width: GameConstants.gameWidth,
      height: GameConstants.gameHeight,
      world: world,
    );
    
    // Viewport usually centers the world, so we move the camera's view 
    // to match our 0,0 to width,height coordinate system.
    camera.viewfinder.anchor = Anchor.topLeft;

    paddle = Paddle()
      ..position = Vector2(
        (GameConstants.gameWidth - GameConstants.paddleWidth) / 2,
        GameConstants.gameHeight - 40,
      );
    
    ball = Ball()
      ..position = Vector2(GameConstants.gameWidth / 2, GameConstants.gameHeight / 2);

    world.add(paddle);
    world.add(ball);
    
    // Add world and camera to the game
    addAll([world, camera]);
    
    // FPS counter (added directly to the game, not the world, so it stays fixed on screen)
    add(FpsTextComponent(position: Vector2(10, 10)));
  }

  void loseLife() {
    lives--;
    if (lives <= 0) {
      gameOver();
    } else {
      ball.reset();
    }
  }

  void gameOver() {
    print("Game Over!");
    resetGame();
  }

  void resetGame() {
    score = 0;
    lives = GameConstants.maxLives;
    ball.reset();
  }
}
