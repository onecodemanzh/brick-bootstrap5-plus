// ignore_for_file: prefer_initializing_formals

part of brick_bootstrap5_plus_utilities;

class BootstrapColors {
  static const Color blue = Color(0xFF0d6efd);
  static const Color indigo = Color(0xFF6610f2);
  static const Color purple = Color(0xFF6f42c1);
  static const Color pink = Color(0xFFd63384);
  static const Color red = Color(0xFFdc3545);
  static const Color orange = Color(0xFFfd7e14);
  static const Color yellow = Color(0xFFFAAD14);
  static const Color green = Color(0xFF198754);
  static const Color success = Color(0xFF52C41A);
  static const Color teal = Color(0xFF20c997);
  static const Color cyan = Color(0xFF0dcaf0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xFFf8f9fa);
  static const Color gray200 = Color(0xFFe9ecef);
  static const Color gray300 = Color(0xFFdee2e6);
  static const Color gray400 = Color(0xFFced4da);
  static const Color gray500 = Color(0xFFadb5bd);
  static const Color gray600 = Color(0xFF6c757d);
  static const Color gray700 = Color(0xFF495057);
  static const Color gray800 = Color(0xFF343a40);
  static const Color gray900 = Color(0xFF212529);
  static const Color gray90075 = Color(0xBF212529);
  static const Color black50 = Color(0x80000000);
  static const Color white50 = Color(0x80FFFFFF);

  /// 未选中时 前景色
  static const Color fg = Color(0xFF000000);

  /// 未选中时 背景色
  static const Color bg = Color(0xFFFFFFFF);

  /// 选中时 前景色
  static const Color select = Color(0xFF8DB0FF);

  /// 选中时 背景色
  static const Color selectBg = Color(0xFFE8EFFF);
}

class BColors {
  const BColors();

  static Color primary = BootstrapColors.blue;
  static Color secondary = BootstrapColors.gray600;
  static Color thirdly = const Color(0xFFE0E0E0);
  static Color success = BootstrapColors.success;
  static Color danger = BootstrapColors.red;
  static Color warning = BootstrapColors.yellow;
  static Color info = BootstrapColors.cyan;
  static Color light = BootstrapColors.gray100;
  static Color dark = BootstrapColors.gray900;
  static Color body = BootstrapColors.gray900;
  static Color muted = BootstrapColors.gray90075;
  static Color white = BootstrapColors.white;
  static Color black50 = BootstrapColors.black50;
  static Color white50 = BootstrapColors.white50;

  /// 未选中时 前景色
  static Color fg = BootstrapColors.fg;

  /// 未选中时 背景色
  static Color bg = BootstrapColors.bg;

  /// 选中时 前景色
  static Color select = BootstrapColors.select;

  /// 选中时 背景色
  static Color selectBg = BootstrapColors.selectBg;

  BColors.copyWith({
    Color primary = BootstrapColors.blue,
    Color secondary = BootstrapColors.gray600,
    Color thirdly = const Color(0xFFE0E0E0),
    Color success = BootstrapColors.success,
    Color danger = BootstrapColors.red,
    Color warning = BootstrapColors.yellow,
    Color info = BootstrapColors.cyan,
    Color light = BootstrapColors.gray100,
    Color dark = BootstrapColors.gray900,
    Color body = BootstrapColors.gray900,
    Color muted = BootstrapColors.gray90075,
    Color white = BootstrapColors.white,
    Color black50 = BootstrapColors.black50,
    Color white50 = BootstrapColors.white50,
    Color fg = BootstrapColors.fg,
    Color bg = BootstrapColors.bg,
    Color select = BootstrapColors.select,
    Color selectBg = BootstrapColors.selectBg,
  }) {
    BColors.primary = primary;
    BColors.secondary = secondary;
    BColors.thirdly = thirdly;
    BColors.success = success;
    BColors.danger = danger;
    BColors.warning = warning;
    BColors.info = info;
    BColors.light = light;
    BColors.dark = dark;
    BColors.body = body;
    BColors.muted = muted;
    BColors.white = white;
    BColors.black50 = black50;
    BColors.white50 = white50;
    BColors.fg = fg.withOpacity(.87);
    BColors.bg = bg;
    BColors.select = select;
    BColors.selectBg = selectBg;
  }
}

Color lighten(Color? c, {int amount = 10}) =>
    TinyColor.fromColor(c ?? Colors.transparent).lighten(amount).toColor();
Color darken(Color? c, {int amount = 10}) =>
    TinyColor.fromColor(c ?? Colors.transparent).darken(amount).toColor();
