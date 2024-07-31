part of brick_bootstrap5_plus_layout;

class BootstrapTheme extends StatelessWidget {
  const BootstrapTheme({
    Key? key,
    required this.data,
    required this.builder,
  }) : super(key: key);

  final ScreenData data;
  final Widget Function(BuildContext context) builder;

  static ScreenData of(BuildContext context) {
    final _InheritedBootstrapTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedBootstrapTheme>();
    final ScreenData data =
        inheritedTheme?.bootstrapTheme.data ?? ScreenData.fallBack(context);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedBootstrapTheme(
      bootstrapTheme: this,
      child: Builder(
        builder: (ctx) => builder(ctx),
      ),
    );
  }
}

class _InheritedBootstrapTheme extends InheritedWidget {
  const _InheritedBootstrapTheme({
    Key? key,
    required this.bootstrapTheme,
    required Widget child,
  }) : super(key: key, child: child);

  final BootstrapTheme bootstrapTheme;

  Widget wrap(BuildContext context, Widget child) {
    return BootstrapTheme(
        data: bootstrapTheme.data, builder: (_) => super.child);
  }

  @override
  bool updateShouldNotify(_InheritedBootstrapTheme old) =>
      bootstrapTheme.data != old.bootstrapTheme.data;
}

class ScreenData {
  final BreakPoints breakPoints;
  final ContainerBreakPoints containerBreakPoints;
  final BreakPoint currentBreakPoint;
  final Size screenSize;
  final t.Typography _typography;
  final double fontSize;
  final BColors colors;

  static const double defaultFontSize = 12.0;

  static ScreenData fallBack(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var breakPoints = const BreakPoints();
    final BreakPoint b;
    if (width > BootstrapBreakPoints.xxl.minWidth) {
      b = BootstrapBreakPoints.xxl;
    } else if (width > BootstrapBreakPoints.xl.minWidth) {
      b = BootstrapBreakPoints.xl;
    } else if (width > BootstrapBreakPoints.lg.minWidth) {
      b = BootstrapBreakPoints.lg;
    } else if (width > BootstrapBreakPoints.md.minWidth) {
      b = BootstrapBreakPoints.md;
    } else if (width > BootstrapBreakPoints.sm.minWidth) {
      b = BootstrapBreakPoints.sm;
    } else {
      b = BootstrapBreakPoints.xs;
    }
    return ScreenData(
      breakPoints: breakPoints,
      currentBreakPoint: b,
      screenSize: Size.fromWidth(
        b.maxWidth,
      ),
      fontSize: defaultFontSize,
      containerBreakPoints: const ContainerBreakPoints(),
      typography: t.Typography(),
      colors: BColors(),
    );
  }

  ThemeData toTheme({ThemeData? theme}) => (theme ?? ThemeData()).copyWith(
        textTheme: TextTheme(
          headlineLarge: textStyles.h1.merge(theme?.textTheme.headlineLarge),
          headlineMedium: textStyles.h3.merge(theme?.textTheme.headlineMedium),
          headlineSmall: textStyles.h5.merge(theme?.textTheme.headlineSmall),
          displayLarge:
              textStyles.display1.merge(theme?.textTheme.displayLarge),
          displayMedium:
              textStyles.display3.merge(theme?.textTheme.displayMedium),
          displaySmall:
              textStyles.display5.merge(theme?.textTheme.displaySmall),
          bodyLarge: textStyles.lead.merge(theme?.textTheme.bodyLarge),
          bodyMedium: textStyles.paragraph.merge(theme?.textTheme.bodyMedium),
          bodySmall: textStyles.small.merge(theme?.textTheme.bodySmall),
        ),
      );

  t.TextStyles get textStyles => t.TextStyles(
        fontSize: fontSize,
        screenSize: screenSize,
        breakPoint: currentBreakPoint,
        breakPoints: breakPoints,
        typography: _typography,
      );

  ScreenData({
    required this.breakPoints,
    required this.currentBreakPoint,
    required this.screenSize,
    required this.fontSize,
    required this.containerBreakPoints,
    required t.Typography typography,
    required this.colors,
  }) : _typography = typography;
}
