<h1 align="center">
     <p align="center"><a href="https://pub.dev/packages/brick_bootstrap5_plus">brick_bootstrap5_plus 🚀 </a> <a href="https://github.com/onecodemanzh/brick-bootstrap5-plus">github</a> </p>
</h1>
<h1 align="center">
     源码改自<p align="center"><a href="https://pub.dev/packages/flutter_bootstrap5">flutter_bootstrap5</a> <a href="https://github.com/felixjunghans/flutter_bootstrap_5">github</a> </p>
</h1>

<h2 align="center"> 这个包用于支持使用Flutter创建响应式web应用程序。
它基于著名的CSS框架Bootstrap 5 和 flutter_bootstrap5，并提供了许多在Bootstrap中也可以找到的功能。
</h2>
<p align="center">如果喜欢这个包，你可以点个赞 ❤️ <a href="https://github.com/onecodemanzh/brick-bootstrap5-plus">送一颗星星 ⭐</a> 支持一哈!</p>

<br />
<br />





#### BreakPoints

要设置自己的断点(breakPoints)，您可以简单地将BreakPoints类传递给[FlutterBootstrap5]小部件。
默认情况下，使用Bootstrap5 CSS的当前断点(breakPoints)

```dart
        class BootstrapBreakPoints {
          static const BreakPoint xs = BreakPoint(minWidth: 0, maxWidth: 576);
          static const BreakPoint sm = BreakPoint(minWidth: 576, maxWidth: 768);
          static const BreakPoint md = BreakPoint(minWidth: 768, maxWidth: 992);
          static const BreakPoint lg = BreakPoint(minWidth: 992, maxWidth: 1200);
          static const BreakPoint xl = BreakPoint(minWidth: 1200, maxWidth: 1400);
          static const BreakPoint xxl =
          BreakPoint(minWidth: 1400, maxWidth: double.infinity);
        }
```

#### Container BreakPoints

除了正常的断点(breakPoints)，你也可以为[FB5Container]定义你自己的断点(breakPoints)。
这些决定了[FB5Container]在某个断点(breakPoints)处应该具有的宽度。

默认情况下，使用Bootstrap5 CSS的当前容器断点(breakPoints)

```dart
      class _BootstrapContainerBreakPoints {
        static const double xs = double.infinity;
        static const double sm = 540;
        static const double md = 720;
        static const double lg = 960;
        static const double xl = 1140;
        static const double xxl = 1320;
      }
```

#### 默认字体大小

默认值为12.0


### 在 MaterialApp 使用 主题

可以 用 BootstrapTheme  。

```dart
        MaterialApp(
            title: 'Demo',
            theme: BootstrapTheme.of(ctx).toTheme( [PASS YOUR THEME TO OVERRIDE BOOTSTRAP THEME IF YOU WANT TO] ),
            home: const Home(),
        ),
```

# 特征

## 当前支持的Bootstrap className
#### 响应性支持使用-xs、-sm、-md、-lg、-xl和xxl

| Description         | Base class           | Variations                                                    | Responsive Support |
|---------------------|----------------------|---------------------------------------------------------------|--------------------|
| `栅格` | `col`                | `col-{1-24}`,                                                 | &check;            |
| `Padding`           | `p`                  | `p-{1-5}`,`p{t,b,s,e,x,y}-{1-5}`,`p{t,b,s,e,x,y}-custom-{0.0-*}`  | &check;            |
| `Margin`            | `m`                  | `m-{1-5}`,`p{t,b,s,e,x,y}-{1-5}`,`m{t,b,s,e,x,y}-custom-{0.0-*}`  | &check;            |
| `Gutter`            | `g`                  | `g-{1-5}`,`g{x,y}-{1-5}`,`g{x,y}-custom-{0.0-*}`              | &check;            |
| `Order`             | `order`              | `order-{0-*}`                                                 | &check;            |
| `offset`            | `offset`             | `offset-{0-*}`                                                 | &check;            |
| `Display`           | `d`                  | `d-none`, `d-block`,                                          | &check;            |
| `Align Items`       | `align-items`        | `align-items-{start, center, end}`                            | &check;            |
| `Align Self`        | `align-self`         | `align-self-{start, center, end}`                             | &check;            |
| `Justify Content`   | `justify-content`    | `justify-content-{start, around, between, evenly, center, end}` | &check;            |
| `align`             | `align`              | `align-{start,center,end,bottomCenter,bottomLeft,bottomRight,centerLeft,centerRight,topCenter,topLeft,topRight}` | &check;            |
| `width`             | `w`              | `w-{0-100} 按百分比0-100分配宽度, w-{0-*}-px 按px 0-*分配宽度，`  | &check;            |
| `height`            | `h`              | `h-{0-100} 按百分比0-100分配高度, h-{0-*}-px 按px 0-*分配高度，`  | &check;            |
| `max Height`        | `maxHeight`          | `maxHeight-{0-100} 按百分比0-100分配高度, maxHeight-{0-*}-px 按px 0-*分配高度，`  | &check;            |
| `min Height`        | `minHeight`          | `minHeight-{0-100} 按百分比0-100分配高度, minHeight-{0-*}-px 按px 0-*分配高度，`  | &check;            |
| `max Width`        | `maxWidth`          | `maxWidth-{0-100} 按百分比0-100分配宽度, maxWidth-{0-*}-px 按px 0-*分配宽度，`  | &check;            |
| `min Width`        | `minWidth`          | `minWidth-{0-100} 按百分比0-100分配宽度, minWidth-{0-*}-px 按px 0-*分配宽度，`  | &check;            |
| `bg`               | `bg`               | `bg-fg,bg-bg,bg-select,bg-selectBg,bg-fff,bg-fff,bg-ffffff,bg-FFDFE2E6,bg-transparent,bg-{black,black87,black54}(Colors能点出来的所有颜色)` | &check;     
| `color`               | `color`               | `color-fg,color-bg,color-select,color-selectBg,color-fff,color-fff,color-ffffff,color-FFDFE2E6,color-transparent,color-{black,black87,black54}(Colors能点出来的所有颜色)` | &check;         |
| `border color`               | `border-color`               | `border-color-fg,border-color-bg,border-color-select,border-color-selectBg,border-color-fff,border-color-fff,border-color-ffffff,border-color-FFDFE2E6,border-color-transparent,border-color-{black,black87,black54}(Colors能点出来的所有颜色)` | &check;         |
| `hover Color`               | `hoverColor`               | `hoverColor-fg,hoverColor-bg,hoverColor-select,hoverColor-selectBg,hoverColor-fff,hoverColor-fff,hoverColor-ffffff,hoverColor-FFDFE2E6,hoverColor-transparent,hoverColor-{black,black87,black54}(Colors能点出来的所有颜色)` | &check;     
| `hover Border Color`               | `hoverBorderColor`               | `hoverBorderColor-fg,hoverBorderColor-bg,hoverBorderColor-select,hoverBorderColor-selectBg,hoverBorderColor-fff,hoverBorderColor-fff,hoverBorderColor-ffffff,hoverBorderColor-FFDFE2E6,hoverBorderColor-transparent,hoverBorderColor-{black,black87,black54}(Colors能点出来的所有颜色)` | &check;   
| `hover Border width`             | `hoverBorder`              | `hoverBorder-{0-*}` | &check;            |
| `shadow color`               | `shadow-color`               | `shadow-color-fg,shadow-color-bg,shadow-color-select,shadow-color-selectBg,shadow-color-fff,shadow-color-fff,shadow-color-ffffff,shadow-color-FFDFE2E6,shadow-color-transparent,shadow-color-{black,black87,black54}(Colors能点出来的所有颜色)` | &check;   
| `shadow offset` | `shadow-offset` | `shadow-offset-1,1 shadow-offset-.5,.5 shadow-offset-10,10` | &check;            |
| `shadow blur Radius` | `shadow-blurRadius` | `shadow-blurRadius-{0-*}` | &check;            |
| `font size` | `font-size-` | `font-size-{10-*}` | &check;            |
| `font weight` | `font-weight-` | `font-weight-{10-*}` | &check;            |
| `blur ` | `blur-` | `blur-{0-*}` | &check;            |

## Widgets

### BContainer  不建议使用
BContainer 是对 Flutter Container 二次包裹.

```dart
    BContainer(child: child);
    BContainer.sm(child: child);
    BContainer.md(child: child);
    BContainer.lg(child: child);
    BContainer.xl(child: child);
    BContainer.xxl(child: child);
    BContainer.fluid(child: child);
```

### Grid  不建议使用
Grid 用于表示您的孩子的网格系统。它们不应该含有FB5Cols。FB5Grid自动调整子元素的大小，使一排子元素始终具有相同的高度。
```dart
    FB5Grid(
      classNames: 'row-cols-3',
      children: [
          ...
      ],
    ),
```

### BRow
BRow 是 引导行。包裹一个BCol列表，
BCol 根据 classNames 进行排列和显示。
能支持的  classNames  大概列在下面
```dart
    BRow(
        classNames: 'mt-5 px-xs-3 px-lg-0 gx-4',
        children: [
            BCol(
                classNames: 'col-12',
                child: const GettingStarted(),
            ),
            BCol(
                classNames: 'col-12 mt-5',
                child: const Containers(),
            ),
            BCol(
                classNames: 'mt-5',
                child: const TestingArea(),
            ),
            BCol(
                classNames: 'my-5',
                child: const GridArea(),
            ),
       ],
    ),
    BRow(
        classNames: 'offset-1 p-10 m-10',
        classNames: 'align-items-start align-items-center align-items-end ' // 纵向对齐
        classNames: 'justify-content-start justify-content-around justify-content-between justify-content-evenly justify-content-center justify-content-end' // 横向对齐 (由于最终使用的是Wrap组件，另外横向对齐 只支持左对齐，右对齐，居中对齐)
        classNames: 'align-self-bottomCenter align-self-bottomLeft align-self-bottomRight align-self-center align-self-centerLeft align-self-centerRight align-self-topCenter align-self-topLeft align-self-topRight ' // 横向对齐
        classNames: 'align-bottomCenter align-bottomLeft align-bottomRight align-center align-centerLeft align-centerRight align-topCenter align-topLeft align-topRight ' // 横向对齐
        children:[
            BCol(
            classNames: ''
            children:[],
            )
        ]
    ),
```

### BCol
BCol 根据 classNames 进行排列和显示。
能支持的  classNames  大概列在下面
```dart
        BCol(
            classNames: 'col-12 col-lg-6 col-xl-4 m-3 m-xl-2 d-none d-sm-block',
            child: child,
        ),
         BCol(
            classNames: 'col-24 offset-1 order-1',
            classNames: 'align-items-start align-items-center align-items-end ' // 纵向对齐
            classNames: 'justify-content-start justify-content-around justify-content-between justify-content-evenly justify-content-center justify-content-end' // 横向对齐 (由于最终使用的是Wrap组件，另外横向对齐 只支持左对齐，右对齐，居中对齐)
            classNames: 'align-self-bottomCenter align-self-bottomLeft align-self-bottomRight align-self-center align-self-centerLeft align-self-centerRight align-self-topCenter align-self-topLeft align-self-topRight ' // 横向对齐
            classNames: 'align-bottomCenter align-bottomLeft align-bottomRight align-center align-centerLeft align-centerRight align-topCenter align-topLeft align-topRight ' // 横向对齐
            classNames: 'border-radius-4  border-color-red border-1' // 边框
            classNames: 'mt-10 mb-10 h-160-px bg-black ' // 只支持 bg-  背景色
            classNames: 'shadow-color-black shadow-blurRadius-4 shadow-offset-1,1' // 阴影
            height: 160,
            decoration: BoxDecoration(),
            childRef: ,
            child: ,
            children:[],
        )
```

### H5Row
BCol 根据 classNames 进行排列和显示。
能支持的  classNames  大概列在下面
```dart
        H5Row(
            classNames: 'col-12 col-lg-6 col-xl-4 m-3 m-xl-2 d-none d-sm-block',
            children: child,
        ),
        H5Row(
          classNames: 'align-items-start align-items-center align-items-end ' // 纵向对齐
          classNames: 'justify-content-start justify-content-around justify-content-between justify-content-evenly justify-content-center justify-content-end' // 横向对齐 (由于最终使用的是Wrap组件，另外横向对齐 只支持左对齐，右对齐，居中对齐)
          classNames: 'align-self-bottomCenter align-self-bottomLeft align-self-bottomRight align-self-center align-self-centerLeft align-self-centerRight align-self-topCenter align-self-topLeft align-self-topRight ' // 横向对齐
          classNames: 'align-bottomCenter align-bottomLeft align-bottomRight align-center align-centerLeft align-centerRight align-topCenter align-topLeft align-topRight ' // 横向对齐
          classNames: 'mt-10 mb-10 bg-black ' // 只支持 bg-  背景色
          classNames: 'w-150-px h-160-px maxHeight-150-px minHeight-150-px minWidth-150-px maxWidth-150-px' //
          classNames: 'shadow-color-black12 shadow-blurRadius-2 shadow-offset-1,1' // 阴影
          classNames: 'border-radius-4  border-color-red border-1' // 边框
          classNames: 'hoverColor-green hoverBorderColor-blue hoverBorder-2 ' //
          children:[],
      )
```




## Helper
### BootstrapTheme
关于当前屏幕大小和断点(breakPoints)的信息由BootstrapTheme返回。
为此，只需执行以下函数即可。

```dart
    final screenData = BootstrapTheme.of(context);
```

它还提供了有用的功能。例如，查询当前断点(breakPoints)是大于还是小于某个断点(breakPoints)。

```dart
    final screenData = BootstrapTheme.of(context);
    screenData.currentBreakPoint.isBreakPointOrSmaller(screenData.breakPoints.xl);

    screenData.currentBreakPoint.isBreakPointOrLarger(screenData.breakPoints.xl);
```

### Functions
有一些辅助函数可以将引导功能添加到Flutter小部件中：

```dart
    // e.g. add a 4rem margin-top to a Container
    Container(
      margin: margin(context, 'mt-4'),
    );

    // e.g. add a 2rem padding to a Container
    Container(
      margin: padding(context, 'p-2'),
    );
    
    // add a borderRadius to a Container
    Container(
      decoration: BoxDecoration(
        borderRadius: rounded(context), // rounded1 rounded2 rounded3 rounded4 rounded5 roundedPill
      ),
    );

    // add a border to a Container
    Container(
      decoration: BoxDecoration(
        border: borderPrimary(context), // borderSecondary, borderSuccess, borderDanger, etc...
      ),
    );


    // responsiveValue & responsiveValueOrNull
    // 如果您需要为不同的断点(breakPoints)设置不同的值
    final width = responsiveValue<double>(context, defaultValue: 300.0, md: 350.0, xl: 400.0);
```
