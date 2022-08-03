import 'package:ayadymisr/InternetChecker/Screen.dart';
import 'package:ayadymisr/Layout/Ui/Layout.dart';
import 'package:ayadymisr/Modules/Ui/splashScreen.dart';
import 'package:ayadymisr/account/screens/edit_info_screen.dart';
import 'package:ayadymisr/account/screens/my_account_screen.dart';
import 'package:ayadymisr/auth/screens/forgot_password_screen.dart';
import 'package:ayadymisr/auth/screens/login_screen.dart';
import 'package:ayadymisr/auth/screens/signup_screen.dart';
import 'package:ayadymisr/category/screens/category_screen.dart';
import 'package:ayadymisr/core/locales.dart';
import 'package:ayadymisr/firebase_options.dart';
import 'package:ayadymisr/product/screens/product_screen.dart';
import 'package:ayadymisr/style/my_colors.dart';
import 'package:ayadymisr/widgets/restartAppWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

/// The main app widget. The starting point of the app.
///
/// It contains the [GetMaterialApp] widget, which is a part of the
/// [Get] State management Framework (GetX).
///
/// Before the app starts:
///   * [SplashScreen] is displayed.
///   * locale is initialized through the [EasyLocalization] plugin.
///   * prefered orientation is set to [DeviceOrientation.portraitUp].
///   * default [Locale] is 'ar'.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // whenever your initialization is completed, remove the splash screen:
  runApp(
    EasyLocalization(
      supportedLocales: MyLocales.supportedLocales,
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: MyLocales.supportedLocales[0],
      startLocale: MyLocales.supportedLocales[0],
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}

/// The main app widget. The starting point of the app.
///
/// * [ThemeData] is set with the app's primary swatch.
/// * The app pages are set along with their transition animations.
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: RestartWidget(
        child: GetMaterialApp(
          theme: ThemeData(
            primarySwatch: MyColors.primaryMaterialColor.mdColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          getPages: [
            GetPage(
              name: LoginScreen.routeName,
              page: () => const LoginScreen(),
            ),
            GetPage(
              name: SignupScreen.routeName,
              page: () => const SignupScreen(),
              transition: Transition.leftToRightWithFade,
            ),
            GetPage(
              name: ForgotPasswordScreen.routeName,
              page: () => const ForgotPasswordScreen(),
              transition: Transition.leftToRightWithFade,
            ),
            GetPage(
              name: Layout.routeName,
              page: () => const Layout(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: SplashScreen.routeName,
              page: () => const SplashScreen(),
              transition: Transition.fade,
            ),
            GetPage(
              name: AccountScreen.routeName,
              page: () => const AccountScreen(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: EditInfoScreen.routeName,
              page: () => const EditInfoScreen(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: ProductScreen.routeName,
              page: () => const ProductScreen(),
              transition: Transition.zoom,
            ),
            GetPage(
              name: CategoryScreen.routeName,
              page: () => const CategoryScreen(),
              transition: Transition.downToUp,
            ),
            GetPage(
                name: NoInternetConnection.routeName,
                page: () => const NoInternetConnection(),
                transition: Transition.downToUp),
          ],
        ),
      ),
    );
  }
}
