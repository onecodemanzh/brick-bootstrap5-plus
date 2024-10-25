part of brick_bootstrap5_plus_utilities;

/// 只取 布局 相关的className
String getLayoutClass(String className) => className
    .split(' ')
    .where((element) => element.split('-').first == 'col')
    .join('');
