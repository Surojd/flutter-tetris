import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gamer.dart';

///keyboard controller to play game
class KeyboardController extends StatefulWidget {
  final Widget child;
  const KeyboardController({super.key, required this.child});

  @override
  State<KeyboardController> createState() => _KeyboardControllerState();
}

class _KeyboardControllerState extends State<KeyboardController> {
  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_onHandler);
  }

  bool _onHandler(KeyEvent event) {
    final game = Game.of(context);
    if (event is KeyUpEvent) {
      return false;
    }

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        game.rotate();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        game.down();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        game.left();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        game.right();
      } else if (event.logicalKey == LogicalKeyboardKey.space) {
        game.drop();
      } else if (event.logicalKey == LogicalKeyboardKey.keyP) {
        game.pauseOrResume();
      } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
        game.soundSwitch();
      } else if (event.logicalKey == LogicalKeyboardKey.keyR) {
        game.reset();
      }
    }
    return true;
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onHandler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
