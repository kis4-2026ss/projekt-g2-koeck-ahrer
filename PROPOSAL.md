# Project Proposal

## AI-assisted migration of Breakout to a mobile game

## Team

- Team member 1: Rebekka Ahrer
- Team member 2: Nina Köck

## Project Repository

- Project repository: https://github.com/kis4-2026ss/projekt-g2-koeck-ahrer.git
- Reference implementation: github.com/johncheetham/breakout

---

## 1. Goal of the Project

### High-Level Goal

The goal of this project is to explore how AI assistance can support the reimplementation and modernization of an existing retro game. We will use an existing Python implementation of Breakout as a reference and rebuild the game as a modern mobile application using Flutter and the Flame game engine.

The final result will be a playable mobile version of Breakout. As a mobile-specific extension, the paddle will be controlled by tilting the smartphone using gyroscope or accelerometer input.

### Validation of the Goal

We will validate the project using the following criteria:

- The game can be started and played on an Android emulator or physical Android device.
- The core Breakout mechanics are implemented: paddle movement, ball movement, wall collisions, brick collisions, scoring, lives, game-over state, and restart behavior.
- The paddle can be controlled using smartphone tilt input.
- The implementation contains at least a small testable logic layer with tests for important gameplay behavior, for example scoring or collision handling.

---

## 2. System, Feature, or Workflow to be Developed

We will develop a mobile game application based on Flutter and Flame. The application will reimplement the core mechanics of Breakout and adapt the input system to mobile devices.

### Main System Components

- **Game Screen**: Flutter screen that hosts the Flame game instance.
- **Game Loop**: Updates all game objects such as ball, paddle, and bricks.
- **Rendering Components**: Flame components for drawing the ball, paddle, bricks, score, lives, and game states.
- **Game Logic**: Handles movement, collisions, scoring, lives, game-over, and restart logic.
- **Sensor Input Layer**: Reads gyroscope or accelerometer data and maps the phone tilt to paddle movement.
- **Fallback Input Layer**: Optional keyboard or touch input for emulator testing.
- **Testable Logic Layer**: Contains selected logic that can be tested independently from the rendering framework.
- **Documentation Layer**: Contains the source analysis, AI Decision Log, architecture notes, and setup instructions.

### Development Workflow to be Analyzed

The project will analyze the following AI-assisted workflow:

1. **Code understanding**: AI helps explain the structure and behavior of the original Python game.
2. **Architecture planning**: AI proposes how the original game concepts can be mapped to Flutter and Flame.
3. **Implementation support**: AI supports the translation of game mechanics into Dart and Flame components.
4. **Review and correction**: AI-generated suggestions are reviewed by the team before being used.
5. **Testing support**: AI suggests edge cases and helps generate unit tests for selected game logic.
6. **Documentation support**: AI helps summarize decisions, generate diagrams, and structure technical documentation.

---

### 3. AI Tools and Models

We plan to use the following free tools:

- **Gemini CLI**: Main AI assistant for code analysis, migration planning, architecture suggestions, test generation, and review prompts.
- **Junie Pro**: Code completion and implementation support in the IDE.

### AI Contribution by Development Stage

#### Stage 1: Understanding the Existing Code

Gemini CLI will be used to analyze the reference Python implementation. It should explain the game loop, state variables, scoring logic, collision handling, and input handling.

#### Stage 2: Planning the Target Architecture

Gemini CLI will propose a Flutter/Flame architecture. The team will manually review the proposal .

#### Stage 3: Reimplementation

Gemini CLI and Junie will support the implementation of the Dart/Flutter code. AI may suggest component structures, class names, collision logic, and helper functions. The final code will be reviewed and adapted manually.

#### Stage 4: Mobile Sensor Input

Gemini CLI will help identify a practical approach for using gyroscope or accelerometer data to control the paddle. The team will test and tune the final behavior manually.

#### Stage 5: Testing and Review

Gemini CLI will suggest unit tests and edge cases for collision and scoring logic. AI will also be used as a lightweight reviewer by asking it to inspect selected code for bugs, edge cases, and Flame best practices.

#### Stage 6: Documentation and Reflection

AI will support the creation of summaries and architecture explanations.

---

## 4. Project Plan

The project is planned for approximately 10 hours of total effort. Internal deadlines can be adapted depending on the final submission date.

### Task 1: Repository Setup and Reference Code Analysis

**Responsible:** Both team members |
**Internal deadline:** 05.05.2026 |
**Estimated effort:** 1 hour

Activities:

- Create the project GitHub repository.
- Add PROPOSAL.md
- Inspect the existing Python Breakout implementation.
- Use Gemini CLI to summarize the original game structure.

Deliverables:

- GitHub repository created.
- Short source analysis in `docs/source_analysis.md`.

### Task 2: Flutter and Flame Project Setup

**Responsible:** Both team members |
**Internal deadline:** 05.05.2026 |
**Estimated effort:** 1 hour

Activities:

- Create the Flutter project.
- Add Flame and sensor-related dependencies.
- Set up a basic game screen.
- Create the initial Flame game class.

Deliverables:

- Running Flutter/Flame application skeleton.

### Task 3: Core Breakout Mechanics

**Responsible:** Team member 1 |
**Internal deadline:** [Date] |
**Estimated effort:** 3 hours

Activities:

- Implement ball movement.
- Implement paddle movement.
- Implement wall and paddle collisions.
- Implement brick layout and brick collisions.
- Implement score, lives, game-over, and restart behavior.
- Use Gemini CLI and Junie for implementation support.

Deliverables:

- Playable Breakout prototype without sensor input.

### Task 4: Mobile Tilt Control

**Responsible:** Team member 2 | 
**Internal deadline:** [Date] |
**Estimated effort:** 1.5 hours

Activities:

- Read gyroscope or accelerometer values.
- Map tilt values to paddle movement.
- Ensure the paddle stays within the screen boundaries.
- Add fallback input if sensor testing is difficult in the emulator.

Deliverables:

- Paddle can be controlled using smartphone tilt input.

### Task 5: AI-Assisted Testing and Review

**Responsible:** Team member 2 |
**Internal deadline:** [Date] | 
**Estimated effort:** 1.5 hour

Activities:

- Ask Gemini CLI for relevant edge cases.
- Extract selected game logic into testable functions or classes.
- Implement tests for scoring and selected collision behavior.
- Use Gemini CLI to review selected code sections.

Deliverables:

- Small test suite for core game logic.
- Review notes in the AI Decision Log.

### Task 6: Final Documentation and Presentation Preparation

**Responsible:** Both team members |
**Internal deadline:** [Date] |
**Estimated effort:** 1 hour

Activities:

- Finalize README and setup instructions.
- Complete the AI Decision Log.
- Add architecture diagram.
- Prepare a short demo scenario for the presentation.

Deliverables:

- Final documentation.
- Demo-ready project.
- Presentation outline.
