import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Global [double] Sizes for this app.
class MySize {
  /// Width of the screen.
  static double width = Get.width;

  /// Height of the screen.
  static double height = Get.height;
}

/// Global [Padding] for this app.
class MyPadding {
  /// a symmetric horizontal padding of [MySize.width] * 0.05.
  static final hPadding = EdgeInsets.symmetric(horizontal: MySize.width * 0.05);

  /// a symmetric horizontal padding of [MySize.width] * 0.02.
  static final shPadding =
      EdgeInsets.symmetric(horizontal: MySize.width * 0.02);

  /// a symmetric vertical padding of [MySize.height] * 0.03.
  static final vPadding = EdgeInsets.symmetric(vertical: MySize.height * 0.03);

  /// a symmetric vertical padding of [MySize.height] * 0.01.
  static final svPadding = EdgeInsets.symmetric(vertical: MySize.height * 0.01);

  /// a symmetric vertical padding of [MySize.height] * 0.005.
  static final xsvPadding =
      EdgeInsets.symmetric(vertical: MySize.height * 0.005);

  /// a symmetric vertical and horizontal padding, equivilant to using both [svPadding] and [hPadding].
  static final hvPadding = EdgeInsets.symmetric(
    horizontal: MySize.width * 0.05,
    vertical: MySize.height * 0.01,
  );

  /// a small [double] padding of [MySize.width] * 0.01.
  static final sPadding = MySize.width * 0.01;

  /// a medium [double] padding of [MySize.width] * 0.03.
  static final mPadding = MySize.width * 0.03;

  /// another medium [double] padding of [MySize.width] * 0.02.
  static final m2Padding = MySize.width * 0.02;

  /// a large [double] padding of [MySize.width] * 0.05.
  static final lPadding = MySize.width * 0.05;

  /// an X large [double] padding of [MySize.width] * 0.075.
  static final xlPadding = MySize.width * 0.075;

  /// a double X large [double] padding of [MySize.width] * 0.1.
  static final xxlPadding = MySize.width * 0.1;
}

/// Global [BorderRadius] for this app.
class MyRadius {
  /// a small [BorderRadius] of radius [MySize.width] * 0.01.
  static final BorderRadius sCircularRadius =
      BorderRadius.circular(MyPadding.sPadding);

  /// a medium [BorderRadius] of radius [MySize.width] * 0.03.
  static final BorderRadius mCircularRadius =
      BorderRadius.circular(MyPadding.mPadding);

  /// a large [BorderRadius] of radius [MySize.width] * 0.1.
  static final BorderRadius lCircularRadius =
      BorderRadius.circular(MyPadding.xxlPadding);
}
