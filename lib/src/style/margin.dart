part of brick_bootstrap5_plus_style;

class _Margin extends _ResponsiveSpacing {
  final _ContentMargin? defaultMargin;
  @override
  final _ContentMargin? xs;
  @override
  final _ContentMargin? sm;
  @override
  final _ContentMargin? md;
  @override
  final _ContentMargin? lg;
  @override
  final _ContentMargin? xl;
  @override
  final _ContentMargin? xxl;

  _Margin({
    this.defaultMargin,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Margin _copyWith({
    _ContentMargin? defaultMargin,
    _ContentMargin? xs,
    _ContentMargin? sm,
    _ContentMargin? md,
    _ContentMargin? lg,
    _ContentMargin? xl,
    _ContentMargin? xxl,
  }) {
    return _Margin(
      defaultMargin: this.defaultMargin?._add(defaultMargin) ?? defaultMargin,
      xs: this.xs?._add(xs) ?? xs,
      sm: this.sm?._add(sm) ?? sm,
      md: this.md?._add(md) ?? md,
      lg: this.lg?._add(lg) ?? lg,
      xl: this.xl?._add(xl) ?? xl,
      xxl: this.xxl?._add(xxl) ?? xxl,
    );
  }

  @override
  _Margin _fromDefinitions({
    required String type,
    double? size,
    String? breakPoint,
  }) {
    if (size == null) return this;

    _ContentMargin? margin;

    switch (type) {
      case 'm':
        margin =
            _ContentMargin._(left: size, right: size, top: size, bottom: size);
        break;
      case 'mt':
        margin = _ContentMargin._(top: size);
        break;
      case 'mb':
        margin = _ContentMargin._(bottom: size);
        break;
      case 'ms':
      case 'ml':
        margin = _ContentMargin._(left: size);
        break;
      case 'me':
      case 'mr':
        margin = _ContentMargin._(right: size);
        break;
      case 'mx':
        margin = _ContentMargin._(left: size, right: size);
        break;
      case 'my':
        margin = _ContentMargin._(top: size, bottom: size);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: margin);
      case 'sm':
        return _copyWith(sm: margin);
      case 'md':
        return _copyWith(md: margin);
      case 'lg':
        return _copyWith(lg: margin);
      case 'xl':
        return _copyWith(xl: margin);
      case 'xxl':
        return _copyWith(xxl: margin);
      default:
        return _copyWith(defaultMargin: margin);
    }
  }
}

class Margin extends _Margin {}

class _ContentMargin implements _Spacing {
  @override
  final double? left;
  @override
  final double? right;
  @override
  final double? top;
  @override
  final double? bottom;

  const _ContentMargin._({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  _ContentMargin _add(_ContentMargin? margin) {
    if (margin == null) return this;

    return _ContentMargin._(
      left: margin.left ?? left,
      right: margin.right ?? right,
      bottom: margin.bottom ?? bottom,
      top: margin.top ?? top,
    );
  }
}
