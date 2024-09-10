part of brick_bootstrap5_plus_style;

class _Order {
  final _OrderNumber? defaultOrder;
  final _OrderNumber? xs;
  final _OrderNumber? sm;
  final _OrderNumber? md;
  final _OrderNumber? lg;
  final _OrderNumber? xl;
  final _OrderNumber? xxl;

  _Order({
    this.defaultOrder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _Order _copyWith({
    _OrderNumber? defaultOrder,
    _OrderNumber? xs,
    _OrderNumber? sm,
    _OrderNumber? md,
    _OrderNumber? lg,
    _OrderNumber? xl,
    _OrderNumber? xxl,
  }) {
    return _Order(
      defaultOrder: defaultOrder ?? this.defaultOrder,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _Order _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _Order _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(type: type, order: numerator);
  }

  _Order _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, order: numerator, breakPoint: breakPoint);
  }

  _Order _fromDefinitions({
    required String type,
    double? order,
    String? breakPoint,
  }) {
    if (order == null || order < 0) return this;

    final orderNumber = _OrderNumber._(order: order);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: orderNumber);
      case 'sm':
        return _copyWith(sm: orderNumber);
      case 'md':
        return _copyWith(md: orderNumber);
      case 'lg':
        return _copyWith(lg: orderNumber);
      case 'xl':
        return _copyWith(xl: orderNumber);
      case 'xxl':
        return _copyWith(xxl: orderNumber);
      default:
        return _copyWith(defaultOrder: orderNumber);
    }
  }
}

class _OrderNumber {
  const _OrderNumber._({
    required this.order,
  });

  final double order;
}
