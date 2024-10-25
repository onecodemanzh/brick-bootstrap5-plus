part of brick_bootstrap5_plus_widgets;

abstract class _OrderWidget extends StatelessWidget {
  const _OrderWidget({super.key});

  Style? get style;

  double _order(BoxConstraints constraints, ScreenData screenData,
      BreakPoint currentBreakPoint) {
    final order = style?.order;
    return screenData.breakPoints.currentOrder(
      constraints.maxWidth,
      currentBreakPoint,
      fromStyle: order?.defaultOrder,
      xs: order?.xs,
      sm: order?.sm,
      md: order?.md,
      lg: order?.lg,
      xl: order?.xl,
      xxl: order?.xxl,
    );
  }
}
