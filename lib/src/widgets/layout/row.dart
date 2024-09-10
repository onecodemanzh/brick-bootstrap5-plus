part of brick_bootstrap5_plus_widgets;

class BRow extends StatelessWidget {
  const BRow._({
    Key? key,
    this.style,
    required this.children,
  }) : super(key: key);

  factory BRow({
    String? classNames,
    required List<BCol> children,
  }) {
    final style = convertClassNamesToStyle(classNames);
    return BRow._(
      style: style,
      children: children,
    );
  }

  final Style? style;
  final List<BCol> children;

  @override
  Widget build(BuildContext context) {
    final rowCols = style?.rowCols;

    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      var s = getStyle(screenData, constraints, style);
      if (s.isVisible == false) return const SizedBox.shrink();

      List<BCol> sortedChildren = children
        ..sort(
          (a, b) => a
              ._order(constraints, screenData, screenData.currentBreakPoint)
              .compareTo(
                b._order(constraints, screenData, screenData.currentBreakPoint),
              ),
        );
      final cg = s.cg;
      final co = s.co;
      final cp = s.cp;
      final cm = s.cm;
      final va = s.va;
      final ha = s.ha;

      final maxWidthHorizontalGutter =
          constraints.maxWidth + (cg?.left ?? 0.0) + (cg?.right ?? 0.0);
      final widthFactor = double.parse(
              (1 / constraints.maxWidth * maxWidthHorizontalGutter)
                  .toStringAsFixed(4)) +
          0.0001;

      return FractionallySizedBox(
        heightFactor: null,
        widthFactor: widthFactor,
        child: Transform.translate(
          offset: Offset(0.0, -(cg?.top ?? 0.0)),
          child: Container(
            padding: cp,
            margin: cm,
            child: LayoutBuilder(builder: (context, constraints) {
              final rc = screenData.breakPoints.currentRowColsWidth(
                constraints.maxWidth,
                screenData.currentBreakPoint,
                fromStyle: rowCols?.defaultOrder,
                xs: rowCols?.xs,
                sm: rowCols?.sm,
                md: rowCols?.md,
                lg: rowCols?.lg,
                xl: rowCols?.xl,
                xxl: rowCols?.xxl,
              );

              return Wrap(
                alignment: ha ?? WrapAlignment.start,
                crossAxisAlignment: va ?? WrapCrossAlignment.start,
                spacing: co ?? 0.0,
                clipBehavior: Clip.none,
                children: [
                  ...sortedChildren.map(
                    (e) => e._wrapChild(
                      (child) => m.Padding(
                        padding: EdgeInsets.only(
                          left: cg?.left ?? 0.0,
                          right: cg?.right ?? 0.0,
                          top: cg?.top ?? 0.0,
                          bottom: cg?.bottom ?? 0.0,
                        ),
                        child: child,
                      ),
                      defaultWidth: rc,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
