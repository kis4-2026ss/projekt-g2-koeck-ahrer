import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/paddle.dart';
import 'components/ball.dart';
import 'components/brick.dart';

class BreakoutGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  late Paddle paddle;
  late Ball ball;
  late World world;
  
  int score = 0;
  int lives = GameConstants.maxLives;

  @override
  Color backgroundColor() => Colors.black;

  @override
  Future<void> onLoad() async {
    // The new Flame Camera system (v1.8.0+) uses a World component
    world = World();
    
    // Set up the camera with a fixed resolution
    camera = CameraComponent.withFixedResolution(
      width: GameConstants.gameWidth,
      height: GameConstants.gameHeight,
      world: world,
    );
    
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(RectangleComponent(
      size: Vector2(GameConstants.gameWidth, GameConstants.gameHeight),
      paint: Paint()..color = GameConstants.bgColor,
    ));

    paddle = Paddle()
      ..position = Vector2(
        (GameConstants.gameWidth - GameConstants.paddleWidth) / 2,
        GameConstants.gameHeight - 40,
      );
    
    ball = Ball()
      ..position = Vector2(GameConstants.gameWidth / 2, GameConstants.gameHeight / 2);

    world.add(paddle);
    world.add(ball);
    
    buildWall();

    addAll([world, camera]);
    
    add(FpsTextComponent(position: Vector2(10, 10)));
  }

  void buildWall() {
    double xpos = 0;
    double ypos = 60;
    double adj = 0;

    for (int i = 0; i < 52; i++) {
      if (xpos + GameConstants.brickWidth > GameConstants.gameWidth) {
        if (adj == 0) {
          adj = GameConstants.brickWidth / 2;
        } else {
          adj = 0;
        }
        xpos = -adj;
        ypos += GameConstants.brickHeight + 2; // Small gap
      }

      final brick = Brick(position: Vector2(xpos, ypos));
      world.add(brick);
      xpos += GameConstants.brickWidth + 2; // Small gap
    }
  }

  void checkWinCondition() {
    if (world.children.whereType<Brick>().isEmpty) {
      buildWall();
      ball.reset();
    }
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
