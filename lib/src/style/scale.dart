part of brick_bootstrap5_plus_style;

class _Scale {
  final Transform? defaultScale;
  final Transform? xs;
  final Transform? sm;
  final Transform? md;
  final Transform? lg;
  final Transform? xl;
  final Transform? xxl;

  _Scale({
    this.defaultScale,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  // 复制构造函数
  _Scale _copyWith({
    Transform? defaultScale,
    Transform? xs,
    Transform? sm,
    Transform? md,
    Transform? lg,
    Transform? xl,
    Transform? xxl,
  }) {
    return _Scale(
      defaultScale: defaultScale ?? this.defaultScale,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Scale _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      // scale-1
      case 2:
        return _copyWithClass2(definitions);
      // scale-1-1
      case 3:
        return _copyWithClass3(definitions);

      // scale-xl-1-1
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  double? _fromString(String fontSize) {
    return double.parse(fontSize);
  }

  _Scale _copyWithClass2(List<String> definitions) {
    final s = _fromString(definitions[1]);
    return _fromDefinitions(
      scale: s,
      defaultscaleX: null,
      defaultscaleY: null,
    );
  }

  _Scale _copyWithClass3(List<String> definitions) {
    final x = _fromString(definitions[1]);
    final y = _fromString(definitions[2]);

    return _fromDefinitions(
      defaultscaleX: x,
      defaultscaleY: y,
    );
  }

  _Scale _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[1];
    final x = _fromString(definitions[2]);
    final y = _fromString(definitions[3]);

    return _fromDefinitions(
      defaultscaleX: x,
      defaultscaleY: y,
      breakPoint: breakPoint,
    );
  }

  // _Scale _copyWithClass2(List<String> definitions) {
  //   final scale = double.parse(definitions.last);
  //   return _fromDefinitions(scale: scale);
  // }

  // _Scale _copyWithClass3(List<String> definitions) {
  //   final scale = double.parse(definitions.last);
  //   final breakPoint = definitions[1];
  //   return _fromDefinitions(scale: scale, breakPoint: breakPoint);
  // }

  // // 默认缩放
  // _Scale _applyScale(List<String> scaleStr) {
  //   final scale = double.tryParse(scaleStr[1]) ?? 1.0; // 默认缩放 1
  //   return _copyWith(defaultScale: scale);
  // }

  // 应用带断点的缩放值
  _Scale _fromDefinitions({
    double? scale,
    double? defaultscaleX,
    double? defaultscaleY,
    String? breakPoint,
  }) {
    var s = Transform.scale(
        scaleX: defaultscaleX, scaleY: defaultscaleY, scale: scale);
    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: s);
      case 'sm':
        return _copyWith(sm: s);
      case 'md':
        return _copyWith(md: s);
      case 'lg':
        return _copyWith(lg: s);
      case 'xl':
        return _copyWith(xl: s);
      case 'xxl':
        return _copyWith(xxl: s);
      default:
        return _copyWith(defaultScale: s);
    }
  }
}
