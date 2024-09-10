part of brick_bootstrap5_plus_style;

// https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html
class _Blur {
  final ImageFilter? defaultBlur;
  final ImageFilter? xs;
  final ImageFilter? sm;
  final ImageFilter? md;
  final ImageFilter? lg;
  final ImageFilter? xl;
  final ImageFilter? xxl;

  _Blur({
    this.defaultBlur,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Blur _copyWith({
    ImageFilter? defaultBlur,
    ImageFilter? xs,
    ImageFilter? sm,
    ImageFilter? md,
    ImageFilter? lg,
    ImageFilter? xl,
    ImageFilter? xxl,
  }) {
    return _Blur(
      defaultBlur: defaultBlur ?? this.defaultBlur,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Blur _copyWithClass(String className) {
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

  _Blur _copyWithClass3(List<String> definitions) {
    final x = _fromString(definitions[1]);
    final y = _fromString(definitions[2]);

    return _fromDefinitions(
      defaultSigmaX: x,
      defaultSigmaY: y,
    );
  }

  _Blur _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[1];
    final x = _fromString(definitions[2]);
    final y = _fromString(definitions[3]);

    return _fromDefinitions(
      defaultSigmaX: x,
      defaultSigmaY: y,
      breakPoint: breakPoint,
    );
  }

  _Blur _fromDefinitions({
    double? defaultSigmaX,
    double? defaultSigmaY,
    String? breakPoint,
  }) {
    var f = ImageFilter.blur(
      sigmaX: defaultSigmaX ?? 0.0,
      sigmaY: defaultSigmaY ?? 0.0,
    );
    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: f);
      case 'sm':
        return _copyWith(sm: f);
      case 'md':
        return _copyWith(md: f);
      case 'lg':
        return _copyWith(lg: f);
      case 'xl':
        return _copyWith(xl: f);
      case 'xxl':
        return _copyWith(xxl: f);
      default:
        return _copyWith(defaultBlur: f);
    }
  }
}
