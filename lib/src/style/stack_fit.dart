part of brick_bootstrap5_plus_style;

class _StackFit {
  final StackFit? defaultFit;
  final StackFit? xs;
  final StackFit? sm;
  final StackFit? md;
  final StackFit? lg;
  final StackFit? xl;
  final StackFit? xxl;

  _StackFit({
    this.defaultFit,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _StackFit _copyWith({
    StackFit? defaultFit,
    StackFit? xs,
    StackFit? sm,
    StackFit? md,
    StackFit? lg,
    StackFit? xl,
    StackFit? xxl,
  }) {
    return _StackFit(
      defaultFit: defaultFit ?? this.defaultFit,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _StackFit _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  StackFit? _fromString(String alignment) {
    switch (alignment) {
      case 'loose':
        return StackFit.loose;
      case 'expand':
        return StackFit.expand;
      case 'passthrough':
        return StackFit.passthrough;
    }
    return null;
  }

  _StackFit _copyWithClass3(List<String> definitions) {
    final f = _fromString(definitions.last);
    return _fromDefinitions(fit: f);
  }

  _StackFit _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[2];
    final f = _fromString(definitions.last);
    return _fromDefinitions(fit: f, breakPoint: breakPoint);
  }

  _StackFit _fromDefinitions({
    StackFit? fit,
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
