part of brick_bootstrap5_plus_style;
class _Color {
  final Color? defaultColor;
  final Color? xs;
  final Color? sm;
  final Color? md;
  final Color? lg;
  final Color? xl;
  final Color? xxl;

  _Color({
    this.defaultColor,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Color _copyWith({
    Color? defaultColor,
    Color? xs,
    Color? sm,
    Color? md,
    Color? lg,
    Color? xl,
    Color? xxl,
  }) {
    return _Color(
      defaultColor: defaultColor ?? this.defaultColor,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Color _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// color-red
      case 2:
        return _copyWithClass2(definitions);

      /// color-xl-red
      case 3:
        return _copyWithClass3(definitions);

      /// color-r-g-b
      case 4:
        return _copyWithClass4(definitions);

      /// color-xl-r-g-b   color-r-g-b-a
      case 5:
        return _copyWithClass5(definitions);

      /// color-xl-r-g-b-a
      case 6:
        return _copyWithClass6(definitions);
    }

    return this;
  }

  /// color-red
  _Color _copyWithClass2(List<String> definitions) {
    final type = definitions.last;
    return _fromDefinitions(type: type);
  }

  /// color-xl-red
  _Color _copyWithClass3(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    return _fromDefinitions(type: type, breakPoint: breakPoint);
  }

  /// color-r-g-b
  _Color _copyWithClass4(List<String> definitions) {
    final type = definitions.last;
    final r = int.parse(definitions[1]);
    final g = int.parse(definitions[2]);
    final b = int.parse(definitions[3]);
    return _fromDefinitions(type: type, r: r, g: g, b: b);
  }

  /// color-xl-r-g-b   color-r-g-b-a
  _Color _copyWithClass5(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    var hasBreakPoint = breakPoints.contains(breakPoint);
    if (hasBreakPoint) {
      final r = int.parse(definitions[2]);
      final g = int.parse(definitions[3]);
      final b = int.parse(definitions[4]);
      return _fromDefinitions(
          type: type, breakPoint: breakPoint, r: r, g: g, b: b);
    }
    final r = int.parse(definitions[1]);
    final g = int.parse(definitions[2]);
    final b = int.parse(definitions[3]);
    final a = double.parse(definitions[4]);
    return _fromDefinitions(
        type: type, breakPoint: breakPoint, r: r, g: g, b: b, a: a);
  }

  /// color-xl-r-g-b-a
  _Color _copyWithClass6(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    final r = int.parse(definitions[2]);
    final g = int.parse(definitions[3]);
    final b = int.parse(definitions[4]);
    final a = double.parse(definitions[5]);
    return _fromDefinitions(
        type: type, breakPoint: breakPoint, r: r, g: g, b: b, a: a);
  }

  _Color _fromDefinitions({
    required String type,
    String? breakPoint,
    int? r,
    int? g,
    int? b,
    double? a,
  }) {
    Color? color;

    switch (type) {
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
          if (type.length == 3 || type.length == 6) {
            color = TinyColor.fromString('0xFF$type').toColor();
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
        return _copyWith(defaultColor: color);
    }
  }
}
