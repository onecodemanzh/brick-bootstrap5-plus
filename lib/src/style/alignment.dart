part of brick_bootstrap5_plus_style;

class _Alignment {
  final Alignment? defaultAlignment;
  final Alignment? xs;
  final Alignment? sm;
  final Alignment? md;
  final Alignment? lg;
  final Alignment? xl;
  final Alignment? xxl;

  _Alignment({
    this.defaultAlignment,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Alignment _copyWith({
    Alignment? defaultAlignment,
    Alignment? xs,
    Alignment? sm,
    Alignment? md,
    Alignment? lg,
    Alignment? xl,
    Alignment? xxl,
  }) {
    return _Alignment(
      defaultAlignment: defaultAlignment ?? this.defaultAlignment,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Alignment _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  Alignment? _fromString(String alignment) {
    switch (alignment) {
      case 'start':
        return Alignment.topLeft;
      case 'center':
        return Alignment.center;
      case 'end':
        return Alignment.bottomRight;
      case 'bottomCenter':
        return Alignment.bottomCenter;
      case 'bottomLeft':
        return Alignment.bottomLeft;
      case 'bottomRight':
        return Alignment.bottomRight;
      case 'centerLeft':
        return Alignment.centerLeft;
      case 'centerRight':
        return Alignment.centerRight;
      case 'topCenter':
        return Alignment.topCenter;
      case 'topLeft':
        return Alignment.topLeft;
      case 'topRight':
        return Alignment.topRight;
    }
    return null;
  }

  _Alignment _copyWithClass2(List<String> definitions) {
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment);
  }

  _Alignment _copyWithClass3(List<String> definitions) {
    final breakPoint = definitions[1];
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment, breakPoint: breakPoint);
  }

  _Alignment _fromDefinitions({
    Alignment? alignment,
    String? breakPoint,
  }) {
    if (alignment == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: alignment);
      case 'sm':
        return _copyWith(sm: alignment);
      case 'md':
        return _copyWith(md: alignment);
      case 'lg':
        return _copyWith(lg: alignment);
      case 'xl':
        return _copyWith(xl: alignment);
      case 'xxl':
        return _copyWith(xxl: alignment);
      default:
        return _copyWith(defaultAlignment: alignment);
    }
  }
}
