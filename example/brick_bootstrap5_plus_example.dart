import 'dart:developer';

import 'package:brick_bootstrap5_plus/brick_bootstrap5_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: build(),
    ),
  );
}

Widget build() {
  String className = 'color-blue font-size-14';

  /// Generate a style based on className
  Style? styles = convertClassNamesToStyle(className);
  inspect(styles);

  /// https://api.flutter.dev/flutter/widgets/MediaQuery-class.html
  return MediaQueryBuilder(builder: (context, constraints, screenData) {
    /// Gets the current screen style
    StyleAbbrSet s = getStyle(screenData, constraints, styles);
    inspect(s);

    return Container(
      child: Column(
        children: [
          Text(
            'byClassName',
            style: TextStyle(
              color: s.color,
              fontSize: s.fs,
            ),
          ),
          // equate
          Text(
            'default',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  });
}
