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
    required this.children,
    this.childRef,
  });

  /// 纵向对齐 [classNames] align-items-],
  ///
  ///     - [_VerticalAlignment] (s.va)
  ///
  /// 横向对齐 [classNames] justify-content- > align-self- > align-
  ///
  ///     - [_HorizontalAlignment > _SelfAlignment > _Alignment] (s.ha > s.sa > s.a)
  ///
  /// 高度 height (属性) > h (classNames),
  ///
  /// 样式 [decoration] [Decoration] [BoxDecoration],
  ///
  /// Wrap 样式 [foregroundDecoration] 不建义使用。
  ///
  /// childRef 子组件Ref [String] 在 [Renderer] 组件里使用，通过[childRef]找到相应组件，显示在[BCol]里。
  ///
  /// child [Widget] 子组件 (child 与 childRef只能有一个)。
  ///
  /// children  [List<Widget>] 子组件数组 (children 优先组大于child)。
  ///
  /// defaultWidth  不建义直接使用。
  ///
  /// 不支持的classNames 'activeColor- hoverColor- hoverBorderColor- hoverBorder- fit- font-size- font-weight-'
  ///
  /// 不支持的classNames 'blur- maxHeight- minHeight- minWidth- maxWidth- scale- w-'
  ///
  /// ```dart
  ///   BCol(
  ///     classNames: 'col-24 offset-1 order-1',
  ///     classNames: 'align-items-start align-items-center align-items-end ' // 纵向对齐
  ///     classNames: 'justify-content-start justify-content-around justify-content-between justify-content-evenly justify-content-center justify-content-end' // 横向对齐 (由于最终使用的是Wrap组件，另外横向对齐 只支持左对齐，右对齐，居中对齐)
  ///     classNames: 'align-self-bottomCenter align-self-bottomLeft align-self-bottomRight align-self-center align-self-centerLeft align-self-centerRight align-self-topCenter align-self-topLeft align-self-topRight ' // 横向对齐
  ///     classNames: 'align-bottomCenter align-bottomLeft align-bottomRight align-center align-centerLeft align-centerRight align-topCenter align-topLeft align-topRight ' // 横向对齐
  ///     classNames: 'border-radius-4  border-color-red border-1' // 边框
  ///     classNames: 'mt-10 mb-10 h-160-px bg-black ' // 只支持 bg-  背景色
  ///     classNames: 'shadow-color-black shadow-blurRadius-4 shadow-offset-1,1' // 阴影
  ///     height: 160,
  ///     decoration: BoxDecoration(),
  ///     childRef: ,
  ///     child: ,
  ///     children:[],
  ///   )
  /// ```
  ///
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
    List<Widget> children = const [],

    /// 子组件Ref (child 与 childRef只能有一个)
    String? childRef,
    double? defaultWidth,
  }) {
    final style = convertClassNamesToStyle(classNames);

    return BCol._(
      key: key,
      height: height,
      style: style,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      defaultWidth: defaultWidth,
      childRef: childRef,
      child: child,
      children: children,
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
  List<Widget> children;

  BCol _wrapChild(Widget? Function(Widget? child) wrap,
          {double? defaultWidth}) =>
      BCol._(
        key: key,
        style: style,
        height: height,
        defaultWidth: defaultWidth,
        child: wrap(child),
        children: children,
      );

  WrapAlignment _convertWrapAlignment(Alignment? alignment) {
    switch (alignment) {
      case Alignment.bottomCenter:
        return WrapAlignment.center;
      case Alignment.bottomLeft:
        return WrapAlignment.start;
      case Alignment.bottomRight:
        return WrapAlignment.end;
      case Alignment.center:
        return WrapAlignment.center;
      case Alignment.centerLeft:
        return WrapAlignment.start;
      case Alignment.centerRight:
        return WrapAlignment.end;
      case Alignment.topCenter:
        return WrapAlignment.center;
      case Alignment.topLeft:
        return WrapAlignment.start;
      case Alignment.topRight:
        return WrapAlignment.end;
      default:
        return WrapAlignment.start;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      var s = getStyle(screenData, constraints, style);
      if (s.isVisible == false) return const SizedBox.shrink();
      final alignment = s.sa ?? s.a;
      return Container(
        // alignment: s.sa,
        margin: s.co != null
            ? EdgeInsets.fromLTRB(
                s.co ?? 0, s.cm!.top, s.cm!.right, s.cm!.bottom)
            : s.cm,
        padding: s.cp,
        width: s.width?.floorToDouble() ?? defaultWidth,
        height: height ?? s.h,
        decoration: decoration ??
            getBoxDecorationByStyle(s, false.obs) ??
            BoxDecoration(),
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: Wrap(
          crossAxisAlignment: s.va ?? WrapCrossAlignment.start,
          alignment: s.ha ??
              (alignment != null
                  ? alignment2WrapAlignment(alignment) ?? WrapAlignment.start
                  : WrapAlignment.start),
          children:
              children.isNotEmpty ? children : [child ?? SizedBox.shrink()],
        ),
      );
    });
  }
}
