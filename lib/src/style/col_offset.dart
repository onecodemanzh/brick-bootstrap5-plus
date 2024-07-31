part of brick_bootstrap5_plus_style;
class _Offset {
  final _ColOffset? defaultOffset;
  final _ColOffset? xs;
  final _ColOffset? sm;
  final _ColOffset? md;
  final _ColOffset? lg;
  final _ColOffset? xl;
  final _ColOffset? xxl;

  _Offset({
    this.defaultOffset,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Offset _copyWith({
    _ColOffset? defaultOffset,
    _ColOffset? xs,
    _ColOffset? sm,
    _ColOffset? md,
    _ColOffset? lg,
    _ColOffset? xl,
    _ColOffset? xxl,
  }) {
    return _Offset(
      defaultOffset: defaultOffset ?? this.defaultOffset,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Offset _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _Offset _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: numerator);
  }

  _Offset _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, size: numerator, breakPoint: breakPoint);
  }

  _Offset _fromDefinitions({
    required String type,
    double? size,
    String? breakPoint,
  }) {
    if (size == null || size < 0 || size > 24) return this;

    final offset = _ColOffset._(numerator: size);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: offset);
      case 'sm':
        return _copyWith(sm: offset);
      case 'md':
        return _copyWith(md: offset);
      case 'lg':
        return _copyWith(lg: offset);
      case 'xl':
        return _copyWith(xl: offset);
      case 'xxl':
        return _copyWith(xxl: offset);
      default:
        return _copyWith(defaultOffset: offset);
    }
  }
}

class _ColOffset implements _Sizing {
  const _ColOffset._({
    required this.numerator,
  });

  @override
  final double numerator;
}
