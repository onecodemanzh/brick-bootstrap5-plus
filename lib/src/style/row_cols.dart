part of brick_bootstrap5_plus_style;
class _RowCols {
  final _RowColsNumber? defaultOrder;
  final _RowColsNumber? xs;
  final _RowColsNumber? sm;
  final _RowColsNumber? md;
  final _RowColsNumber? lg;
  final _RowColsNumber? xl;
  final _RowColsNumber? xxl;

  _RowCols({
    this.defaultOrder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _RowCols _copyWith({
    _RowColsNumber? defaultOrder,
    _RowColsNumber? xs,
    _RowColsNumber? sm,
    _RowColsNumber? md,
    _RowColsNumber? lg,
    _RowColsNumber? xl,
    _RowColsNumber? xxl,
  }) {
    return _RowCols(
      defaultOrder: defaultOrder ?? this.defaultOrder,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _RowCols _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  _RowCols _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(type: type, cols: numerator);
  }

  _RowCols _copyWithClass4(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[2];
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, cols: numerator, breakPoint: breakPoint);
  }

  _RowCols _fromDefinitions({
    required String type,
    double? cols,
    String? breakPoint,
  }) {
    if (cols == null || cols < 0) return this;

    final colsNumber = _RowColsNumber._(cols: cols);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: colsNumber);
      case 'sm':
        return _copyWith(sm: colsNumber);
      case 'md':
        return _copyWith(md: colsNumber);
      case 'lg':
        return _copyWith(lg: colsNumber);
      case 'xl':
        return _copyWith(xl: colsNumber);
      case 'xxl':
        return _copyWith(xxl: colsNumber);
      default:
        return _copyWith(defaultOrder: colsNumber);
    }
  }
}

class _RowColsNumber {
  const _RowColsNumber._({
    required this.cols,
  });

  final double cols;
}
