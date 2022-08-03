import 'package:flutter/material.dart';

///
/// * To use just simply provide the RGB value and call the mdColor straight up
/// * e.g.
/// ```dart
/// CustomMaterialColor(88, 207, 194).mdColor
/// ```
///
class CustomMaterialColor {
  final int r;
  final int g;
  final int b;

  CustomMaterialColor(this.r, this.g, this.b);

  MaterialColor get mdColor {
    Map<int, Color> color = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
    return MaterialColor(Color.fromRGBO(r, g, b, 1).value, color);
  }
}

/// Global Colors for this app.
class MyColors {
  /// Primary Color for this app.
  static const Color primary = Color.fromARGB(255, 93, 158, 55);

  /// a Darker version of [primary].
  static const Color primaryDark = Color.fromARGB(255, 66, 87, 72);

  /// Secondary Color for this app.
  static const Color secondary = Color.fromARGB(255, 182, 138, 34);

  /// Background color used in this app.
  static Color background = const Color.fromARGB(255, 231, 245, 230);

  /// constant default white.
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  /// constant default black.
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  /// constant default transparent.
  static const Color transparent = Colors.transparent;

  /// Color used for errors, it is currently set to [Colors.red].
  static const Color error = Colors.red;

  /// default [Colors.grey] weight [600].
  static final Color? grey = Colors.grey[600];

  static const Color facebookColor = Color(0xff39579A);

  /// Primary Swatch Color for this app.
  static final CustomMaterialColor primaryMaterialColor =
      CustomMaterialColor(93, 158, 55);
}
