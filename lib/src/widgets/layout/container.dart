part of brick_bootstrap5_plus_widgets;

enum _ContainerBreakPoint { sm, md, lg, xl, xxl, fluid }

@Deprecated('不建议使用, 建议使用 H5Row')
class BContainer extends StatelessWidget {
  const BContainer._({
    Key? key,
    this.child,
    this.containerBreakPoint,
    // this.alignment = Alignment.center,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  factory BContainer({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        child: child,
      );

  factory BContainer.sm({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.sm,
        child: child,
      );

  factory BContainer.md({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.md,
        child: child,
      );

  factory BContainer.lg({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.lg,
        child: child,
      );

  factory BContainer.xl({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.xl,
        child: child,
      );

  factory BContainer.xxl({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.xxl,
        child: child,
      );

  factory BContainer.fluid({
    Key? key,
    Alignment alignment = Alignment.centerLeft,
    Widget? child,
  }) =>
      BContainer._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.fluid,
        child: child,
      );

  final Widget? child;
  // ignore: library_private_types_in_public_api
  final _ContainerBreakPoint? containerBreakPoint;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return MediaQueryBuilder(builder: (context, constraints, data) {
      final breakPoint = data.currentBreakPoint;
      double maxWidth = double.infinity;

      if (breakPoint.isBreakPointOrLarger(data.breakPoints.xs)) {
        maxWidth = data.containerBreakPoints.xs;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.sm)) {
        maxWidth = data.containerBreakPoints.sm;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.md)) {
        maxWidth = data.containerBreakPoints.md;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.lg)) {
        maxWidth = data.containerBreakPoints.lg;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.xl)) {
        maxWidth = data.containerBreakPoints.xl;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.xxl)) {
        maxWidth = data.containerBreakPoints.xxl;
      }

      switch (containerBreakPoint) {
        case _ContainerBreakPoint.sm:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.xs)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.md:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.sm)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.lg:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.md)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.xl:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.lg)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.xxl:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.xl)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.fluid:
          maxWidth = double.infinity;
          break;
        case null:
          break;
      }

      return Align(
        alignment: alignment,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: child,
        ),
      );
    });
  }
}
