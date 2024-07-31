part of brick_bootstrap5_plus_style;

class _Style {
  final _Margin? margin;
  final _Padding? padding;
  final _Gutter? gutter;
  final _Offset? offset;
  final _Display? display;
  final _RowCols? rowCols;
  final _Size? size;
  final _Color? color;
  final _Color? bgColor;
  final _Width? width;
  final _Height? height;
  final _Order? order;
  final _SelfAlignment? selfAlignment;
  final _Alignment? alignment;
  final _VerticalAlignment? verticalAlignment;
  final _HorizontalAlignment? horizontalAlignment;
  final _FontWeight? fontWeight;
  final _FontSize? fontSize;
  final _Border? border;
  final _BorderColor? borderColor;
  final _BorderRadius? borderRadius;

  _Style({
    this.margin,
    this.padding,
    this.gutter,
    this.offset,
    this.display,
    this.rowCols,
    this.size,
    this.color,
    this.bgColor,
    this.width,
    this.height,
    this.order,
    this.selfAlignment,
    this.alignment,
    this.verticalAlignment,
    this.horizontalAlignment,
    this.fontWeight,
    this.fontSize,
    this.border,
    this.borderColor,
    this.borderRadius,
  });

  _Style copyWith({
    _Margin? margin,
    _Padding? padding,
    _Gutter? gutter,
    _Offset? offset,
    _Display? display,
    _RowCols? rowCols,
    _Size? size,
    _Color? color,
    _Color? bgColor,
    _Order? order,
    _Width? width,
    _Height? height,
    _SelfAlignment? selfAlignment,
    _Alignment? alignment,
    _VerticalAlignment? verticalAlignment,
    _HorizontalAlignment? horizontalAlignment,
    _FontWeight? fontWeight,
    _FontSize? fontSize,
    _Border? border,
    _BorderColor? borderColor,
    _BorderRadius? borderRadius,
  }) =>
      _Style(
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        gutter: gutter ?? this.gutter,
        offset: offset ?? this.offset,
        display: display ?? this.display,
        rowCols: rowCols ?? this.rowCols,
        size: size ?? this.size,
        color: color ?? this.color,
        width: width ?? this.width,
        height: height ?? this.height,
        bgColor: bgColor ?? this.bgColor,
        order: order ?? this.order,
        selfAlignment: selfAlignment ?? this.selfAlignment,
        alignment: alignment ?? this.alignment,
        verticalAlignment: verticalAlignment ?? this.verticalAlignment,
        horizontalAlignment: horizontalAlignment ?? this.horizontalAlignment,
        fontWeight: fontWeight ?? this.fontWeight,
        fontSize: fontSize ?? this.fontSize,
        border: border ?? this.border,
        borderColor: borderColor ?? this.borderColor,
        borderRadius: borderRadius ?? this.borderRadius,
      );
}

_Style? convertClassNamesToStyle(String? classNames) {
  if (classNames == null) return null;

  final classList = classNames.trim().split(" ");
  var style = _Style();

  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g m, mt, mb, etc.
    switch (prefix.substring(0, 1)) {
      case 'a':
        if (className.contains('align-items')) {
          var verticalAlignment =
              style.verticalAlignment ?? _VerticalAlignment();
          var newVerticalAlignment =
              verticalAlignment._copyWithClass(className);
          style = style.copyWith(verticalAlignment: newVerticalAlignment);
        } else if (className.contains('align-self')) {
          var selfAlignment = style.selfAlignment ?? _SelfAlignment();
          var newSelfAlignment = selfAlignment._copyWithClass(className);
          style = style.copyWith(selfAlignment: newSelfAlignment);
        } else if (className.contains('align')) {
          var alignment = style.alignment ?? _Alignment();
          var newAlignment = alignment._copyWithClass(className);
          style = style.copyWith(alignment: newAlignment);
        }

        break;
      case 'f':
        if (className.contains('font-weight')) {
          var fontWeight = style.fontWeight ?? _FontWeight();
          var newFontWeight = fontWeight._copyWithClass(className);
          style = style.copyWith(fontWeight: newFontWeight);
        }

        if (className.contains('font-size')) {
          var fontSize = style.fontSize ?? _FontSize();
          var newFontSize = fontSize._copyWithClass(className);
          style = style.copyWith(fontSize: newFontSize);
        }
        break;
      case 'm':
        var margin = style.margin ?? _Margin();
        final newMargin = margin._copyWithClass(className) as _Margin;
        style = style.copyWith(margin: newMargin);
        break;
      case 'p':
        var padding = style.padding ?? _Padding();
        final newPadding = padding._copyWithClass(className) as _Padding;
        style = style.copyWith(padding: newPadding);
        break;
      case 'g':
        var gutter = style.gutter ?? _Gutter();
        final newGutter = gutter._copyWithClass(className) as _Gutter;
        style = style.copyWith(gutter: newGutter);
        break;
      case 'c':
        if (className.contains('color')) {
          var color = style.color ?? _Color();
          var newColor = color._copyWithClass(className);
          style = style.copyWith(color: newColor);
        } else {
          var size = style.size ?? _Size();
          final newSize = size._copyWithClass(className);
          style = style.copyWith(size: newSize);
        }
        break;
      case 'o':
        // o can be order or offset
        if (prefix == 'offset') {
          var offset = style.offset ?? _Offset();
          final newOffset = offset._copyWithClass(className);
          style = style.copyWith(offset: newOffset);
          break;
        }

        if (prefix == 'order') {
          var order = style.order ?? _Order();
          final newOrder = order._copyWithClass(className);
          style = style.copyWith(order: newOrder);
          break;
        }
        break;
      case 'd':
        var display = style.display ?? _Display();
        final newDisplay = display._copyWithClass(className);
        style = style.copyWith(display: newDisplay);
        break;
      case 'r':
        var rowCols = style.rowCols ?? _RowCols();
        final newRowCols = rowCols._copyWithClass(className);
        style = style.copyWith(rowCols: newRowCols);
        break;
      case 'j':
        if (className.contains('justify-content')) {
          var horizontalAlignment =
              style.horizontalAlignment ?? _HorizontalAlignment();
          var newHorizontalAlignment =
              horizontalAlignment._copyWithClass(className);
          style = style.copyWith(horizontalAlignment: newHorizontalAlignment);
        }
        break;
      case 'w':
        var width = style.width ?? _Width();
        final newWidth = width._copyWithClass(className);
        style = style.copyWith(width: newWidth);
        break;
      case 'h':
        var height = style.height ?? _Height();
        final newHeight = height._copyWithClass(className);
        style = style.copyWith(height: newHeight);
        break;
      case 'b':
        if (className.contains('bg')) {
          var color = style.bgColor ?? _Color();
          var newColor = color._copyWithClass(className);
          style = style.copyWith(bgColor: newColor);
        } else if (className.contains('border-color')) {
          var color = style.borderColor ?? _BorderColor();
          var newColor = color._copyWithClass(className);
          style = style.copyWith(borderColor: newColor);
        } else if (className.contains('border-radius')) {
          var radius = style.borderRadius ?? _BorderRadius();
          var newRadius = radius._copyWithClass(className);
          style = style.copyWith(borderRadius: newRadius);
        } else if (className.contains('border-')) {
          var border = style.border ?? _Border();
          var newBorder = border._copyWithClass(className);
          style = style.copyWith(border: newBorder);
        }
        break;
    }
  }

  return style;
}

class Style extends _Style {}
