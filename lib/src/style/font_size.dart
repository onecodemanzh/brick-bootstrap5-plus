part of brick_bootstrap5_plus_style;
class _FontSize {
  final double? defaultFontSize;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;

  _FontSize({
    this.defaultFontSize,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FontSize _copyWith({
    double? defaultFontSize,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return _FontSize(
      defaultFontSize: defaultFontSize ?? this.defaultFontSize,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FontSize _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  double? _fromString(String fontSize) {
    return double.parse(fontSize);
  }

  _FontSize _copyWithClass3(List<String> definitions) {
    final fontSize = _fromString(definitions.last);
    return _fromDefinitions(fontSize: fontSize);
  }

  _FontSize _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[2];
    final fontSize = _fromString(definitions.last);
    return _fromDefinitions(fontSize: fontSize, breakPoint: breakPoint);
  }

  _FontSize _fromDefinitions({
    double? fontSize,
    String? breakPoint,
  }) {
    if (fontSize == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: fontSize);
      case 'sm':
        return _copyWith(sm: fontSize);
      case 'md':
        return _copyWith(md: fontSize);
      case 'lg':
        return _copyWith(lg: fontSize);
      case 'xl':
        return _copyWith(xl: fontSize);
      case 'xxl':
        return _copyWith(xxl: fontSize);
      default:
        return _copyWith(defaultFontSize: fontSize);
    }
  }
}
