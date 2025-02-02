library brick_bootstrap5_plus_style;

// 因为暂时只用到这个
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../layout/layout.dart';
import '../utilities/utilities.dart';

part 'breakpoints.dart';
part 'vertical_alignment.dart';
part 'self_alignment.dart';
part 'alignment.dart';
part 'horizontal_alignment.dart';
part 'col_offset.dart';
part 'col_size.dart';
part 'gutter.dart';
part 'margin.dart';
part 'order.dart';
part 'padding.dart';
part 'display.dart';
part 'converter.dart';
part 'row_cols.dart';
part 'color.dart';
part 'width.dart';
part 'height.dart';
part 'border.dart';
part 'font_weight.dart';
part 'font_size.dart';
// part 'opacity.dart';
part 'fit.dart';
part 'stack_fit.dart';
part 'blur.dart';
part 'scale.dart';
part 'shadow.dart';

abstract class _Sizing {
  double get numerator;
}

abstract class _Spacing {
  double? get left;
  double? get right;
  double? get top;
  double? get bottom;
}

abstract class _ResponsiveSpacing {
  _Spacing? get xs;
  _Spacing? get sm;
  _Spacing? get md;
  _Spacing? get lg;
  _Spacing? get xl;
  _Spacing? get xxl;

  double? _sizeFromNumerator(double? numerator) {
    if (numerator is! num) {
      return 0;
    }
    return numerator as double;
    // switch (numerator) {
    //   case 0:
    //     return 0;
    //   case 1:
    //     return 0.25;
    //   case 2:
    //     return 0.5;
    //   case 3:
    //     return 1.0;
    //   case 4:
    //     return 1.5;
    //   case 5:
    //     return 3.0;
    // }
    // return null;
  }

  _ResponsiveSpacing _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  _ResponsiveSpacing copyWithClass(String className) =>
      _copyWithClass(className);

  /// e.g. 'm-3'
  _ResponsiveSpacing _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: _sizeFromNumerator(numerator));
  }

  /// e.g. 'm-lg-3' || 'm-custom-2.5 120'
  _ResponsiveSpacing _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    if (breakPoint == "custom") {
      final numerator = double.tryParse((definitions.last));
      return _fromDefinitions(type: type, size: numerator);
    }
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(
        type: type,
        size: _sizeFromNumerator(numerator),
        breakPoint: breakPoint);
  }

  /// e.g. 'm-lg-custom-1.5'
  _ResponsiveSpacing _copyWithClass4(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = (definitions.last);
    return _fromDefinitions(
        type: type, size: double.tryParse(numerator), breakPoint: breakPoint);
  }

  _ResponsiveSpacing _fromDefinitions({
    required String type,
    double? size,
    String? breakPoint,
  });
}

StyleAbbrSet getStyle(
  ScreenData screenData,
  BoxConstraints constraints,
  Style? styles,
) {
  final display = styles?.display;
  final gutter = styles?.gutter;
  final offset = styles?.offset;
  final padding = styles?.padding;
  final margin = styles?.margin;
  final rowCols = styles?.rowCols;
  final alignment = styles?.alignment;
  final selfAlignment = styles?.selfAlignment;
  final size = styles?.size;

  final verticalAlignment = styles?.verticalAlignment;
  final horizontalAlignment = styles?.horizontalAlignment;
  final fontWeight = styles?.fontWeight;
  final fontSize = styles?.fontSize;

  final selfColor = styles?.color;
  final selfBgColor = styles?.bgColor;
  final width1 = styles?.width;
  final height1 = styles?.height;
  final order = styles?.order;

  final _maxWidth = styles?.maxWidth;
  final _maxHeight = styles?.maxHeight;
  final _minWidth = styles?.minWidth;
  final _minHeight = styles?.minHeight;

  final border = styles?.border;
  final borderColor = styles?.borderColor;
  final hoverColor = styles?.hoverColor;
  final _hoverBorder = styles?.hoverBorder;
  final _hoverBorderColor = styles?.hoverBorderColor;

  final activeColor = styles?.activeColor;
  final borderRadius = styles?.borderRadius;
  final fit = styles?.fit;
  final stackFit = styles?.stackFit;
  final blur = styles?.blur;
  final scale = styles?.scale;
  final shadowColor = styles?.shadowColor;
  final shadowBlurRadius = styles?.shadowBlurRadius;

  final shadowOffset = styles?.shadowOffset;

  final isVisible = screenData.breakPoints._currentDisplay(
    screenData.currentBreakPoint,
    fromStyle: display?.defaultDisplay,
    xs: display?.xs,
    sm: display?.sm,
    md: display?.md,
    lg: display?.lg,
    xl: display?.xl,
    xxl: display?.xxl,
  );

  final cg = screenData.breakPoints._currentGutter(
    1, //screenData.fontSize,
    screenData.currentBreakPoint,
    fromStyle: gutter?.defaultGutter,
    xs: gutter?.xs,
    sm: gutter?.sm,
    md: gutter?.md,
    lg: gutter?.lg,
    xl: gutter?.xl,
    xxl: gutter?.xxl,
  );

  final maxWidthHorizontalGutter =
      constraints.maxWidth + (cg?.left ?? 0.0) + (cg?.right ?? 0.0);
  final width = screenData.breakPoints._currentWidth(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: size?.defaultSize,
    xs: size?.xs,
    sm: size?.sm,
    md: size?.md,
    lg: size?.lg,
    xl: size?.xl,
    xxl: size?.xxl,
    // defaultWidth: defaultWidth,
  );
  final rc = screenData.breakPoints._currentRowCols(
    screenData.currentBreakPoint,
    fromStyle: rowCols?.defaultOrder,
    xs: rowCols?.xs,
    sm: rowCols?.sm,
    md: rowCols?.md,
    lg: rowCols?.lg,
    xl: rowCols?.xl,
    xxl: rowCols?.xxl,
  );
  final sa = screenData.breakPoints._currentSelfAlignment(
    screenData.currentBreakPoint,
    fromStyle: selfAlignment?.defaultAlignment,
    xs: selfAlignment?.xs,
    sm: selfAlignment?.sm,
    md: selfAlignment?.md,
    lg: selfAlignment?.lg,
    xl: selfAlignment?.xl,
    xxl: selfAlignment?.xxl,
  );
  final a = screenData.breakPoints._currentAlignment(
    screenData.currentBreakPoint,
    fromStyle: alignment?.defaultAlignment,
    xs: alignment?.xs,
    sm: alignment?.sm,
    md: alignment?.md,
    lg: alignment?.lg,
    xl: alignment?.xl,
    xxl: alignment?.xxl,
  );
  final co = screenData.breakPoints._currentOffset(
    maxWidthHorizontalGutter,
    screenData.currentBreakPoint,
    fromStyle: offset?.defaultOffset,
    xs: offset?.xs,
    sm: offset?.sm,
    md: offset?.md,
    lg: offset?.lg,
    xl: offset?.xl,
    xxl: offset?.xxl,
  );

  // //透明度
  // final _opacity = screenData.breakPoints._currentopacity(
  //   screenData.currentBreakPoint,
  //   fromStyle: opacity?.defaultOpacity,
  //   xs: opacity?.xs,
  //   sm: opacity?.sm,
  //   md: opacity?.md,
  //   lg: opacity?.lg,
  //   xl: opacity?.xl,
  //   xxl: opacity?.xxl,
  // );

  final cp = screenData.breakPoints._currentPadding(
    1, //screenData.fontSize,
    screenData.currentBreakPoint,
    fromStyle: padding?.defaultPadding,
    xs: padding?.xs,
    sm: padding?.sm,
    md: padding?.md,
    lg: padding?.lg,
    xl: padding?.xl,
    xxl: padding?.xxl,
  );

  final cm = screenData.breakPoints._currentMargin(
    1, //screenData.fontSize,
    screenData.currentBreakPoint,
    fromStyle: margin?.defaultMargin,
    xs: margin?.xs,
    sm: margin?.sm,
    md: margin?.md,
    lg: margin?.lg,
    xl: margin?.xl,
    xxl: margin?.xxl,
  );

  final va = screenData.breakPoints._currentVerticalAlignment(
    screenData.currentBreakPoint,
    fromStyle: verticalAlignment?.defaultAlignment,
    xs: verticalAlignment?.xs,
    sm: verticalAlignment?.sm,
    md: verticalAlignment?.md,
    lg: verticalAlignment?.lg,
    xl: verticalAlignment?.xl,
    xxl: verticalAlignment?.xxl,
  );

  final ha = screenData.breakPoints._currentHorizontalAlignment(
    screenData.currentBreakPoint,
    fromStyle: horizontalAlignment?.defaultAlignment,
    xs: horizontalAlignment?.xs,
    sm: horizontalAlignment?.sm,
    md: horizontalAlignment?.md,
    lg: horizontalAlignment?.lg,
    xl: horizontalAlignment?.xl,
    xxl: horizontalAlignment?.xxl,
  );
  final fw = screenData.breakPoints._currentFontWeight(
    screenData.currentBreakPoint,
    fromStyle: fontWeight?.defaultFontWeight,
    xs: fontWeight?.xs,
    sm: fontWeight?.sm,
    md: fontWeight?.md,
    lg: fontWeight?.lg,
    xl: fontWeight?.xl,
    xxl: fontWeight?.xxl,
  );
  final fs = screenData.breakPoints._currentFontSize(
    screenData.currentBreakPoint,
    fromStyle: fontSize?.defaultFontSize,
    xs: fontSize?.xs,
    sm: fontSize?.sm,
    md: fontSize?.md,
    lg: fontSize?.lg,
    xl: fontSize?.xl,
    xxl: fontSize?.xxl,
  );
  final color = screenData.breakPoints._currentColor(
    screenData.currentBreakPoint,
    fromStyle: selfColor?.defaultColor,
    xs: selfColor?.xs,
    sm: selfColor?.sm,
    md: selfColor?.md,
    lg: selfColor?.lg,
    xl: selfColor?.xl,
    xxl: selfColor?.xxl,
  );
  final bgColor = screenData.breakPoints._currentBgColor(
    screenData.currentBreakPoint,
    fromStyle: selfBgColor?.defaultColor,
    xs: selfBgColor?.xs,
    sm: selfBgColor?.sm,
    md: selfBgColor?.md,
    lg: selfBgColor?.lg,
    xl: selfBgColor?.xl,
    xxl: selfBgColor?.xxl,
  );

  /// 百分比 或 px 规定宽度
  final width10 = screenData.breakPoints._currentWidth1(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: width1?.defaultWidth,
    xs: width1?.xs,
    sm: width1?.sm,
    md: width1?.md,
    lg: width1?.lg,
    xl: width1?.xl,
    xxl: width1?.xxl,
    unit: width1?.unit,
  );

  /// 百分比 或 px 规定高度
  final height10 = screenData.breakPoints._currentWidth1(
    constraints.maxHeight,
    screenData.currentBreakPoint,
    fromStyle: height1?.defaultHeight,
    xs: height1?.xs,
    sm: height1?.sm,
    md: height1?.md,
    lg: height1?.lg,
    xl: height1?.xl,
    xxl: height1?.xxl,
    unit: height1?.unit,
  );

  /// 边框 宽度 px
  final border0 = screenData.breakPoints._currentWidth1(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: border?.defaultBorder,
    xs: border?.xs,
    sm: border?.sm,
    md: border?.md,
    lg: border?.lg,
    xl: border?.xl,
    xxl: border?.xxl,
    unit: 'px',
  );

  /// hover 边框 宽度 px
  final hoverBorder = screenData.breakPoints._currentWidth1(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: _hoverBorder?.defaultBorder,
    xs: _hoverBorder?.xs,
    sm: _hoverBorder?.sm,
    md: _hoverBorder?.md,
    lg: _hoverBorder?.lg,
    xl: _hoverBorder?.xl,
    xxl: _hoverBorder?.xxl,
    unit: 'px',
  );

  /// 百分比 或 px 规定高度
  final maxWidth = screenData.breakPoints._currentWidth1(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: _maxWidth?.defaultWidth,
    xs: _maxWidth?.xs,
    sm: _maxWidth?.sm,
    md: _maxWidth?.md,
    lg: _maxWidth?.lg,
    xl: _maxWidth?.xl,
    xxl: _maxWidth?.xxl,
    unit: _maxWidth?.unit,
  );

  /// 百分比 或 px 规定高度
  final minHeight = screenData.breakPoints._currentWidth1(
    constraints.maxHeight,
    screenData.currentBreakPoint,
    fromStyle: _minHeight?.defaultHeight,
    xs: _minHeight?.xs,
    sm: _minHeight?.sm,
    md: _minHeight?.md,
    lg: _minHeight?.lg,
    xl: _minHeight?.xl,
    xxl: _minHeight?.xxl,
    unit: _minHeight?.unit,
  );

  /// 百分比 或 px 规定高度
  final minWidth = screenData.breakPoints._currentWidth1(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: _minWidth?.defaultWidth,
    xs: _minWidth?.xs,
    sm: _minWidth?.sm,
    md: _minWidth?.md,
    lg: _minWidth?.lg,
    xl: _minWidth?.xl,
    xxl: _minWidth?.xxl,
    unit: _minWidth?.unit,
  );

  /// 百分比 或 px 规定高度
  final maxHeight = screenData.breakPoints._currentWidth1(
    constraints.maxHeight,
    screenData.currentBreakPoint,
    fromStyle: _maxHeight?.defaultHeight,
    xs: _maxHeight?.xs,
    sm: _maxHeight?.sm,
    md: _maxHeight?.md,
    lg: _maxHeight?.lg,
    xl: _maxHeight?.xl,
    xxl: _maxHeight?.xxl,
    unit: _maxHeight?.unit,
  );

  /// 鼠标覆盖组件时的边框颜色
  final hoverBorderColor = screenData.breakPoints._currentColor(
    screenData.currentBreakPoint,
    fromStyle: _hoverBorderColor?.defaultColor,
    xs: _hoverBorderColor?.xs,
    sm: _hoverBorderColor?.sm,
    md: _hoverBorderColor?.md,
    lg: _hoverBorderColor?.lg,
    xl: _hoverBorderColor?.xl,
    xxl: _hoverBorderColor?.xxl,
  );

  /// 鼠标覆盖组件时的颜色
  final hoverColor0 = screenData.breakPoints._currentColor(
    screenData.currentBreakPoint,
    fromStyle: hoverColor?.defaultColor,
    xs: hoverColor?.xs,
    sm: hoverColor?.sm,
    md: hoverColor?.md,
    lg: hoverColor?.lg,
    xl: hoverColor?.xl,
    xxl: hoverColor?.xxl,
  );

  /// 激活或选中颜色
  final activeColor0 = screenData.breakPoints._currentColor(
    screenData.currentBreakPoint,
    fromStyle: activeColor?.defaultColor,
    xs: activeColor?.xs,
    sm: activeColor?.sm,
    md: activeColor?.md,
    lg: activeColor?.lg,
    xl: activeColor?.xl,
    xxl: activeColor?.xxl,
  );

  /// 边框颜色
  final borderColor0 = screenData.breakPoints._currentColor(
    screenData.currentBreakPoint,
    fromStyle: borderColor?.defaultBorderColor,
    xs: borderColor?.xs,
    sm: borderColor?.sm,
    md: borderColor?.md,
    lg: borderColor?.lg,
    xl: borderColor?.xl,
    xxl: borderColor?.xxl,
  );

  /// 边框圆角
  final borderRadius0 = screenData.breakPoints._currentWidth1(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: borderRadius?.defaultBorderRadius,
    xs: borderRadius?.xs,
    sm: borderRadius?.sm,
    md: borderRadius?.md,
    lg: borderRadius?.lg,
    xl: borderRadius?.xl,
    xxl: borderRadius?.xxl,
    unit: 'px',
  );

  /// 填充
  final fit0 = screenData.breakPoints._currentFit(
    screenData.currentBreakPoint,
    fromStyle: fit?.defaultFit,
    xs: fit?.xs,
    sm: fit?.sm,
    md: fit?.md,
    lg: fit?.lg,
    xl: fit?.xl,
    xxl: fit?.xxl,
  );

  /// 填充
  final stackFit0 = screenData.breakPoints._currentStackFit(
    screenData.currentBreakPoint,
    fromStyle: stackFit?.defaultFit,
    xs: stackFit?.xs,
    sm: stackFit?.sm,
    md: stackFit?.md,
    lg: stackFit?.lg,
    xl: stackFit?.xl,
    xxl: stackFit?.xxl,
  );

  /// 模糊
  final blur0 = screenData.breakPoints._currentBlur(
    screenData.currentBreakPoint,
    fromStyle: blur?.defaultBlur,
    xs: blur?.xs,
    sm: blur?.sm,
    md: blur?.md,
    lg: blur?.lg,
    xl: blur?.xl,
    xxl: blur?.xxl,
  );

  final scale0 = screenData.breakPoints._currentScale(
    screenData.currentBreakPoint,
    fromStyle: scale?.defaultScale,
    xs: scale?.xs,
    sm: scale?.sm,
    md: scale?.md,
    lg: scale?.lg,
    xl: scale?.xl,
    xxl: scale?.xxl,
  );

  final shadowColor0 = screenData.breakPoints._currentColor(
    screenData.currentBreakPoint,
    fromStyle: shadowColor?.defaultShadowColor,
    xs: shadowColor?.xs,
    sm: shadowColor?.sm,
    md: shadowColor?.md,
    lg: shadowColor?.lg,
    xl: borderColor?.xl,
    xxl: shadowColor?.xxl,
  );

  final shadowBlurRadius0 = screenData.breakPoints._currentShadowBlurRadius(
    screenData.currentBreakPoint,
    fromStyle: shadowBlurRadius?.defaultBlurRadius,
    xs: shadowBlurRadius?.xs,
    sm: shadowBlurRadius?.sm,
    md: shadowBlurRadius?.md,
    lg: shadowBlurRadius?.lg,
    xl: shadowBlurRadius?.xl,
    xxl: shadowBlurRadius?.xxl,
  );
  final currentOrder = screenData.breakPoints.currentOrder(
    constraints.maxWidth,
    screenData.currentBreakPoint,
    fromStyle: order?.defaultOrder,
    xs: order?.xs,
    sm: order?.sm,
    md: order?.md,
    lg: order?.lg,
    xl: order?.xl,
    xxl: order?.xxl,
  );
  // final shadowOffset = styles?.shadowOffset;

  final shadowOffset0 = screenData.breakPoints._shadowOffset(
    screenData.currentBreakPoint,
    fromStyle: shadowOffset?.defaultOffset,
    xs: shadowOffset?.xs,
    sm: shadowOffset?.sm,
    md: shadowOffset?.md,
    lg: shadowOffset?.lg,
    xl: shadowOffset?.xl,
    xxl: shadowOffset?.xxl,
  );

  return StyleAbbrSet(
    order: currentOrder,
    cg: cg,
    cp: cp,
    width: width,
    rc: rc,
    a: a,
    sa: sa,
    co: co,
    cm: cm,
    va: va,
    ha: ha,
    isVisible: isVisible,
    fw: fw,
    fs: fs,
    color: color,
    bg: bgColor,
    w: width10,
    h: height10,
    minHeight: minHeight,
    minWidth: minWidth,
    maxHeight: maxHeight,
    maxWidth: maxWidth,
    border: border0,
    // opacity: _opacity,
    borderColor: borderColor0,
    hoverColor: hoverColor0,
    hoverBorder: hoverBorder,
    hoverBorderColor: hoverBorderColor,
    activeColor: activeColor0,
    borderRadius: borderRadius0,
    fit: fit0,
    stackFit: stackFit0,
    blur: blur0,
    scale: scale0,
    shadowColor: shadowColor0,
    shadowBlurRadius: shadowBlurRadius0,
    shadowOffset: shadowOffset0,
  );
}

/// 样式简写集合
///
/// cg [EdgeInsets]?  gutter
///
/// cp [EdgeInsets]?  padding
///
/// width [double]?  width
///
/// rc [int]?  row cols 一行多少列
///
/// sa [Alignment]?  self alignment
///
/// a [Alignment]?  alignment 横向与纵向对齐方式
///
/// co [double]?  offset
///
/// cm [EdgeInsets]?  margin
///
/// va [WrapCrossAlignment]?  flex 纵向对齐方式
///
/// ha [WrapAlignment]?  flex 横向对齐方式
///
/// isVisible [bool]? 是否可见
///

/// fit [BoxFit]? 填充
///
/// stackFit [StackFit]? 填充
///
/// blur [ImageFilter]? 模糊
///
/// scale [double]? 缩放
///
class StyleAbbrSet {
  /// gutter
  EdgeInsets? cg;

  /// padding
  EdgeInsets? cp;

  /// width 栅格
  double? width;

  /// row cols 一行多少列
  double? rc;

  /// self alignment
  Alignment? sa;

  /// a (alignment) 对齐方式
  Alignment? a;

  /// offset
  double? co;

  /// margin
  EdgeInsets? cm;

  /// flex 纵向对齐方式
  WrapCrossAlignment? va;

  /// flex 横向对齐方式
  WrapAlignment? ha;

  /// 是否可见
  bool? isVisible;

  /// FontWeight
  FontWeight? fw;

  /// FonstSize
  double? fs;

  /// 颜色
  Color? color;

  /// 背景色
  Color? bg;

  /// 最小宽度 百分比或px
  double? minWidth;

  /// 最小 高度 百分比或px
  double? minHeight;

  /// 最大宽度 百分比或px
  double? maxWidth;

  /// 最大高度 百分比或px
  double? maxHeight;

  /// 宽度 百分比或px
  double? w;

  /// 高度 百分比或px
  double? h;

  /// 边框宽度 px
  double? border;

  /// 边框颜色
  Color? borderColor;

  /// hover 边框宽度 px
  double? hoverBorder;

  /// hover 边框颜色
  Color? hoverBorderColor;

  /// 鼠标移上去时的颜色
  Color? hoverColor;

  /// 激活或选中颜色
  Color? activeColor;

  /// 边框圆角 px
  double? borderRadius;

  /// 填充
  BoxFit? fit;

  /// 填充
  StackFit? stackFit;

  /// 模糊
  ImageFilter? blur;

  /// 缩放
  Transform? scale;

  //阴影颜色
  Color? shadowColor;

  //阴影模糊半径
  double? shadowBlurRadius;

  //阴影偏移量
  Offset? shadowOffset;
  
  // BCol 排序
  double? order;

  StyleAbbrSet({
    this.order,
    this.cg,
    this.cp,
    this.width,
    this.rc,
    this.sa,
    this.a,
    this.co,
    this.cm,
    this.va,
    this.ha,
    this.isVisible,
    this.fw,
    this.fs,
    this.color,
    this.bg,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.w,
    this.h,
    this.border,
    this.borderColor,
    this.hoverColor,
    this.hoverBorder,
    this.hoverBorderColor,
    this.activeColor,
    this.borderRadius,
    this.fit,
    this.stackFit,
    this.blur,
    this.scale,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowOffset,
  });
}
