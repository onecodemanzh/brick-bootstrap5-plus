part of brick_bootstrap5_plus_utilities;

// ignore_for_file: non_constant_identifier_names

T responsiveValue<T>(BuildContext context,
    {required T defaultValue, T? xs, T? sm, T? md, T? lg, T? xl, T? xxl}) {
  final screenData = BootstrapTheme.of(context);
  final breakPoint = screenData.currentBreakPoint;
  final breakPoints = screenData.breakPoints;

  var value = defaultValue;

  if (breakPoint.isBreakPointOrLarger(breakPoints.xs) && xs != null) {
    value = xs;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.sm) && sm != null) {
    value = sm;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.md) && md != null) {
    value = md;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.lg) && lg != null) {
    value = lg;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xl) && xl != null) {
    value = xl;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xxl) && xxl != null) {
    value = xxl;
  }

  return value;
}

T? responsiveValueOrNull<T>(
  BuildContext context, {
  required T? xs,
  required T? sm,
  required T? md,
  required T? lg,
  required T? xl,
  required T? xxl,
}) {
  final screenData = BootstrapTheme.of(context);
  final breakPoint = screenData.currentBreakPoint;
  final breakPoints = screenData.breakPoints;

  T? value;

  if (breakPoint.isBreakPointOrLarger(breakPoints.xs) && xs != null) {
    value = xs;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.sm) && sm != null) {
    value = sm;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.md) && md != null) {
    value = md;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.lg) && lg != null) {
    value = lg;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xl) && xl != null) {
    value = xl;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xxl) && xxl != null) {
    value = xxl;
  }

  return value;
}

bool isAllZero_EdgeInsets(EdgeInsets? edgeInsets) {
  if (edgeInsets == null) return true;
  return edgeInsets.left == 0 &&
      edgeInsets.top == 0 &&
      edgeInsets.right == 0 &&
      edgeInsets.bottom == 0;
}

class LabelValue {
  /// 要 显示 的 文字
  String label;

  /// 要 绑定 的 值
  dynamic value;

  /// 要 显示 的 组件
  Widget? labelWidget;

  LabelValue({
    required this.label,
    this.value,
    this.labelWidget,
  });

  /// 内部的字段 Map，用于实现动态访问
  late final Map<String, dynamic> _fields = {
    'label': label,
    'value': value,
    'labelWidget': labelWidget,
  };

  /// 通过字段名访问对应的值
  dynamic operator [](String field) => _fields[field];
}
