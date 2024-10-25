part of brick_bootstrap5_plus_utilities;

/// [WrapAlignment] 2 [MainAxisAlignment]
MainAxisAlignment? wrapAlignment2MainAxisAlignment(WrapAlignment? alignment) {
  switch (alignment) {
    case WrapAlignment.start:
      return MainAxisAlignment.start;
    case WrapAlignment.center:
      return MainAxisAlignment.center;
    case WrapAlignment.end:
      return MainAxisAlignment.end;
    case WrapAlignment.spaceAround:
      return MainAxisAlignment.spaceAround;
    case WrapAlignment.spaceBetween:
      return MainAxisAlignment.spaceBetween;
    case WrapAlignment.spaceEvenly:
      return MainAxisAlignment.spaceEvenly;
    default:
      return null;
  }
}

/// [MainAxisAlignment] 2 [WrapAlignment]
WrapAlignment? mainAxisAlignment2WrapAlignment(MainAxisAlignment? alignment) {
  switch (alignment) {
    case MainAxisAlignment.start:
      return WrapAlignment.start;
    case MainAxisAlignment.center:
      return WrapAlignment.center;
    case MainAxisAlignment.end:
      return WrapAlignment.end;
    case MainAxisAlignment.spaceAround:
      return WrapAlignment.spaceAround;
    case MainAxisAlignment.spaceBetween:
      return WrapAlignment.spaceBetween;
    case MainAxisAlignment.spaceEvenly:
      return WrapAlignment.spaceEvenly;
    default:
      return null;
  }
}

/// [WrapCrossAlignment] 2 [CrossAxisAlignment]
CrossAxisAlignment? wrapCrossAlignment2CrossAxisAlignment(
    WrapCrossAlignment? alignment) {
  switch (alignment) {
    case WrapCrossAlignment.start:
      return CrossAxisAlignment.start;
    case WrapCrossAlignment.center:
      return CrossAxisAlignment.center;
    case WrapCrossAlignment.end:
      return CrossAxisAlignment.end;
    default:
      return null;
  }
}

/// [CrossAxisAlignment] 2 [WrapCrossAlignment]
WrapCrossAlignment? crossAxisAlignment2WrapCrossAlignment(
    CrossAxisAlignment? alignment) {
  switch (alignment) {
    case CrossAxisAlignment.start:
      return WrapCrossAlignment.start;
    case CrossAxisAlignment.center:
      return WrapCrossAlignment.center;
    case CrossAxisAlignment.end:
      return WrapCrossAlignment.end;

    case CrossAxisAlignment.stretch:
      return WrapCrossAlignment.start;
    case CrossAxisAlignment.baseline:
      return WrapCrossAlignment.start;
    default:
      return null;
  }
}

/// [Alignment] 2 [AlignmentDirectional]
AlignmentDirectional? alignment2AlignmentDirectional(Alignment? alignment) {
  switch (alignment) {
    case Alignment.topLeft:
      return AlignmentDirectional.topStart;
    case Alignment.topCenter:
      return AlignmentDirectional.topCenter;
    case Alignment.topRight:
      return AlignmentDirectional.topEnd;
    case Alignment.centerLeft:
      return AlignmentDirectional.centerStart;
    case Alignment.center:
      return AlignmentDirectional.center;
    case Alignment.centerRight:
      return AlignmentDirectional.centerEnd;
    case Alignment.bottomLeft:
      return AlignmentDirectional.bottomStart;
    case Alignment.bottomCenter:
      return AlignmentDirectional.bottomCenter;
    case Alignment.bottomRight:
      return AlignmentDirectional.bottomEnd;
    default:
      return null;
  }
}

/// [AlignmentDirectional] 2 [Alignment]
Alignment? alignmentDirectional2Alignment(AlignmentDirectional? alignment) {
  switch (alignment) {
    case AlignmentDirectional.topStart:
      return Alignment.topLeft;
    case AlignmentDirectional.topCenter:
      return Alignment.topCenter;
    case AlignmentDirectional.topEnd:
      return Alignment.topRight;
    case AlignmentDirectional.centerStart:
      return Alignment.centerLeft;
    case AlignmentDirectional.center:
      return Alignment.center;
    case AlignmentDirectional.centerEnd:
      return Alignment.centerRight;
    case AlignmentDirectional.bottomStart:
      return Alignment.bottomLeft;
    case AlignmentDirectional.bottomCenter:
      return Alignment.bottomCenter;
    case AlignmentDirectional.bottomEnd:
      return Alignment.bottomRight;
    default:
      return null;
  }
}

/// [Alignment] 2 [WrapAlignment]
WrapAlignment? alignment2WrapAlignment(Alignment? alignment) {
  switch (alignment) {
    case Alignment.topLeft:
      return WrapAlignment.start;
    case Alignment.topCenter:
      return WrapAlignment.center;
    case Alignment.topRight:
      return WrapAlignment.end;
    case Alignment.centerLeft:
      return WrapAlignment.start;
    case Alignment.center:
      return WrapAlignment.center;
    case Alignment.centerRight:
      return WrapAlignment.end;
    case Alignment.bottomLeft:
      return WrapAlignment.start;
    case Alignment.bottomCenter:
      return WrapAlignment.center;
    case Alignment.bottomRight:
      return WrapAlignment.end;
    default:
      return null;
  }
}

/// [Alignment] 2 [MainAxisAlignment]
MainAxisAlignment? alignment2MainAxisAlignment(Alignment? alignment) {
  switch (alignment) {
    case Alignment.topLeft:
      return MainAxisAlignment.start;
    case Alignment.topCenter:
      return MainAxisAlignment.center;
    case Alignment.topRight:
      return MainAxisAlignment.end;
    case Alignment.centerLeft:
      return MainAxisAlignment.start;
    case Alignment.center:
      return MainAxisAlignment.center;
    case Alignment.centerRight:
      return MainAxisAlignment.end;
    case Alignment.bottomLeft:
      return MainAxisAlignment.start;
    case Alignment.bottomCenter:
      return MainAxisAlignment.center;
    case Alignment.bottomRight:
      return MainAxisAlignment.end;
    default:
      return null;
  }
}

/// [Alignment] 2 [CrossAxisAlignment]
CrossAxisAlignment? alignment2CrossAxisAlignment(Alignment? alignment) {
  switch (alignment) {
    case Alignment.topLeft:
      return CrossAxisAlignment.start;
    case Alignment.topCenter:
      return CrossAxisAlignment.center;
    case Alignment.topRight:
      return CrossAxisAlignment.end;
    case Alignment.centerLeft:
      return CrossAxisAlignment.start;
    case Alignment.center:
      return CrossAxisAlignment.center;
    case Alignment.centerRight:
      return CrossAxisAlignment.end;
    case Alignment.bottomLeft:
      return CrossAxisAlignment.start;
    case Alignment.bottomCenter:
      return CrossAxisAlignment.center;
    case Alignment.bottomRight:
      return CrossAxisAlignment.end;
    default:
      return null;
  }
}

/// [Alignment] 2 [WrapCrossAlignment]
WrapCrossAlignment? alignment2WrapCrossAlignment(Alignment? alignment) {
  switch (alignment) {
    case Alignment.topLeft:
      return WrapCrossAlignment.start;
    case Alignment.topCenter:
      return WrapCrossAlignment.center;
    case Alignment.topRight:
      return WrapCrossAlignment.end;
    case Alignment.centerLeft:
      return WrapCrossAlignment.start;
    case Alignment.center:
      return WrapCrossAlignment.center;
    case Alignment.centerRight:
      return WrapCrossAlignment.end;
    case Alignment.bottomLeft:
      return WrapCrossAlignment.start;
    case Alignment.bottomCenter:
      return WrapCrossAlignment.center;
    case Alignment.bottomRight:
      return WrapCrossAlignment.end;
    default:
      return null;
  }
}

/// [WrapAlignment] 2 [Alignment]
Alignment? wrapAlignment2Alignment(WrapAlignment? alignment) {
  switch (alignment) {
    case WrapAlignment.start:
      return Alignment.centerLeft;
    case WrapAlignment.center:
      return Alignment.center;
    case WrapAlignment.end:
      return Alignment.centerRight;
    case WrapAlignment.spaceAround:
    case WrapAlignment.spaceBetween:
    case WrapAlignment.spaceEvenly:
    default:
      return null;
  }
}

/// [MainAxisAlignment] 2 [Alignment]
Alignment? mainAxisAlignment2Alignment(MainAxisAlignment? alignment) {
  switch (alignment) {
    case MainAxisAlignment.start:
      return Alignment.centerLeft;
    case MainAxisAlignment.center:
      return Alignment.center;
    case MainAxisAlignment.end:
      return Alignment.centerRight;
    case MainAxisAlignment.spaceAround:
    case MainAxisAlignment.spaceBetween:
    case MainAxisAlignment.spaceEvenly:
    default:
      return null;
  }
}

/// [CrossAxisAlignment] 2 [Alignment]
Alignment crossAxisAlignment2Alignment(CrossAxisAlignment? alignment) {
  switch (alignment) {
    case CrossAxisAlignment.start:
      return Alignment.centerLeft;
    case CrossAxisAlignment.center:
      return Alignment.center;
    case CrossAxisAlignment.end:
      return Alignment.centerRight;
    default:
      return Alignment.centerLeft;
  }
}

/// [WrapCrossAlignment] 2 [Alignment]
Alignment? wrapCrossAlignment2Alignment(WrapCrossAlignment? alignment) {
  switch (alignment) {
    case WrapCrossAlignment.start:
      return Alignment.centerLeft;
    case WrapCrossAlignment.center:
      return Alignment.center;
    case WrapCrossAlignment.end:
      return Alignment.centerRight;
    default:
      return null;
  }
}

/// 从定义的 [classNames] 生成的 [StyleAbbrSet] 里，按优先级，获取 [WrapAlignment]
WrapAlignment? getWrapAlignment(StyleAbbrSet s) {
  if (s.ha != null) {
    return s.ha;
  } else if (s.a != null) {
    return alignment2WrapAlignment(s.a!);
  }
  return null;
}

/// 从定义的 [classNames] 生成的 [StyleAbbrSet] 里，按优先级，获取 [WrapCrossAlignment]
WrapCrossAlignment? getWrapCrossAlignment(StyleAbbrSet s) {
  if (s.va != null) {
    return s.va;
  } else if (s.a != null) {
    return alignment2WrapCrossAlignment(s.a!);
  }
  return null;
}

/// 从定义的 [classNames] 生成的 [StyleAbbrSet] 里，按优先级，获取 [Alignment]
Alignment? getAlignment(StyleAbbrSet s) {
  if (s.a != null) {
    return s.a;
  } else if (s.ha != null) {
    return wrapAlignment2Alignment(s.ha!);
  } else if (s.va != null) {
    return wrapCrossAlignment2Alignment(s.va!);
  }
  return null;
}
