part of brick_bootstrap5_plus_style;
class _Height {
  final double? defaultHeight;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;
  String? unit;

  _Height({
    this.defaultHeight,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.unit,
  });

  _Height _copyWith({
    double? defaultHeight,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return _Height(
      defaultHeight: defaultHeight ?? this.defaultHeight,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      unit: unit,
    );
  }

  _Height _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      /// h-10
      case 2:
        return _copyWithClass2(definitions);

      /// h-xl-10 h-10-px
      case 3:
        return _copyWithClass3(definitions);

      /// h-xl-10-px
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  /// h-10
  _Height _copyWithClass2(List<String> definitions) {
    final type = definitions.last;
    final height = double.parse(definitions[1]);
    return _fromDefinitions(type: type, height: height, unit1: '%');
  }

  /// h-xl-10  h-10-px
  _Height _copyWithClass3(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    final double height;
    if (['px'].contains(definitions[2])) {
      height = double.parse(definitions[1]);
      return _fromDefinitions(type: type, height: height, unit1: 'px');
    } else {
      height = double.parse(definitions[2]);
      return _fromDefinitions(
          type: type, height: height, breakPoint: breakPoint, unit1: '%');
    }
  }

  /// h-xl-10-px
  _Height _copyWithClass4(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    final height = double.parse(definitions[3]);
    return _fromDefinitions(
        type: type, height: height, breakPoint: breakPoint, unit1: 'px');
  }

  _Height _fromDefinitions({
    required String type,
    required double height,
    String? breakPoint,
    String? unit1,
  }) {
    unit = unit1;
    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: height);
      case 'sm':
        return _copyWith(sm: height);
      case 'md':
        return _copyWith(md: height);
      case 'lg':
        return _copyWith(lg: height);
      case 'xl':
        return _copyWith(xl: height);
      case 'xxl':
        return _copyWith(xxl: height);
      default:
        return _copyWith(defaultHeight: height);
    }
  }
}
