part of brick_bootstrap5_plus_style;

class _Width {
  final double? defaultWidth;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;
  String? unit;

  _Width({
    this.defaultWidth,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.unit,
  });

  _Width _copyWith({
    double? defaultWidth,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return _Width(
      defaultWidth: defaultWidth ?? this.defaultWidth,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      unit: unit,
    );
  }

  _Width _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// w-10
      case 2:
        return _copyWithClass2(definitions);

      /// w-xl-10 w-10-px
      case 3:
        return _copyWithClass3(definitions);

      /// w-xl-10-px
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  /// w-10
  _Width _copyWithClass2(List<String> definitions) {
    final type = definitions.last;
    final width = double.parse(definitions[1]);
    return _fromDefinitions(type: type, width: width, unit1: '%');
  }

  /// w-xl-10  w-10-px
  _Width _copyWithClass3(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    final double width;
    if (['px'].contains(definitions[2])) {
      width = double.parse(definitions[1]);
      return _fromDefinitions(type: type, width: width, unit1: 'px');
    } else {
      width = double.parse(definitions[2]);
      return _fromDefinitions(
          type: type, width: width, breakPoint: breakPoint, unit1: '%');
    }
  }

  /// w-xl-10-px
  _Width _copyWithClass4(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    final width = double.parse(definitions[3]);
    return _fromDefinitions(
        type: type, width: width, breakPoint: breakPoint, unit1: 'px');
  }

  _Width _fromDefinitions({
    required String type,
    required double width,
    String? breakPoint,
    String? unit1,
  }) {
    unit = unit1;
    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: width);
      case 'sm':
        return _copyWith(sm: width);
      case 'md':
        return _copyWith(md: width);
      case 'lg':
        return _copyWith(lg: width);
      case 'xl':
        return _copyWith(xl: width);
      case 'xxl':
        return _copyWith(xxl: width);
      default:
        return _copyWith(defaultWidth: width);
    }
  }
}
