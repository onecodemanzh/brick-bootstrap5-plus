part of brick_bootstrap5_plus_style;
class _Display {
  final _ContentDisplay? defaultDisplay;
  final _ContentDisplay? xs;
  final _ContentDisplay? sm;
  final _ContentDisplay? md;
  final _ContentDisplay? lg;
  final _ContentDisplay? xl;
  final _ContentDisplay? xxl;

  _Display({
    this.defaultDisplay,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Display _copyWith({
    _ContentDisplay? defaultDisplay,
    _ContentDisplay? xs,
    _ContentDisplay? sm,
    _ContentDisplay? md,
    _ContentDisplay? lg,
    _ContentDisplay? xl,
    _ContentDisplay? xxl,
  }) {
    return _Display(
      defaultDisplay: defaultDisplay ?? this.defaultDisplay,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Display _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _Display _copyWithClass2(List<String> definitions) {
    final type = definitions.last;
    return _fromDefinitions(type: type);
  }

  _Display _copyWithClass3(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    return _fromDefinitions(type: type, breakPoint: breakPoint);
  }

  _Display _fromDefinitions({
    required String type,
    String? breakPoint,
  }) {
    _ContentDisplay? display;

    switch (type) {
      case 'none':
        display = const _ContentDisplay._(visible: false);
        break;
      case 'block':
        display = const _ContentDisplay._(visible: true);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: display);
      case 'sm':
        return _copyWith(sm: display);
      case 'md':
        return _copyWith(md: display);
      case 'lg':
        return _copyWith(lg: display);
      case 'xl':
        return _copyWith(xl: display);
      case 'xxl':
        return _copyWith(xxl: display);
      default:
        return _copyWith(defaultDisplay: display);
    }
  }
}

class _ContentDisplay {
  final bool visible;

  const _ContentDisplay._({
    this.visible = true,
  });
}
