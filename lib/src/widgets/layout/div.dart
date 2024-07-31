part of brick_bootstrap5_plus_widgets;

class Div extends StatelessWidget {
  Div({
    super.key,
    required this.classNames,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment = Alignment.topLeft,
    this.bgColor,
    this.decoration,
    required this.child,
  });

  Decoration? decoration;

  final String classNames;
  final double? width;
  final double? height;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? bgColor;

  static BContainer container() {
    return BContainer();
  }

  static BContainer containerFluid() {
    return BContainer.fluid();
  }

  @override
  Widget build(BuildContext context) {
    final style = convertClassNamesToStyle(classNames);
    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final s = getStyle(screenData, constraints, style);

      return Container(
        width: width ?? s.w ?? constraints.maxWidth,
        height: height ?? s.h,
        decoration: decoration ?? getBoxDecorationByStyle(s),
        margin: margin ?? s.cm,
        padding: padding ?? s.cp,
        color: bgColor ?? s.bg,
        alignment: alignment ?? s.a ?? s.sa,
        constraints: constraints,
        child: child,
      );
    });
  }
}
