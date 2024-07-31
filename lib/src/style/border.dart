part of brick_bootstrap5_plus_style;
class _Border {
  final double? defaultBorder;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;

  _Border({
    this.defaultBorder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Border _copyWith({
    double? defaultBorder,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return _Border(
      defaultBorder: defaultBorder ?? this.defaultBorder,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Border _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// border
      case 1:
        return _copyWithClass1(definitions);

      /// border-1
      case 2:
        return _copyWithClass2(definitions);

      /// border-xl-1
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  /// border
  _Border _copyWithClass1(List<String> definitions) {
    final double border = 1;
    return _fromDefinitions(border: border);
  }

  /// border-1
  _Border _copyWithClass2(List<String> definitions) {
    final border = double.parse(definitions.last);
    return _fromDefinitions(border: border);
  }

  /// border-xl-1
  _Border _copyWithClass3(List<String> definitions) {
    final border = double.parse(definitions.last);
    final breakPoint = definitions[1];
    return _fromDefinitions(border: border, breakPoint: breakPoint);
  }

  _Border _fromDefinitions({
    double? border,
    String? breakPoint,
  }) {
    if (border == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: border);
      case 'sm':
        return _copyWith(sm: border);
      case 'md':
        return _copyWith(md: border);
      case 'lg':
        return _copyWith(lg: border);
      case 'xl':
        return _copyWith(xl: border);
      case 'xxl':
        return _copyWith(xxl: border);
      default:
        return _copyWith(defaultBorder: border);
    }
  }
}

class _BorderRadius {
  final double? defaultBorderRadius;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;

  _BorderRadius({
    this.defaultBorderRadius,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _BorderRadius _copyWith({
    double? defaultBorderRadius,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return _BorderRadius(
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _BorderRadius _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// border-radius-1
      case 3:
        return _copyWithClass3(definitions);

      /// border-radius--xl-1
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  /// border-radius-1
  _BorderRadius _copyWithClass3(List<String> definitions) {
    final borderRadius = double.parse(definitions.last);
    return _fromDefinitions(borderRadius: borderRadius);
  }

  /// border-radius-xl-1
  _BorderRadius _copyWithClass4(List<String> definitions) {
    final borderRadius = double.parse(definitions.last);
    final breakPoint = definitions[2];
    return _fromDefinitions(borderRadius: borderRadius, breakPoint: breakPoint);
  }

  _BorderRadius _fromDefinitions({
    double? borderRadius,
    String? breakPoint,
  }) {
    if (borderRadius == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: borderRadius);
      case 'sm':
        return _copyWith(sm: borderRadius);
      case 'md':
        return _copyWith(md: borderRadius);
      case 'lg':
        return _copyWith(lg: borderRadius);
      case 'xl':
        return _copyWith(xl: borderRadius);
      case 'xxl':
        return _copyWith(xxl: borderRadius);
      default:
        return _copyWith(defaultBorderRadius: borderRadius);
    }
  }
}

class _BorderColor {
  final Color? defaultBorderColor;
  final Color? xs;
  final Color? sm;
  final Color? md;
  final Color? lg;
  final Color? xl;
  final Color? xxl;

  _BorderColor({
    this.defaultBorderColor,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _BorderColor _copyWith({
    Color? defaultBorderColor,
    Color? xs,
    Color? sm,
    Color? md,
    Color? lg,
    Color? xl,
    Color? xxl,
  }) {
    return _BorderColor(
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _BorderColor _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// border-color-red
      case 2:
        return _copyWithClass3(definitions);

      /// border-color-xl-red
      case 3:
        return _copyWithClass4(definitions);

      /// border-color-r-g-b
      case 4:
        return _copyWithClass5(definitions);

      /// border-color-xl-r-g-b   border-color-r-g-b-a
      case 5:
        return _copyWithClass6(definitions);

      /// border-color-xl-r-g-b-a
      case 6:
        return _copyWithClass7(definitions);
    }

    return this;
  }

  /// border-color-red
  _BorderColor _copyWithClass3(List<String> definitions) {
    final borderColor = definitions.last;
    return _fromDefinitions(borderColor: borderColor);
  }

  /// border-color-xl-red
  _BorderColor _copyWithClass4(List<String> definitions) {
    final borderColor = definitions.last;
    final breakPoint = definitions[1];
    return _fromDefinitions(borderColor: borderColor, breakPoint: breakPoint);
  }

  /// border-color-r-g-b
  _BorderColor _copyWithClass5(List<String> definitions) {
    final borderColor = definitions.last;
    final r = int.parse(definitions[1]);
    final g = int.parse(definitions[2]);
    final b = int.parse(definitions[3]);
    return _fromDefinitions(borderColor: borderColor, r: r, g: g, b: b);
  }

  /// border-color-xl-r-g-b   border-color-r-g-b-a
  _BorderColor _copyWithClass6(List<String> definitions) {
    final borderColor = definitions.last;
    final breakPoint = definitions[1];
    var hasBreakPoint = breakPoints.contains(breakPoint);
    if (hasBreakPoint) {
      final r = int.parse(definitions[2]);
      final g = int.parse(definitions[3]);
      final b = int.parse(definitions[4]);
      return _fromDefinitions(
          borderColor: borderColor, breakPoint: breakPoint, r: r, g: g, b: b);
    }
    final r = int.parse(definitions[1]);
    final g = int.parse(definitions[2]);
    final b = int.parse(definitions[3]);
    final a = double.parse(definitions[4]);
    return _fromDefinitions(
        borderColor: borderColor,
        breakPoint: breakPoint,
        r: r,
        g: g,
        b: b,
        a: a);
  }

  /// border-color-xl-r-g-b-a
  _BorderColor _copyWithClass7(List<String> definitions) {
    final borderColor = definitions.last;
    final breakPoint = definitions[1];
    final r = int.parse(definitions[2]);
    final g = int.parse(definitions[3]);
    final b = int.parse(definitions[4]);
    final a = double.parse(definitions[5]);
    return _fromDefinitions(
        borderColor: borderColor,
        breakPoint: breakPoint,
        r: r,
        g: g,
        b: b,
        a: a);
  }

  _BorderColor _fromDefinitions({
    required String borderColor,
    String? breakPoint,
    int? r,
    int? g,
    int? b,
    double? a,
  }) {
    Color? color;

    switch (borderColor) {
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
          if (borderColor.length == 3 || borderColor.length == 6) {
            color = TinyColor.fromString('0xFF$borderColor').toColor();
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
        return _copyWith(defaultBorderColor: color);
    }
  }
}
