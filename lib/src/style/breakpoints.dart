// ignore_for_file: library_private_types_in_public_api

part of brick_bootstrap5_plus_style;

class BootstrapBreakPoints {
  static const BreakPoint xs = BreakPoint(minWidth: 0, maxWidth: 576);
  static const BreakPoint sm = BreakPoint(minWidth: 576, maxWidth: 768);
  static const BreakPoint md = BreakPoint(minWidth: 768, maxWidth: 992);
  static const BreakPoint lg = BreakPoint(minWidth: 992, maxWidth: 1200);
  static const BreakPoint xl = BreakPoint(minWidth: 1200, maxWidth: 1400);
  static const BreakPoint xxl =
      BreakPoint(minWidth: 1400, maxWidth: double.infinity);
}

class _BootstrapContainerBreakPoints {
  static const double xs = double.infinity;
  static const double sm = 540;
  static const double md = 720;
  static const double lg = 960;
  static const double xl = 1140;
  static const double xxl = 1320;
}

class ContainerBreakPoints {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  const ContainerBreakPoints({
    this.xs = _BootstrapContainerBreakPoints.xs,
    this.sm = _BootstrapContainerBreakPoints.sm,
    this.md = _BootstrapContainerBreakPoints.md,
    this.lg = _BootstrapContainerBreakPoints.lg,
    this.xl = _BootstrapContainerBreakPoints.xl,
    this.xxl = _BootstrapContainerBreakPoints.xxl,
  });
}

class BreakPoints {
  final BreakPoint xs;
  final BreakPoint sm;
  final BreakPoint md;
  final BreakPoint lg;
  final BreakPoint xl;
  final BreakPoint xxl;

  const BreakPoints({
    this.xs = BootstrapBreakPoints.xs,
    this.sm = BootstrapBreakPoints.sm,
    this.md = BootstrapBreakPoints.md,
    this.lg = BootstrapBreakPoints.lg,
    this.xl = BootstrapBreakPoints.xl,
    this.xxl = BootstrapBreakPoints.xxl,
  });

  BreakPoint getBreakPointForWidth(double width) => _values.firstWhere(
      (element) => element.minWidth < width && element.maxWidth >= width);

  double? _currentSizing(
    double maxWidth,
    BreakPoint breakPoint, {
    _Sizing? fromStyle,
    _Sizing? xs,
    _Sizing? sm,
    _Sizing? md,
    _Sizing? lg,
    _Sizing? xl,
    _Sizing? xxl,
    double? defaultSize,
  }) {
    double? width = defaultSize;

    if (fromStyle != null) {
      width = maxWidth * fromStyle.numerator / 24;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      width = maxWidth * xs.numerator / 24;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      width = maxWidth * sm.numerator / 24;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      width = maxWidth * md.numerator / 24;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      width = maxWidth * lg.numerator / 24;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      width = maxWidth * xl.numerator / 24;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      width = maxWidth * xxl.numerator / 24;
    }

    return width;
  }

  double? _currentWidth(
    double maxWidth,
    BreakPoint breakPoint, {
    _ColSize? fromStyle,
    _ColSize? xs,
    _ColSize? sm,
    _ColSize? md,
    _ColSize? lg,
    _ColSize? xl,
    _ColSize? xxl,
    double? defaultWidth = double.infinity,
  }) =>
      _currentSizing(
        maxWidth,
        breakPoint,
        fromStyle: fromStyle,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
        defaultSize: defaultWidth,
      );

  double? _currentOffset(
    double maxWidth,
    BreakPoint breakPoint, {
    _ColOffset? fromStyle,
    _ColOffset? xs,
    _ColOffset? sm,
    _ColOffset? md,
    _ColOffset? lg,
    _ColOffset? xl,
    _ColOffset? xxl,
  }) =>
      _currentSizing(maxWidth, breakPoint,
          fromStyle: fromStyle,
          xs: xs,
          sm: sm,
          md: md,
          lg: lg,
          xl: xl,
          xxl: xxl);

  EdgeInsets? _currentSpacing(
    double spacer,
    BreakPoint breakPoint, {
    _Spacing? fromStyle,
    _Spacing? xs,
    _Spacing? sm,
    _Spacing? md,
    _Spacing? lg,
    _Spacing? xl,
    _Spacing? xxl,
    double multiplier = 1.0,
  }) {
    EdgeInsets spacing = const EdgeInsets.only();

    if (fromStyle != null) {
      spacing = EdgeInsets.only(
        left: (fromStyle.left ?? spacing.left),
        right: (fromStyle.right ?? spacing.right),
        bottom: (fromStyle.bottom ?? spacing.bottom),
        top: (fromStyle.top ?? spacing.top),
      );
    }

    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      spacing = EdgeInsets.only(
        left: (xs.left ?? spacing.left),
        right: (xs.right ?? spacing.right),
        bottom: (xs.bottom ?? spacing.bottom),
        top: (xs.top ?? spacing.top),
      );
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      spacing = EdgeInsets.only(
        left: (sm.left ?? spacing.left),
        right: (sm.right ?? spacing.right),
        bottom: (sm.bottom ?? spacing.bottom),
        top: (sm.top ?? spacing.top),
      );
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      spacing = EdgeInsets.only(
        left: (md.left ?? spacing.left),
        right: (md.right ?? spacing.right),
        bottom: (md.bottom ?? spacing.bottom),
        top: (md.top ?? spacing.top),
      );
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      spacing = EdgeInsets.only(
        left: (lg.left ?? spacing.left),
        right: (lg.right ?? spacing.right),
        bottom: (lg.bottom ?? spacing.bottom),
        top: (lg.top ?? spacing.top),
      );
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      spacing = EdgeInsets.only(
        left: (xl.left ?? spacing.left),
        right: (xl.right ?? spacing.right),
        bottom: (xl.bottom ?? spacing.bottom),
        top: (xl.top ?? spacing.top),
      );
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      spacing = EdgeInsets.only(
        left: (xxl.left ?? spacing.left),
        right: (xxl.right ?? spacing.right),
        bottom: (xxl.bottom ?? spacing.bottom),
        top: (xxl.top ?? spacing.top),
      );
    }

    return EdgeInsets.only(
      left: spacing.left * spacer * multiplier,
      right: spacing.right * spacer * multiplier,
      bottom: spacing.bottom * spacer * multiplier,
      top: spacing.top * spacer * multiplier,
    );
  }

  EdgeInsets? _currentMargin(
    double spacer,
    BreakPoint breakPoint, {
    _ContentMargin? fromStyle,
    _ContentMargin? xs,
    _ContentMargin? sm,
    _ContentMargin? md,
    _ContentMargin? lg,
    _ContentMargin? xl,
    _ContentMargin? xxl,
  }) =>
      _currentSpacing(
        spacer,
        breakPoint,
        fromStyle: fromStyle,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      );

  EdgeInsets? currentMargin(
    double spacer,
    BreakPoint breakPoint, {
    _ContentMargin? fromStyle,
    _ContentMargin? xs,
    _ContentMargin? sm,
    _ContentMargin? md,
    _ContentMargin? lg,
    _ContentMargin? xl,
    _ContentMargin? xxl,
  }) =>
      _currentMargin(
        spacer,
        breakPoint,
        fromStyle: fromStyle,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      );
  EdgeInsets? _currentPadding(
    double spacer,
    BreakPoint breakPoint, {
    _ContentPadding? fromStyle,
    _ContentPadding? xs,
    _ContentPadding? sm,
    _ContentPadding? md,
    _ContentPadding? lg,
    _ContentPadding? xl,
    _ContentPadding? xxl,
  }) =>
      _currentSpacing(
        spacer,
        breakPoint,
        fromStyle: fromStyle,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      );
  EdgeInsets? currentPadding(
    double spacer,
    BreakPoint breakPoint, {
    _ContentPadding? fromStyle,
    _ContentPadding? xs,
    _ContentPadding? sm,
    _ContentPadding? md,
    _ContentPadding? lg,
    _ContentPadding? xl,
    _ContentPadding? xxl,
  }) =>
      _currentPadding(
        spacer,
        breakPoint,
        fromStyle: fromStyle,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      );
  EdgeInsets? _currentGutter(
    double spacer,
    BreakPoint breakPoint, {
    Gutter? fromStyle,
    Gutter? xs,
    Gutter? sm,
    Gutter? md,
    Gutter? lg,
    Gutter? xl,
    Gutter? xxl,
  }) =>
      _currentSpacing(
        spacer,
        breakPoint,
        fromStyle: fromStyle,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
        multiplier: 0.5,
      );

  bool _currentDisplay(
    BreakPoint breakPoint, {
    _ContentDisplay? fromStyle,
    _ContentDisplay? xs,
    _ContentDisplay? sm,
    _ContentDisplay? md,
    _ContentDisplay? lg,
    _ContentDisplay? xl,
    _ContentDisplay? xxl,
  }) {
    bool visible = true;

    if (fromStyle != null) {
      visible = fromStyle.visible;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      visible = xs.visible;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      visible = sm.visible;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      visible = md.visible;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      visible = lg.visible;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      visible = xl.visible;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      visible = xxl.visible;
    }

    return visible;
  }

  double currentOrder(
    double maxWidth,
    BreakPoint breakPoint, {
    _OrderNumber? fromStyle,
    _OrderNumber? xs,
    _OrderNumber? sm,
    _OrderNumber? md,
    _OrderNumber? lg,
    _OrderNumber? xl,
    _OrderNumber? xxl,
  }) {
    double? order;

    if (fromStyle != null) {
      order = fromStyle.order;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      order = xs.order;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      order = sm.order;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      order = md.order;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      order = lg.order;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      order = xl.order;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      order = xxl.order;
    }

    return order ?? 0;
  }

  double? currentRowColsWidth(
    double maxWidth,
    BreakPoint breakPoint, {
    _RowColsNumber? fromStyle,
    _RowColsNumber? xs,
    _RowColsNumber? sm,
    _RowColsNumber? md,
    _RowColsNumber? lg,
    _RowColsNumber? xl,
    _RowColsNumber? xxl,
    double? defaultSize,
  }) {
    double? width = defaultSize;

    if (fromStyle != null) {
      width = maxWidth / fromStyle.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      width = maxWidth / xs.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      width = maxWidth / sm.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      width = maxWidth / md.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      width = maxWidth / lg.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      width = maxWidth / xl.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      width = maxWidth / xxl.cols;
    }

    return width;
  }

  double _currentRowCols(
    BreakPoint breakPoint, {
    _RowColsNumber? fromStyle,
    _RowColsNumber? xs,
    _RowColsNumber? sm,
    _RowColsNumber? md,
    _RowColsNumber? lg,
    _RowColsNumber? xl,
    _RowColsNumber? xxl,
    double defaultCount = 1,
  }) {
    double count = defaultCount;

    if (fromStyle != null) {
      count = fromStyle.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      count = xs.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      count = sm.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      count = md.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      count = lg.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      count = xl.cols;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      count = xxl.cols;
    }

    return count;
  }

  WrapCrossAlignment? _currentVerticalAlignment(
    BreakPoint breakPoint, {
    WrapCrossAlignment? fromStyle,
    WrapCrossAlignment? xs,
    WrapCrossAlignment? sm,
    WrapCrossAlignment? md,
    WrapCrossAlignment? lg,
    WrapCrossAlignment? xl,
    WrapCrossAlignment? xxl,
  }) {
    WrapCrossAlignment? alignment;

    if (fromStyle != null) {
      alignment = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      alignment = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      alignment = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      alignment = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      alignment = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      alignment = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      alignment = xxl;
    }

    return alignment;
  }

  WrapAlignment? _currentHorizontalAlignment(
    BreakPoint breakPoint, {
    WrapAlignment? fromStyle,
    WrapAlignment? xs,
    WrapAlignment? sm,
    WrapAlignment? md,
    WrapAlignment? lg,
    WrapAlignment? xl,
    WrapAlignment? xxl,
  }) {
    WrapAlignment? alignment;

    if (fromStyle != null) {
      alignment = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      alignment = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      alignment = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      alignment = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      alignment = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      alignment = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      alignment = xxl;
    }

    return alignment;
  }

  Alignment? _currentSelfAlignment(
    BreakPoint breakPoint, {
    Alignment? fromStyle,
    Alignment? xs,
    Alignment? sm,
    Alignment? md,
    Alignment? lg,
    Alignment? xl,
    Alignment? xxl,
  }) {
    Alignment? alignment;

    if (fromStyle != null) {
      alignment = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      alignment = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      alignment = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      alignment = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      alignment = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      alignment = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      alignment = xxl;
    }

    return alignment;
  }

  Alignment? _currentAlignment(
    BreakPoint breakPoint, {
    Alignment? fromStyle,
    Alignment? xs,
    Alignment? sm,
    Alignment? md,
    Alignment? lg,
    Alignment? xl,
    Alignment? xxl,
  }) {
    Alignment? alignment;
    if (fromStyle != null) {
      alignment = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      alignment = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      alignment = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      alignment = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      alignment = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      alignment = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      alignment = xxl;
    }

    return alignment;
  }

  /// 宽度 （百分比或px）
  double? _currentWidth1(
    double maxWidth,
    BreakPoint breakPoint, {
    double? fromStyle,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    String? unit,
  }) {
    double? width;
    if (fromStyle != null) {
      width = unit == 'px' ? fromStyle : maxWidth / 100 * fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      width = unit == 'px' ? xs : maxWidth / 100 * xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      width = unit == 'px' ? sm : maxWidth / 100 * sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      width = unit == 'px' ? md : maxWidth / 100 * md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      width = unit == 'px' ? lg : maxWidth / 100 * lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      width = unit == 'px' ? xl : maxWidth / 100 * xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      width = unit == 'px' ? xxl : maxWidth / 100 * xxl;
    }

    return width;
  }

  /// 高度 （百分比或px）
  double? _currentHeight1(
    double maxHeight,
    BreakPoint breakPoint, {
    double? fromStyle,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    String? unit,
  }) {
    double? width;
    if (fromStyle != null) {
      width = unit == 'px' ? fromStyle : maxHeight / fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      width = unit == 'px' ? xs : maxHeight / xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      width = unit == 'px' ? sm : maxHeight / sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      width = unit == 'px' ? md : maxHeight / md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      width = unit == 'px' ? lg : maxHeight / lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      width = unit == 'px' ? xl : maxHeight / xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      width = unit == 'px' ? xxl : maxHeight / xxl;
    }

    return width;
  }

  FontWeight? _currentFontWeight(
    BreakPoint breakPoint, {
    FontWeight? fromStyle,
    FontWeight? xs,
    FontWeight? sm,
    FontWeight? md,
    FontWeight? lg,
    FontWeight? xl,
    FontWeight? xxl,
  }) {
    FontWeight? fontWeight;

    if (fromStyle != null) {
      fontWeight = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      fontWeight = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      fontWeight = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      fontWeight = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      fontWeight = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      fontWeight = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      fontWeight = xxl;
    }

    return fontWeight;
  }

  double? _currentFontSize(
    BreakPoint breakPoint, {
    double? fromStyle,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    double? fontSize;

    if (fromStyle != null) {
      fontSize = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      fontSize = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      fontSize = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      fontSize = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      fontSize = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      fontSize = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      fontSize = xxl;
    }

    return fontSize;
  }

  Color? _currentColor(
    BreakPoint breakPoint, {
    Color? fromStyle,
    Color? xs,
    Color? sm,
    Color? md,
    Color? lg,
    Color? xl,
    Color? xxl,
  }) {
    Color? color;

    if (fromStyle != null) {
      color = fromStyle;
    }
    if (breakPoint.isBreakPointOrLarger(this.xs) && xs != null) {
      color = xs;
    }
    if (breakPoint.isBreakPointOrLarger(this.sm) && sm != null) {
      color = sm;
    }
    if (breakPoint.isBreakPointOrLarger(this.md) && md != null) {
      color = md;
    }
    if (breakPoint.isBreakPointOrLarger(this.lg) && lg != null) {
      color = lg;
    }
    if (breakPoint.isBreakPointOrLarger(this.xl) && xl != null) {
      color = xl;
    }
    if (breakPoint.isBreakPointOrLarger(this.xxl) && xxl != null) {
      color = xxl;
    }
    // console.debugger();

    return color;
  }

  Color? _currentBgColor(
    BreakPoint breakPoint, {
    Color? fromStyle,
    Color? xs,
    Color? sm,
    Color? md,
    Color? lg,
    Color? xl,
    Color? xxl,
  }) {
    return _currentColor(
      breakPoint,
      fromStyle: fromStyle,
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
    );
  }

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

  List<BreakPoint> get _values => [xs, sm, md, lg, xl, xxl];
}

class BreakPoint {
  final double minWidth;
  final double maxWidth;

  const BreakPoint({required this.minWidth, required this.maxWidth});

  bool isBreakPointOrSmaller(BreakPoint breakPoint) {
    return maxWidth <= breakPoint.maxWidth;
  }

  bool isBreakPointOrLarger(BreakPoint breakPoint) {
    return minWidth >= breakPoint.minWidth;
  }
}

final breakPoints = [
  'xs',
  'sm',
  'md',
  'lg',
  'xl',
  'xxl',
];
