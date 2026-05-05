import 'package:flutter/material.dart';

class GameConstants {
  static const double gameWidth = 640.0;
  static const double gameHeight = 480.0;

  static const double paddleWidth = 100.0; // Estimated from bat.png size
  static const double paddleHeight = 20.0;
  static const double paddleSpeed = 600.0; // Units per second (original was 30 per frame at 60fps)

  static const double ballRadius = 8.0;
  static const double ballSpeedX = 360.0; // 6 units/frame * 60fps
  static const double ballSpeedY = 360.0;

  static const Color bgColor = Color(0xFF2F4F4F);
  static const Color paddleColor = Colors.blue;
  static const Color ballColor = Colors.white;
  static const Color brickColor = Colors.red;

  static const int maxLives = 5;
}
