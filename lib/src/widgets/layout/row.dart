part of brick_bootstrap5_plus_widgets;

class BRow extends StatelessWidget {
  const BRow._({
    Key? key,
    this.style,
    required this.children,
  }) : super(key: key);

  /// 纵向对齐 [classNames] align-items-],
  ///
  ///     - [_VerticalAlignment] (s.va)
  ///
  /// 横向对齐 [classNames] justify-content- > align-self- > align-
  ///
  ///     - [_HorizontalAlignment > _SelfAlignment > _Alignment] (s.ha > s.sa > s.a)
  ///
  /// classNames g- 不支持 (不要使用)
  ///
  /// classNames offset-1 按栅格设置间隔 1 是 1个栅格宽度 (会与BCol的offset-1叠加)
  ///
  ///  ```dart
  ///   BRow(
  ///     classNames: 'offset-1 p-10 m-10',
  ///     classNames: 'align-items-start align-items-center align-items-end ' // 纵向对齐
  ///     classNames: 'justify-content-start justify-content-around justify-content-between justify-content-evenly justify-content-center justify-content-end' // 横向对齐 (由于最终使用的是Wrap组件，另外横向对齐 只支持左对齐，右对齐，居中对齐)
  ///     classNames: 'align-self-bottomCenter align-self-bottomLeft align-self-bottomRight align-self-center align-self-centerLeft align-self-centerRight align-self-topCenter align-self-topLeft align-self-topRight ' // 横向对齐
  ///     classNames: 'align-bottomCenter align-bottomLeft align-bottomRight align-center align-centerLeft align-centerRight align-topCenter align-topLeft align-topRight ' // 横向对齐
  ///     children:[
  ///        BCol(
  ///         classNames: ''
  ///         children:[],
  ///        )
  ///     ]
  ///   )
  /// ```
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
              final alignment = s.sa ?? s.a;

              return Wrap(
                alignment: s.ha ??
                    (alignment != null
                        ? alignment2WrapAlignment(alignment) ??
                            WrapAlignment.start
                        : WrapAlignment.start),
                crossAxisAlignment: va ?? WrapCrossAlignment.start,
                spacing: co ?? 0.0,
                clipBehavior: Clip.none,
                children: [
                  ...sortedChildren.map(
                    (e) => e._wrapChild(
                      (child) {
                        return m.Padding(
                          padding: EdgeInsets.only(
                            left: cg?.left ?? 0.0,
                            right: cg?.right ?? 0.0,
                            top: cg?.top ?? 0.0,
                            bottom: cg?.bottom ?? 0.0,
                          ),
                          child: child,
                        );
                      },
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
