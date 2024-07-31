part of brick_bootstrap5_plus_style;
class _Size {
  final _ColSize? defaultSize;
  final _ColSize? xs;
  final _ColSize? sm;
  final _ColSize? md;
  final _ColSize? lg;
  final _ColSize? xl;
  final _ColSize? xxl;

  _Size({
    this.defaultSize,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Size _copyWith({
    _ColSize? defaultSize,
    _ColSize? xs,
    _ColSize? sm,
    _ColSize? md,
    _ColSize? lg,
    _ColSize? xl,
    _ColSize? xxl,
  }) {
    return _Size(
      defaultSize: defaultSize ?? this.defaultSize,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Size _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _Size _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: numerator);
  }

  _Size _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, size: numerator, breakPoint: breakPoint);
  }

  _Size _fromDefinitions({
    required String type,
    double? size,
    String? breakPoint,
  }) {
    if (size == null || size < 0 || size > 24) return this;

    final colSize = _ColSize._(numerator: size);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: colSize);
      case 'sm':
        return _copyWith(sm: colSize);
      case 'md':
        return _copyWith(md: colSize);
      case 'lg':
        return _copyWith(lg: colSize);
      case 'xl':
        return _copyWith(xl: colSize);
      case 'xxl':
        return _copyWith(xxl: colSize);
      default:
        return _copyWith(defaultSize: colSize);
    }
  }
}

class _ColSize implements _Sizing {
  const _ColSize._({
    required this.numerator,
  });

  @override
  final double numerator;
}
