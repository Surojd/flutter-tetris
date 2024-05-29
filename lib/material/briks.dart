import 'package:flutter/material.dart';

const colorNormal = Colors.black87;
const colorNull = Colors.black12;
const colorHighlight = Color(0xFF560000);

class BrikSize extends InheritedWidget {
  const BrikSize({
    super.key,
    required this.size,
    required super.child,
  });

  final Size size;

  static BrikSize of(BuildContext context) {
    final brikSize = context.dependOnInheritedWidgetOfExactType<BrikSize>();
    assert(brikSize != null, "....");
    return brikSize!;
  }

  @override
  bool updateShouldNotify(BrikSize oldWidget) {
    return oldWidget.size != size;
  }
}

///the basic brik for game panel
class Brik extends StatelessWidget {
  final Color color;

  const Brik._({required this.color});

  static Brik normal() {
    return const Brik._(color: colorNormal);
  }

  static Brik empty() {
    return const Brik._(color: colorNull);
  }

  static Brik highlight() {
    return const Brik._(color: colorHighlight);
  }

  @override
  Widget build(BuildContext context) {
    final width = BrikSize.of(context).size.width;
    return SizedBox.fromSize(
      size: BrikSize.of(context).size,
      child: Container(
        margin: EdgeInsets.all(0.05 * width),
        padding: EdgeInsets.all(0.1 * width),
        decoration: BoxDecoration(
            border: Border.all(width: 0.10 * width, color: color)),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
