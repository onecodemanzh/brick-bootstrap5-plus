part of brick_bootstrap5_plus_style;

class _Fit {
  final BoxFit? defaultFit;
  final BoxFit? xs;
  final BoxFit? sm;
  final BoxFit? md;
  final BoxFit? lg;
  final BoxFit? xl;
  final BoxFit? xxl;

  _Fit({
    this.defaultFit,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Fit _copyWith({
    BoxFit? defaultFit,
    BoxFit? xs,
    BoxFit? sm,
    BoxFit? md,
    BoxFit? lg,
    BoxFit? xl,
    BoxFit? xxl,
  }) {
    return _Fit(
      defaultFit: defaultFit ?? this.defaultFit,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Fit _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  BoxFit? _fromString(String alignment) {
    switch (alignment) {
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'cover':
        return BoxFit.cover;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'none':
        return BoxFit.none;
      case 'scaleDown':
        return BoxFit.scaleDown;
    }
    return null;
  }

  _Fit _copyWithClass2(List<String> definitions) {
    final f = _fromString(definitions.last);
    return _fromDefinitions(fit: f);
  }

  _Fit _copyWithClass3(List<String> definitions) {
    final breakPoint = definitions[1];
    final f = _fromString(definitions.last);
    return _fromDefinitions(fit: f, breakPoint: breakPoint);
  }

  _Fit _fromDefinitions({
    BoxFit? fit,
    String? breakPoint,
  }) {
    if (fit == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: fit);
      case 'sm':
        return _copyWith(sm: fit);
      case 'md':
        return _copyWith(md: fit);
      case 'lg':
        return _copyWith(lg: fit);
      case 'xl':
        return _copyWith(xl: fit);
      case 'xxl':
        return _copyWith(xxl: fit);
      default:
        return _copyWith(defaultFit: fit);
    }
  }
}
