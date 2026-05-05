# Setup Guide - Neo Break

This document describes the setup process for the **Neo Break** project, a mobile Breakout game built with Flutter and the Flame game engine.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- **Flutter SDK**: [Install Flutter](https://docs.flutter.dev/get-started/install) (Stable channel recommended).
- **Dart SDK**: Included with the Flutter SDK.
- **Android Studio / Xcode**: For Android or iOS development respectively.
- **Visual Studio / Build Tools**: If you plan to run the project as a Windows desktop application.
- **Git**: For version control.

## Project Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/kis4-2026ss/projekt-g2-koeck-ahrer.git
   cd projekt-g2-koeck-ahrer
   ```

2. **Install Dependencies**:
   Run the following command in the project root to fetch all required packages:
   ```bash
   flutter pub get
   ```

3. **Verify Flutter Installation**:
   Ensure your environment is correctly configured by running:
   ```bash
   flutter doctor
   ```

## Adding Planned Dependencies

According to the project proposal, the following dependencies should be added for game development and sensor support:

```bash
flutter pub add flame
flutter pub add sensors_plus
```

*Note: Check `pubspec.yaml` to see if they are already present.*

## Running the Application

### Mobile (Physical Device or Emulator)

1. Connect your device or start an emulator.
2. Check available devices:
   ```bash
   flutter devices
   ```
3. Run the app:
   ```bash
   flutter run
   ```

### Desktop (Windows/Linux/macOS)

If you have desktop support enabled, you can run the project directly:
```bash
flutter run -d windows
# or
flutter run -d linux
# or
flutter run -d macos
```

## Troubleshooting

- **CocoaPods issues (iOS/macOS)**: Run `cd ios && pod install && cd ..` if you encounter pod-related errors.
- **Dependency conflicts**: Try running `flutter pub upgrade` or `flutter clean` followed by `flutter pub get`.
- **Sensors not working**: Tilt controls (accelerometer/gyroscope) typically require a physical device; emulators may have limited support.
