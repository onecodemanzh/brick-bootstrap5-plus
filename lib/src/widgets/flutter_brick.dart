import 'package:brick_bootstrap5_plus/brick_bootstrap5_plus.dart';
import 'package:flutter/material.dart';

import '../typography.dart' as t;

class FlutterBrick extends StatelessWidget {
  const FlutterBrick({
    Key? key,
    this.breakPoints = const BreakPoints(),
    this.typography = const t.Typography(),
    this.containerBreakPoints = const ContainerBreakPoints(),
    this.colors = const BColors(),
    this.fontSize = ScreenData.defaultFontSize,
    required this.builder,
  }) : super(key: key);

  final BreakPoints breakPoints;
  final t.Typography typography;
  final ContainerBreakPoints containerBreakPoints;
  final BColors colors;
  final double fontSize;
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final pixelRatio = View.of(context).devicePixelRatio;
      final physicalScreenSize = View.of(context).physicalSize;
      final logicalScreenSize = physicalScreenSize / pixelRatio;
      final breakPoint =
          breakPoints.getBreakPointForWidth(logicalScreenSize.width);
      return BootstrapTheme(
        data: ScreenData(
          breakPoints: breakPoints,
          containerBreakPoints: containerBreakPoints,
          currentBreakPoint: breakPoint,
          screenSize: logicalScreenSize,
          fontSize: fontSize,
          typography: typography,
          colors: colors,
        ),
        builder: (ctx) => builder(ctx),
      );
    });
  }
}
