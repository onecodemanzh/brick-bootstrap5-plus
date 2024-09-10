part of brick_bootstrap5_plus_widgets;

class Grid extends StatelessWidget {
  const Grid._({
    Key? key,
    this.style,
    this.maxChildExpand,
    this.intrinsicHeight = true,
    this.sortChildren = false,
    required this.children,
  }) : super(key: key);

  factory Grid({
    String? classNames,
    bool sortChildren = false,
    required List<Widget> children,
  }) {
    final style = convertClassNamesToStyle(classNames);
    return Grid._(
      style: style,
      sortChildren: sortChildren,
      children: children,
    );
  }

  factory Grid.stacked({
    String? classNames,
    bool sortChildren = false,
    required double maxChildExpand,
    required List<Widget> children,
  }) {
    final style = convertClassNamesToStyle(classNames);
    return Grid._(
      style: style,
      intrinsicHeight: false,
      maxChildExpand: maxChildExpand,
      sortChildren: sortChildren,
      children: children,
    );
  }

  // ignore: library_private_types_in_public_api
  final Style? style;
  final bool intrinsicHeight;
  final double? maxChildExpand;
  final List<Widget> children;
  final bool sortChildren;

  MainAxisAlignment? _convertAlignment(WrapAlignment? alignment) {
    switch (alignment) {
      case WrapAlignment.start:
        return MainAxisAlignment.start;
      case WrapAlignment.end:
        return MainAxisAlignment.end;
      case WrapAlignment.center:
        return MainAxisAlignment.center;
      case WrapAlignment.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case WrapAlignment.spaceAround:
        return MainAxisAlignment.spaceAround;
      case WrapAlignment.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
      default:
        return null;
    }
  }

  CrossAxisAlignment? _convertCrossAlignment(WrapCrossAlignment? alignment) {
    switch (alignment) {
      case WrapCrossAlignment.start:
        return CrossAxisAlignment.start;
      case WrapCrossAlignment.end:
        return CrossAxisAlignment.end;
      case WrapCrossAlignment.center:
        return CrossAxisAlignment.center;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQueryBuilder(
      builder: (context, constraints, screenData) {
        var s = getStyle(screenData, constraints, style);
        if (s.isVisible == false) return const SizedBox.shrink();

        List<Widget> sortedChildren;
        if (sortChildren) {
          sortedChildren = children
            ..sort(
              (a, b) {
                final aOrder = a is _OrderWidget
                    ? a._order(
                        constraints, screenData, screenData.currentBreakPoint)
                    : 0;
                var bOrder = b is _OrderWidget
                    ? b._order(
                        constraints, screenData, screenData.currentBreakPoint)
                    : 0;
                return aOrder.compareTo(bOrder);
              },
            );
        } else {
          sortedChildren = children;
        }
        final va = s.va;
        final cm = s.cm;
        final cp = s.cp;
        final rc = s.rc;
        final ha = s.ha;
        final cg = s.cg;
        final hp = (cg?.left ?? 0.0) + (cg?.right ?? 0.0);

        return Container(
          margin: cm,
          padding: cp,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...sortedChildren.slices(rc!.toInt()).map<Widget>(
                    (slice) {
                      if (rc == 1) return slice.first;

                      final maxWidth =
                          (constraints.maxWidth - (hp * (rc - 1))) / rc;

                      final child = Row(
                        mainAxisAlignment:
                            _convertAlignment(ha) ?? MainAxisAlignment.start,
                        crossAxisAlignment: _convertCrossAlignment(va) ??
                            CrossAxisAlignment.stretch,
                        children: [
                          ...slice
                              .map<Widget>(
                                (e) => ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: maxWidth,
                                  ),
                                  child: e,
                                ),
                              )
                              .intersperse(
                                SizedBox(
                                  width: hp,
                                ),
                              ),
                        ],
                      );

                      if (!intrinsicHeight) {
                        return ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: maxChildExpand!),
                          child: child,
                        );
                      }

                      return IntrinsicHeight(
                        child: child,
                      );
                    },
                  ).intersperse(
                    SizedBox(
                      height: (cg?.top ?? 0.0) + (cg?.bottom ?? 0.0),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
