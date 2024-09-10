part of brick_bootstrap5_plus_style;

//阴影偏移量
class _ShadowOffset {
  final Offset? defaultOffset;
  final Offset? xs;
  final Offset? sm;
  final Offset? md;
  final Offset? lg;
  final Offset? xl;
  final Offset? xxl;

  _ShadowOffset({
    this.defaultOffset,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _ShadowOffset _copyWith({
    Offset? defaultOffset,
    Offset? xs,
    Offset? sm,
    Offset? md,
    Offset? lg,
    Offset? xl,
    Offset? xxl,
  }) {
    return _ShadowOffset(
      defaultOffset: defaultOffset ?? this.defaultOffset,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _ShadowOffset _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// shadow-offset-10,20
      case 3:
        return _copyWithClass3(definitions);

      /// shadow-offset-xs-10,20
      case 4:
        return _copyWithClass4(definitions);
      default:
        return this;
    }
  }

  /// shadow-offset-xs-10,20
  _ShadowOffset _copyWithClass4(List<String> definitions) {
    final dx = double.parse(definitions.last.split(",")[0]);
    final dy = double.parse(definitions.last.split(",")[1]);
    final breakPoint = definitions[2];
    return _fromDefinitions(offset: Offset(dx, dy), breakPoint: breakPoint);
  }

  /// shadow-offset-10,20
  _ShadowOffset _copyWithClass3(List<String> definitions) {
    final dx = double.parse(definitions.last.split(",")[0]);
    final dy = double.parse(definitions.last.split(",")[1]);
    return _fromDefinitions(offset: Offset(dx, dy));
  }

  _ShadowOffset _fromDefinitions({
    Offset? offset,
    String? breakPoint,
  }) {
    if (offset == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: offset);
      case 'sm':
        return _copyWith(sm: offset);
      case 'md':
        return _copyWith(md: offset);
      case 'lg':
        return _copyWith(lg: offset);
      case 'xl':
        return _copyWith(xl: offset);
      case 'xxl':
        return _copyWith(xxl: offset);
      default:
        return _copyWith(defaultOffset: offset);
    }
  }
}

//阴影模糊半径
class _ShadowBlurRadius {
  final double? defaultBlurRadius;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;

  _ShadowBlurRadius({
    this.defaultBlurRadius,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _ShadowBlurRadius _copyWith({
    double? defaultBlurRadius,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return _ShadowBlurRadius(
      defaultBlurRadius: defaultBlurRadius ?? this.defaultBlurRadius,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _ShadowBlurRadius _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// shadow-blurRadius-1
      case 3:
        return _copyWithClass3(definitions);

      /// shadow-blurRadius-xl-1
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  /// shadow-blurRadius-1
  _ShadowBlurRadius _copyWithClass3(List<String> definitions) {
    final shadowBlurRadius = double.parse(definitions.last);
    return _fromDefinitions(shadowBlurRadius: shadowBlurRadius);
  }

  /// shadow-blurRadius-xl-1
  _ShadowBlurRadius _copyWithClass4(List<String> definitions) {
    final shadowBlurRadius = double.parse(definitions.last);
    final breakPoint = definitions[2];
    return _fromDefinitions(
        shadowBlurRadius: shadowBlurRadius, breakPoint: breakPoint);
  }

  _ShadowBlurRadius _fromDefinitions({
    double? shadowBlurRadius,
    String? breakPoint,
  }) {
    if (shadowBlurRadius == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: shadowBlurRadius);
      case 'sm':
        return _copyWith(sm: shadowBlurRadius);
      case 'md':
        return _copyWith(md: shadowBlurRadius);
      case 'lg':
        return _copyWith(lg: shadowBlurRadius);
      case 'xl':
        return _copyWith(xl: shadowBlurRadius);
      case 'xxl':
        return _copyWith(xxl: shadowBlurRadius);
      default:
        return _copyWith(defaultBlurRadius: shadowBlurRadius);
    }
  }
}

//阴影颜色
class _ShadowColor {
  final Color? defaultShadowColor;
  final Color? xs;
  final Color? sm;
  final Color? md;
  final Color? lg;
  final Color? xl;
  final Color? xxl;

  _ShadowColor({
    this.defaultShadowColor,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _ShadowColor _copyWith({
    Color? defaultShadowColor,
    Color? xs,
    Color? sm,
    Color? md,
    Color? lg,
    Color? xl,
    Color? xxl,
  }) {
    return _ShadowColor(
      defaultShadowColor: defaultShadowColor ?? this.defaultShadowColor,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _ShadowColor _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// shadow-color-red
      case 2:
        return _copyWithClass3(definitions);

      /// shadow-color-xl-red
      case 3:
        return _copyWithClass4(definitions);

      /// shadow-color-r-g-b
      case 4:
        return _copyWithClass5(definitions);

      /// shadow-color-xl-r-g-b   shadow-color-r-g-b-a
      case 5:
        return _copyWithClass6(definitions);

      /// shadow-color-xl-r-g-b-a
      case 6:
        return _copyWithClass7(definitions);
    }

    return this;
  }

  /// shadow-color-red
  _ShadowColor _copyWithClass3(List<String> definitions) {
    final shadowColor = definitions.last;
    return _fromDefinitions(shadowColor: shadowColor);
  }

  /// shadow-color-xl-red
  _ShadowColor _copyWithClass4(List<String> definitions) {
    final shadowColor = definitions.last;
    final breakPoint = definitions[1];
    return _fromDefinitions(shadowColor: shadowColor, breakPoint: breakPoint);
  }

  /// shadow-color-r-g-b
  _ShadowColor _copyWithClass5(List<String> definitions) {
    final shadowColor = definitions.last;
    final r = int.parse(definitions[1]);
    final g = int.parse(definitions[2]);
    final b = int.parse(definitions[3]);
    return _fromDefinitions(shadowColor: shadowColor, r: r, g: g, b: b);
  }

  /// shadow-color-xl-r-g-b   shadow-color-r-g-b-a
  _ShadowColor _copyWithClass6(List<String> definitions) {
    final shadowColor = definitions.last;
    final breakPoint = definitions[1];
    var hasBreakPoint = breakPoints.contains(breakPoint);
    if (hasBreakPoint) {
      final r = int.parse(definitions[2]);
      final g = int.parse(definitions[3]);
      final b = int.parse(definitions[4]);
      return _fromDefinitions(
          shadowColor: shadowColor, breakPoint: breakPoint, r: r, g: g, b: b);
    }
    final r = int.parse(definitions[1]);
    final g = int.parse(definitions[2]);
    final b = int.parse(definitions[3]);
    final a = double.parse(definitions[4]);
    return _fromDefinitions(
        shadowColor: shadowColor,
        breakPoint: breakPoint,
        r: r,
        g: g,
        b: b,
        a: a);
  }

  /// shadow-color-xl-r-g-b-a
  _ShadowColor _copyWithClass7(List<String> definitions) {
    final shadowColor = definitions.last;
    final breakPoint = definitions[1];
    final r = int.parse(definitions[2]);
    final g = int.parse(definitions[3]);
    final b = int.parse(definitions[4]);
    final a = double.parse(definitions[5]);
    return _fromDefinitions(
        shadowColor: shadowColor,
        breakPoint: breakPoint,
        r: r,
        g: g,
        b: b,
        a: a);
  }

  _ShadowColor _fromDefinitions({
    required String shadowColor,
    String? breakPoint,
    int? r,
    int? g,
    int? b,
    double? a,
  }) {
    Color? color;

    switch (shadowColor) {
      case 'transparent':
        color = Colors.transparent;
        break;
      case 'black':
        color = Colors.black;
        break;
      case 'black87':
        color = Colors.black87;
        break;
      case 'black54':
        color = Colors.black54;
        break;
      case 'black45':
        color = Colors.black45;
        break;
      case 'black38':
        color = Colors.black38;
        break;
      case 'black26':
        color = Colors.black26;
        break;
      case 'black12':
        color = Colors.black12;
        break;
      case 'white':
        color = Colors.white;
        break;
      case 'white70':
        color = Colors.white70;
        break;
      case 'white60':
        color = Colors.white60;
        break;
      case 'white54':
        color = Colors.white54;
        break;
      case 'white38':
        color = Colors.white38;
        break;
      case 'white30':
        color = Colors.white30;
        break;
      case 'white24':
        color = Colors.white24;
        break;
      case 'white12':
        color = Colors.white12;
        break;
      case 'white10':
        color = Colors.white10;
        break;
      case 'red':
        color = Colors.red;
        break;
      case 'redAccent':
        color = Colors.redAccent;
        break;
      case 'pink':
        color = Colors.pink;
        break;
      case 'pinkAccent':
        color = Colors.pinkAccent;
        break;
      case 'purple':
        color = Colors.purple;
        break;
      case 'purpleAccent':
        color = Colors.purpleAccent;
        break;
      case 'deepPurple':
        color = Colors.deepPurple;
        break;
      case 'deepPurpleAccent':
        color = Colors.deepPurpleAccent;
        break;
      case 'indigo':
        color = Colors.indigo;
        break;
      case 'indigoAccent':
        color = Colors.indigoAccent;
        break;
      case 'blue':
        color = Colors.blue;
        break;
      case 'blueAccent':
        color = Colors.blueAccent;
        break;
      case 'lightBlue':
        color = Colors.lightBlue;
        break;
      case 'lightBlueAccent':
        color = Colors.lightBlueAccent;
        break;
      case 'cyan':
        color = Colors.cyan;
        break;
      case 'cyanAccent':
        color = Colors.cyanAccent;
        break;
      case 'teal':
        color = Colors.teal;
        break;
      case 'tealAccent':
        color = Colors.tealAccent;
        break;
      case 'green':
        color = Colors.green;
        break;
      case 'greenAccent':
        color = Colors.greenAccent;
        break;
      case 'lightGreen':
        color = Colors.lightGreen;
        break;
      case 'lime':
        color = Colors.lime;
        break;
      case 'limeAccent':
        color = Colors.limeAccent;
        break;
      case 'yellow':
        color = Colors.yellow;
        break;
      case 'yellowAccent':
        color = Colors.yellowAccent;
        break;
      case 'amber':
        color = Colors.amber;
        break;
      case 'amberAccent':
        color = Colors.amberAccent;
        break;
      case 'orange':
        color = Colors.orange;
        break;
      case 'orangeAccent':
        color = Colors.orangeAccent;
        break;
      case 'deepOrange':
        color = Colors.deepOrange;
        break;
      case 'deepOrangeAccent':
        color = Colors.deepOrangeAccent;
        break;
      case 'brown':
        color = Colors.brown;
        break;
      case 'grey':
        color = Colors.grey;
        break;
      case 'blueGrey':
        color = Colors.blueGrey;
        break;
      default:
        if (r != null && g != null && b != null) {
          color = Color.fromRGBO(r, g, b, a ?? 1);
        } else {
          /// #fff #ffffff
          if (shadowColor.length == 3 || shadowColor.length == 6) {
            color = TinyColor.fromString('0xFF$shadowColor').toColor();
          }
        }
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: color);
      case 'sm':
        return _copyWith(sm: color);
      case 'md':
        return _copyWith(md: color);
      case 'lg':
        return _copyWith(lg: color);
      case 'xl':
        return _copyWith(xl: color);
      case 'xxl':
        return _copyWith(xxl: color);
      default:
        return _copyWith(defaultShadowColor: color);
    }
  }
}
