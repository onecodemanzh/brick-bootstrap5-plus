part of brick_bootstrap5_plus_style;


class _FontWeight {
  final FontWeight? defaultFontWeight;
  final FontWeight? xs;
  final FontWeight? sm;
  final FontWeight? md;
  final FontWeight? lg;
  final FontWeight? xl;
  final FontWeight? xxl;

  _FontWeight({
    this.defaultFontWeight,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FontWeight _copyWith({
    FontWeight? defaultFontWeight,
    FontWeight? xs,
    FontWeight? sm,
    FontWeight? md,
    FontWeight? lg,
    FontWeight? xl,
    FontWeight? xxl,
  }) {
    return _FontWeight(
      defaultFontWeight: defaultFontWeight ?? this.defaultFontWeight,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FontWeight _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  FontWeight? _fromString(String weight) {
    switch (weight) {
      case '100':
        return FontWeight.w100;
      case '200':
        return FontWeight.w200;
      case '300':
        return FontWeight.w300;
      case '400':
        return FontWeight.w400;
      case '500':
        return FontWeight.w500;
      case '600':
        return FontWeight.w600;
      case '700':
        return FontWeight.w700;
      case '800':
        return FontWeight.w800;
      case '900':
        return FontWeight.w900;
      case 'n':
      case 'normal':
        return FontWeight.w400;
      case 'b':
      case 'bold':
        return FontWeight.w700;
    }
    return FontWeight.w700;
  }

  _FontWeight _copyWithClass2(List<String> definitions) {
    final alignment = _fromString('');
    return _fromDefinitions(alignment: alignment);
  }

  _FontWeight _copyWithClass3(List<String> definitions) {
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment);
  }

  _FontWeight _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[2];
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment, breakPoint: breakPoint);
  }

  _FontWeight _fromDefinitions({
    FontWeight? alignment,
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
        return _copyWith(defaultFontWeight: alignment);
    }
  }
}
