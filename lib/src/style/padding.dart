part of brick_bootstrap5_plus_style;
class _Padding extends _ResponsiveSpacing {
  final _ContentPadding? defaultPadding;
  @override
  final _ContentPadding? xs;
  @override
  final _ContentPadding? sm;
  @override
  final _ContentPadding? md;
  @override
  final _ContentPadding? lg;
  @override
  final _ContentPadding? xl;
  @override
  final _ContentPadding? xxl;

  _Padding({
    this.defaultPadding,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Padding _copyWith({
    _ContentPadding? defaultPadding,
    _ContentPadding? xs,
    _ContentPadding? sm,
    _ContentPadding? md,
    _ContentPadding? lg,
    _ContentPadding? xl,
    _ContentPadding? xxl,
  }) {
    return _Padding(
      defaultPadding:
          this.defaultPadding?._add(defaultPadding) ?? defaultPadding,
      xs: this.xs?._add(xs) ?? xs,
      sm: this.sm?._add(sm) ?? sm,
      md: this.md?._add(md) ?? md,
      lg: this.lg?._add(lg) ?? lg,
      xl: this.xl?._add(xl) ?? xl,
      xxl: this.xxl?._add(xxl) ?? xxl,
    );
  }

  @override
  _Padding _fromDefinitions(
      {required String type, double? size, String? breakPoint}) {
    if (size == null) return this;
    _ContentPadding? padding;
    switch (type) {
      case 'p':
        padding =
            _ContentPadding._(left: size, right: size, top: size, bottom: size);
        break;
      case 'pt':
        padding = _ContentPadding._(top: size);
        break;
      case 'pb':
        padding = _ContentPadding._(bottom: size);
        break;
      case 'ps':
      case 'pl':
        padding = _ContentPadding._(left: size);
        break;
      case 'pe':
      case 'pr':
        padding = _ContentPadding._(right: size);
        break;
      case 'px':
        padding = _ContentPadding._(left: size, right: size);
        break;
      case 'py':
        padding = _ContentPadding._(top: size, bottom: size);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: padding);
      case 'sm':
        return _copyWith(sm: padding);
      case 'md':
        return _copyWith(md: padding);
      case 'lg':
        return _copyWith(lg: padding);
      case 'xl':
        return _copyWith(xl: padding);
      case 'xxl':
        return _copyWith(xxl: padding);
      default:
        return _copyWith(defaultPadding: padding);
    }
  }
}

class PaddingStyle extends _Padding{}
class _ContentPadding implements _Spacing {
  @override
  final double? left;
  @override
  final double? right;
  @override
  final double? top;
  @override
  final double? bottom;

  const _ContentPadding._({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  _ContentPadding? _add(_ContentPadding? padding) {
    if (padding == null) return this;

    return _ContentPadding._(
      left: padding.left ?? left,
      right: padding.right ?? right,
      bottom: padding.bottom ?? bottom,
      top: padding.top ?? top,
    );
  }
}
