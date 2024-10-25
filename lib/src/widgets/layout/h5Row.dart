part of brick_bootstrap5_plus_widgets;

<<<<<<< HEAD
class H5Row extends StatefulWidget {
  final List<Widget> children;
  final String classNames;

  ///
  ///
  ///
  /// ```dart
  ///   H5Row(
  ///     classNames: 'align-items-start align-items-center align-items-end ' // 纵向对齐
  ///     classNames: 'justify-content-start justify-content-around justify-content-between justify-content-evenly justify-content-center justify-content-end' // 横向对齐 (由于最终使用的是Wrap组件，另外横向对齐 只支持左对齐，右对齐，居中对齐)
  ///     classNames: 'align-self-bottomCenter align-self-bottomLeft align-self-bottomRight align-self-center align-self-centerLeft align-self-centerRight align-self-topCenter align-self-topLeft align-self-topRight ' // 横向对齐
  ///     classNames: 'align-bottomCenter align-bottomLeft align-bottomRight align-center align-centerLeft align-centerRight align-topCenter align-topLeft align-topRight ' // 横向对齐
  ///     classNames: 'mt-10 mb-10 bg-black ' // 只支持 bg-  背景色
  ///     classNames: 'w-150-px h-160-px maxHeight-150-px minHeight-150-px minWidth-150-px maxWidth-150-px' //
  ///     classNames: 'shadow-color-black12 shadow-blurRadius-2 shadow-offset-1,1' // 阴影
  ///     classNames: 'border-radius-4  border-color-red border-1' // 边框
  ///     classNames: 'hoverColor-green hoverBorderColor-blue hoverBorder-2 ' //
  ///     children:[],
  ///   )
  /// ```
=======

class H5Row extends StatefulWidget {
  final List<Widget> children;
  final String classNames;
>>>>>>> d706993dac5e3c9097520ca74cc84f478a7e93ce
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
<<<<<<< HEAD

      final minWidth = (s.minWidth != null && s.w != null)
          ? ((s.minWidth! > s.w!) ? s.minWidth! : s.w!)
          : s.minWidth ?? s.w ?? constraints.maxWidth;
      final maxWidth = (s.maxWidth != null && s.w != null)
          ? ((s.maxWidth! > s.w!) ? s.maxWidth! : s.w!)
          : s.maxWidth ?? s.w ?? constraints.maxWidth;
      final minHeight = (s.minHeight != null && s.h != null)
          ? ((s.minHeight! > s.h!) ? s.minHeight! : s.h!)
          : s.minHeight ?? s.h ?? constraints.minHeight;
      final maxHeight = (s.maxHeight != null && s.h != null)
          ? ((s.maxHeight! > s.h!) ? s.maxHeight! : s.h!)
          : s.maxHeight ?? s.h ?? Get.height;
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth > maxWidth ? maxWidth : minWidth,
          minHeight: minHeight > maxHeight ? maxHeight : minHeight,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
=======
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: s.maxWidth ?? constraints.maxWidth,
          minHeight: s.minHeight ?? constraints.minHeight,
          maxWidth: s.maxWidth ?? constraints.maxWidth,
          maxHeight: s.maxHeight ?? Get.height,
>>>>>>> d706993dac5e3c9097520ca74cc84f478a7e93ce
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
