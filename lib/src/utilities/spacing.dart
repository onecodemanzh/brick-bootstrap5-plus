part of brick_bootstrap5_plus_utilities;

EdgeInsets? margin(BuildContext context, String classNames) {
  final screenData = BootstrapTheme.of(context);
  final classList = classNames.trim().split(" ");

  var margin = Margin();
  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g m, mt, mb, etc.
    switch (prefix.substring(0, 1)) {
      case 'm':
        final newMargin = margin.copyWithClass(className) as Margin;
        margin = newMargin;
        break;
    }
  }

  return screenData.breakPoints.currentMargin(
    //1, //screenData.fontSize,
    1,
    screenData.currentBreakPoint,
    fromStyle: margin.defaultMargin,
    xs: margin.xs,
    sm: margin.sm,
    md: margin.md,
    lg: margin.lg,
    xl: margin.xl,
    xxl: margin.xxl,
  );
}

EdgeInsets? padding(BuildContext context, String classNames) {
  final screenData = BootstrapTheme.of(context);
  final classList = classNames.trim().split(" ");

  var padding = lib.Padding();
  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g p, pt, pb, etc.
    switch (prefix.substring(0, 1)) {
      case 'p':
        final newPadding = padding.copyWithClass(className) as lib.Padding;
        padding = newPadding;
        break;
    }
  }

  return screenData.breakPoints.currentPadding(
    //1, //screenData.fontSize,
    1,
    screenData.currentBreakPoint,
    fromStyle: padding.defaultPadding,
    xs: padding.xs,
    sm: padding.sm,
    md: padding.md,
    lg: padding.lg,
    xl: padding.xl,
    xxl: padding.xxl,
  );
}
