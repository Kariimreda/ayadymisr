//class and list of supported locales for the application

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///Defualt locale is index 0
///
///   * Use [supportedLocales] of [0] for defualt locale, or [1] for second locale ...
///   * Get the number of locales by using [supportedLocales.length].
///   * Get Current locale by using [currentLocale].
///
///  Example:
/// ```dart
/// final myLocalesController = Get.put(MyLocales());
/// myLocalesController.setLocale(supportedLocales[supportedLocales.length - 1]);
/// print(myLocalesController.currentLocale.value.languageCode); //prints 'en'
/// ```
class MyLocales extends GetxController {
  //current Locale

  /// list of supported locales
  static const supportedLocales = [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ];

  /// list of supported locales names
  static const supportedLocalesNames = [
    'العربية',
    'English',
  ];

  /// list of supported locales codes
  static const supportedLocalesCodes = [
    'ar',
    'en',
  ];

  /// current app locale
  final currentLocale = supportedLocales[0].obs;

  /// updates device locale, takes [context] and [index] of supported locales as parameters
  ///
  /// * [index] is the index of supported locales in [supportedLocales]
  ///
  /// * [context] is the current [BuildContext].

  void setDeviceLocale(BuildContext context, int index) {
    //make sure the index is in range
    if (index < 0 || index >= supportedLocales.length) {
      return;
    }
    EasyLocalization.of(context)!.setLocale(supportedLocales[index]).then(
          (value) => currentLocale.value = supportedLocales[index],
        );
  }
}
