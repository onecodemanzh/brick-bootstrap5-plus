part of brick_bootstrap5_plus_widgets;


class H5Row extends StatefulWidget {
  final List<Widget> children;
  final String classNames;
  H5Row({
    super.key,
    required this.children,
    this.classNames = '',
  });

  @override
  State<H5Row> createState() => _H5RowState();
}

class _H5RowState extends State<H5Row> {
  GlobalKey key = GlobalKey();
  final _isHover = false.obs;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final styles = convertClassNamesToStyle(widget.classNames);
      final s = getStyle(screenData, constraints, styles);
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: s.maxWidth ?? constraints.maxWidth,
          minHeight: s.minHeight ?? constraints.minHeight,
          maxWidth: s.maxWidth ?? constraints.maxWidth,
          maxHeight: s.maxHeight ?? Get.height,
        ),
        child: Padding(
          padding: s.cm ?? EdgeInsets.all(0),
          child: MouseRegion(
            onHover: (value) {
              _isHover.value = true;
            },
            onExit: (value) {
              _isHover.value = false;
            },
            child: Obx(
              () => DecoratedBox(
                decoration:
                    getBoxDecorationByStyle(s, _isHover) ?? BoxDecoration(),
                child: Padding(
                  padding: s.cp ?? EdgeInsets.all(0),
                  child: Wrap(
                    /// x 轴 左右 对齐
                    alignment: getWrapAlignment(s) ?? WrapAlignment.start,

                    /// y 轴 上下 对齐
                    runAlignment: WrapAlignment.center,

                    /// x 轴 垂直 对齐 （等于h5 verticalAlign）
                    crossAxisAlignment:
                        getWrapCrossAlignment(s) ?? WrapCrossAlignment.center,

                    /// down 正常显示; up 反转显示
                    verticalDirection: VerticalDirection.down,
                    key: key,
                    clipBehavior: Clip.none,
                    children: widget.children,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
