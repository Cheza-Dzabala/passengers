import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CircularFab extends StatefulWidget {
  const CircularFab({Key? key}) : super(key: key);

  @override
  State<CircularFab> createState() => _CircularFabState();
}

double size = 60;

Color swtchKey({required Key? key}) {
  Color color = key == Key('car')
      ? Color(0XFF7B61FF)
      : key == Key('walk')
          ? Color(0XFF4285F4)
          : key == Key('exit')
              ? Colors.red.shade700
              : key == Key('info')
                  ? Colors.blue.shade700
                  : Colors.green.shade700;
  return color;
}

class _CircularFabState extends State<CircularFab>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(
        delegate: FlowMenuDelegate(controller: controller),
        children: [
          Icon(Ionicons.exit_outline, size: 40, key: Key('exit')),
          Icon(Ionicons.information_outline, size: 40, key: Key('info')),
          Icon(Ionicons.car_outline, size: 40, key: Key('car')),
          Icon(Ionicons.walk_outline, size: 40, key: Key('walk')),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            size: 40,
          ),
        ].map<Widget>(buildFab).toList(),
      );

  Widget buildFab(Widget icon) => SizedBox(
        width: size,
        height: size,
        child: FloatingActionButton(
          elevation: 1,
          backgroundColor: swtchKey(key: icon.key),
          child: icon,
          onPressed: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  FlowMenuDelegate({required this.controller}) : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final screenSize = context.size;
    final xStart = screenSize.width - size;
    final yStart = screenSize.height - size;

    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;
      final radius = 180 * controller.value;
      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart - setValue(radius * cos(theta));
      final y = yStart - setValue(radius * sin(theta));
      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(x, y, 0)
          ..translate(size / 2, size / 2, 0)
          ..rotateZ(isLastItem ? 0.0 : 180 * (1 - controller.value) * pi / 180)
          ..scale(max(isLastItem ? 1.0 : controller.value, 0.5))
          ..translate(-size / 2, -size / 2, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}
