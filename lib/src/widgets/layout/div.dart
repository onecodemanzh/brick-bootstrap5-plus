// ignore_for_file: no_leading_underscores_for_local_identifiers

part of brick_bootstrap5_plus_widgets;

enum Block {
  /// 行内块 如果没设置宽高 占自身所能显示的宽高  不能设置对齐
  inlineBlock,

  /// 块级 默认占一行
  block
}

class Div extends StatelessWidget {
  Div({
    super.key,
    required this.classNames,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.decoration,
    required this.child,
    this.children = const [],
    this.block = Block.block,
  });

  Decoration? decoration;

  final _isHover = false.obs;
  final Block block;
  final String classNames;
  final double? width;
  final double? height;
  final Widget child;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  static BContainer container() {
    return BContainer();
  }

  static BContainer containerFluid() {
    return BContainer.fluid();
  }

  Widget getWidget(StyleAbbrSet s, BoxConstraints _constraints) {
    final hasHover = RegExp('hover').hasMatch(classNames);
    final hasWidth = RegExp('w-').hasMatch(classNames);
    final hasHeight = RegExp('h-').hasMatch(classNames);
    Widget _child = SizedBox.shrink();
    final BoxConstraints constraints = BoxConstraints(
      maxHeight: (s.maxHeight != null && s.maxHeight! > 0)
          ? s.maxHeight!
          : _constraints.maxHeight,
      maxWidth: (s.maxWidth != null && s.maxWidth! > 0)
          ? s.maxWidth!
          : _constraints.maxWidth,
      minHeight: s.minHeight ?? _constraints.minHeight,
      minWidth: s.minWidth ?? _constraints.minWidth,
    );

    if (block == Block.inlineBlock) {
      _child = m.Padding(
        padding: margin ?? s.cm ?? EdgeInsets.all(0),
        child: SizedBox(
          width: width ?? s.w,
          height: height ?? s.h,
          child: hasHover
              ? Obx(
                  () => DecoratedBox(
                    decoration: decoration ??
                        getBoxDecorationByStyle(s, _isHover) ??
                        BoxDecoration(),
                    child: m.Padding(
                      padding: padding ?? s.cp ?? EdgeInsets.all(0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return hasWidth && hasHeight
                              ? Container(
                                  constraints: BoxConstraints(
                                      maxWidth: constraints.maxWidth,
                                      maxHeight: constraints.maxHeight),
                                  alignment: alignment ??
                                      s.a ??
                                      s.sa ??
                                      (s.va != null
                                          ? _convertAlignment(s.va)
                                          : Alignment.centerLeft),
                                  child: child,
                                )
                              : child;
                        },
                      ),
                    ),
                  ),
                )
              : DecoratedBox(
                  decoration: decoration ??
                      getBoxDecorationByStyle(s, _isHover) ??
                      BoxDecoration(),
                  child: m.Padding(
                    padding: padding ?? s.cp!,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return hasWidth && hasHeight
                            ? Container(
                                constraints: BoxConstraints(
                                  maxWidth: 10,
                                  maxHeight: 10,
                                ),
                                alignment: alignment ??
                                    s.a ??
                                    s.sa ??
                                    (s.va != null
                                        ? _convertAlignment(s.va)
                                        : Alignment.centerLeft),
                                child: child,
                              )
                            : child;
                      },
                    ),
                  ),
                ),
        ),
      );
    } else {
      _child = hasHover
          ? Obx(
              () => Container(
                width: width ?? s.w ?? constraints.maxWidth,
                height: height ?? s.h,
                decoration: decoration ?? getBoxDecorationByStyle(s, _isHover),
                margin: margin ?? s.cm,
                padding: padding ?? s.cp,
                alignment: alignment ??
                    s.a ??
                    s.sa ??
                    (s.va != null
                        ? _convertAlignment(s.va)
                        : Alignment.centerLeft),
                constraints: constraints,
                child: child,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: s.va,
                //   children: children.isEmpty ? [child] : children,
                // ),
              ),
            )
          : Container(
              width: width ?? s.w ?? constraints.maxWidth,
              height: height ?? s.h,
              decoration: decoration ?? getBoxDecorationByStyle(s, _isHover),
              margin: margin ?? s.cm,
              padding: padding ?? s.cp,
              alignment: alignment ??
                  s.a ??
                  s.sa ??
                  (s.va != null
                      ? _convertAlignment(s.va)
                      : Alignment.centerLeft),
              constraints: constraints,
              child: child,
            );
    }
    return hasHover
        ? MouseRegion(
            // hoverColor: Colors.transparent,
            // splashColor: Colors.transparent,
            onHover: (value) {
              _isHover.value = true;
            },
            onExit: (value) {
              _isHover.value = false;
            },
            // onTap: () {},
            child: _child,
          )
        : _child;
  }

  Alignment? _convertAlignment(WrapCrossAlignment? alignment) {
    switch (alignment) {
      case WrapCrossAlignment.start:
        return Alignment.centerLeft;
      case WrapCrossAlignment.end:
        return Alignment.centerRight;
      case WrapCrossAlignment.center:
        return Alignment.center;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = convertClassNamesToStyle(classNames);
    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final s = getStyle(screenData, constraints, style);
      return getWidget(s, constraints);
    });
  }
}
