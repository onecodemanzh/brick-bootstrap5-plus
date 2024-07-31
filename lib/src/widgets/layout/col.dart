part of brick_bootstrap5_plus_widgets;

class BCol extends _OrderWidget {
  BCol._({
    super.key,
    this.height,
    this.style,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.defaultWidth,
    this.child,
    this.childRef,
  });

  factory BCol({
    Key? key,
    String? classNames,
    double? height,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,

    /// 子组件 (child 与 childRef只能有一个)
    Widget? child,

    /// 子组件Ref (child 与 childRef只能有一个)
    String? childRef,
    double? defaultWidth,
  }) {
    final style = convertClassNamesToStyle(classNames);
    return BCol._(
      key: key,
      height: height,
      style: style as Style,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      defaultWidth: defaultWidth,
      childRef: childRef,
      child: child,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  final Style? style;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final double? height;
  final Clip clipBehavior;
  final double? defaultWidth;

  /// 子组件Ref (child 与 childRef只能有一个)
  final String? childRef;
  Widget? child;

  BCol _wrapChild(Widget? Function(Widget? child) wrap,
          {double? defaultWidth}) =>
      BCol._(
        key: key,
        style: style,
        height: height,
        defaultWidth: defaultWidth,
        child: wrap(child),
      );

  @override
  Widget build(BuildContext context) {
    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      var s = getStyle(screenData, constraints, style);
      if (s.isVisible == false) return const SizedBox.shrink();
      return Container(
        alignment: s.sa,
        margin: s.co != null
            ? EdgeInsets.fromLTRB(
                s.co ?? 0, s.cm!.top, s.cm!.right, s.cm!.bottom)
            : s.cm,
        padding: s.cp,
        width: s.width?.floorToDouble() ?? defaultWidth,
        height: height,
        color: s.bg ?? s.color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: child,
      );
    });
  }
}
