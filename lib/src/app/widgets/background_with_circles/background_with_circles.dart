library src.app.widgets.circle_part;

import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../tools/tools.dart';

part 'circles_painter.dart';

class BackgroundWithCircles extends StatelessWidget {
  final Widget child;

  const BackgroundWithCircles({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        foregroundPainter: const CirclesPainter(),
        child: Container(
          child: child,
        ),
      );
}
