import 'package:brick_bootstrap5_plus/src/style/style.dart';
import 'package:flutter/material.dart';

import 'layout/layout.dart';

class BootstrapTypography {
  static const TextSetting h1 = TextSetting(
    fontSizeMultiplier: 2.5,
    fontSizeMultiplierSmall: 1.375,
    viewPortMultiplier: 1.5,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const TextSetting h2 = TextSetting(
    fontSizeMultiplier: 2.0,
    fontSizeMultiplierSmall: 1.325,
    viewPortMultiplier: 0.9,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const TextSetting h3 = TextSetting(
    fontSizeMultiplier: 1.75,
    fontSizeMultiplierSmall: 1.3,
    viewPortMultiplier: 0.6,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const TextSetting h4 = TextSetting(
    fontSizeMultiplier: 1.5,
    fontSizeMultiplierSmall: 1.275,
    viewPortMultiplier: 0.3,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const TextSetting h5 = TextSetting(
    fontSizeMultiplier: 1.25,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const TextSetting h6 = TextSetting(
    fontSizeMultiplier: 1.0,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );

  static const TextSetting display1 = TextSetting(
    fontSizeMultiplier: 5.0,
    fontSizeMultiplierSmall: 1.625,
    viewPortMultiplier: 4.5,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const TextSetting display2 = TextSetting(
    fontSizeMultiplier: 4.5,
    fontSizeMultiplierSmall: 1.575,
    viewPortMultiplier: 3.9,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const TextSetting display3 = TextSetting(
    fontSizeMultiplier: 4.0,
    fontSizeMultiplierSmall: 1.525,
    viewPortMultiplier: 3.3,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const TextSetting display4 = TextSetting(
    fontSizeMultiplier: 3.5,
    fontSizeMultiplierSmall: 1.475,
    viewPortMultiplier: 2.7,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const TextSetting display5 = TextSetting(
    fontSizeMultiplier: 3.0,
    fontSizeMultiplierSmall: 1.425,
    viewPortMultiplier: 2.1,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const TextSetting display6 = TextSetting(
    fontSizeMultiplier: 2.5,
    fontSizeMultiplierSmall: 1.375,
    viewPortMultiplier: 1.5,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const TextSetting lead = TextSetting(
    fontSizeMultiplier: 1.25,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.0,
    ),
  );
  static const TextSetting paragraph = TextSetting(
    fontSizeMultiplier: 1.0,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.0,
    ),
  );
  static const TextSetting small = TextSetting(
    fontSizeMultiplier: 0.875,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.0,
    ),
  );
}

class TextSetting {
  final double fontSizeMultiplier;
  final double? fontSizeMultiplierSmall;
  final double? viewPortMultiplier;
  final TextStyle style;

  const TextSetting({
    required this.fontSizeMultiplier,
    this.fontSizeMultiplierSmall,
    this.viewPortMultiplier,
    this.style = const TextStyle(),
  });

  /// based on 16px default font size
  factory TextSetting.fromFontSize(double fontSize,
      {TextStyle style = const TextStyle(),
      double defaultFontSize = ScreenData.defaultFontSize}) {
    final fontSizeMultiplier = fontSize / defaultFontSize;
    double? fontSizeMultiplierSmall;
    double? viewPortMultiplier;

    if (fontSizeMultiplier > 1.5) {
      fontSizeMultiplierSmall = 1.275 + (fontSizeMultiplier - 1.5) / 10;
      viewPortMultiplier = 0.3 + ((fontSizeMultiplier - 1.5) / 0.25) * 0.3;
    }

    return TextSetting(
      fontSizeMultiplier: fontSizeMultiplier,
      fontSizeMultiplierSmall: fontSizeMultiplierSmall,
      viewPortMultiplier: viewPortMultiplier,
      style: style,
    );
  }

  TextSetting convertToFontSize(double fontSize) =>
      TextSetting.fromFontSize(fontSize, style: style);

  TextSetting copyWidth({
    double? fontSizeMultiplier,
    double? fontSizeMultiplierSmall,
    double? viewPortMultiplier,
    TextStyle? style,
  }) =>
      TextSetting(
        fontSizeMultiplier: fontSizeMultiplier ?? this.fontSizeMultiplier,
        fontSizeMultiplierSmall:
            fontSizeMultiplierSmall ?? this.fontSizeMultiplierSmall,
        viewPortMultiplier: viewPortMultiplier ?? this.viewPortMultiplier,
        style: style ?? this.style,
      );
}

class TextStyles {
  final Typography typography;
  final double fontSize;
  final Size screenSize;
  final BreakPoint breakPoint;
  final BreakPoints breakPoints;

  const TextStyles({
    required this.fontSize,
    required this.screenSize,
    required this.breakPoint,
    required this.breakPoints,
    required this.typography,
  });

  TextStyle get h1 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h1);

  TextStyle get h2 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h2);

  TextStyle get h3 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h3);

  TextStyle get h4 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h4);

  TextStyle get h5 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h5);

  TextStyle get h6 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h6);

  TextStyle get display1 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display1);

  TextStyle get display2 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display2);

  TextStyle get display3 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display3);

  TextStyle get display4 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display4);

  TextStyle get display5 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display5);

  TextStyle get display6 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display6);

  TextStyle get lead => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.lead);

  TextStyle get paragraph => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.paragraph);

  TextStyle get small => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.small);
}

class Typography {
  final TextSetting h1;
  final TextSetting h2;
  final TextSetting h3;
  final TextSetting h4;
  final TextSetting h5;
  final TextSetting h6;

  final TextSetting display1;
  final TextSetting display2;
  final TextSetting display3;
  final TextSetting display4;
  final TextSetting display5;
  final TextSetting display6;

  final TextSetting lead;
  final TextSetting paragraph;
  final TextSetting small;

  const Typography({
    this.h1 = BootstrapTypography.h1,
    this.h2 = BootstrapTypography.h2,
    this.h3 = BootstrapTypography.h3,
    this.h4 = BootstrapTypography.h4,
    this.h5 = BootstrapTypography.h5,
    this.h6 = BootstrapTypography.h6,
    this.display1 = BootstrapTypography.display1,
    this.display2 = BootstrapTypography.display2,
    this.display3 = BootstrapTypography.display3,
    this.display4 = BootstrapTypography.display4,
    this.display5 = BootstrapTypography.display5,
    this.display6 = BootstrapTypography.display6,
    this.lead = BootstrapTypography.lead,
    this.paragraph = BootstrapTypography.paragraph,
    this.small = BootstrapTypography.small,
  });

  TextStyle _getStyle(double fontSize, Size screenSize, BreakPoint breakPoint,
      BreakPoints breakPoints, TextSetting setting) {
    final style = setting.style;

    if (setting.fontSizeMultiplierSmall != null &&
        setting.viewPortMultiplier != null &&
        breakPoint.isBreakPointOrSmaller(breakPoints.lg)) {
      final size = (setting.fontSizeMultiplierSmall! * fontSize) +
          (screenSize.width / 100 * setting.viewPortMultiplier!);
      return style.copyWith(fontSize: size);
    }

    final size = setting.fontSizeMultiplier * fontSize;
    return style.copyWith(fontSize: size);
  }
}
