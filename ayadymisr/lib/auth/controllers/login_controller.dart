import 'package:ayadymisr/Layout/Ui/Layout.dart';
import 'package:ayadymisr/auth/screens/forgot_password_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

/// a controller responsible for managing user login, extends
/// the [GetxController].
///
/// To create or find a controller use:
/// ```dart
/// Get.Put<LoginController>(); // Creates a new instance of this controller.
/// or
/// Get.find<LoginController>(); // Looks for an instance of this controller.
/// ```
class LoginController extends GetxController {
  /// Email text editing controller.
  final _emailController = TextEditingController();

  /// Password text editing controller.
  final _passwordController = TextEditingController();

  /// the email text editing controller.
  TextEditingController get emailController => _emailController;

  /// the password text editing controller.
  TextEditingController get passwordController => _passwordController;

  /// Indicates whether [LoginController] is currently loading data or not.
  /// This is used to show a loading indicator while the data is being loaded.
  final isLoading = false.obs;

  /// Logs in the user the user and navigates to the [Layout] screen.
  Future<void> login() async {
    // set [isLoading] to true to show a loading indicator.
    isLoading.value = true;
    // dummy login duration.
    await Future.delayed(const Duration(seconds: 2));
    // set [isLoading] to false to hide the loading indicator.
    isLoading.value = false;
    // print('Login Success');
    // navigate to the [Layout] screen.
    Get.offAndToNamed(Layout.routeName);
  }

  /// Opens the [ForgotPasswordScreen] screen.
  void forgotPassword() {
    // navigate to the [ForgotPasswordScreen] screen.
    Get.toNamed(ForgotPasswordScreen.routeName);
  }

  /// Resets user password by sending a reset request to the user email.
  Future<void> resetPassword() async {
    // set [isLoading] to true to show a loading indicator.
    isLoading.value = true;
    // dummy reset password duration.
    await Future.delayed(const Duration(seconds: 2));
    // set [isLoading] to false to hide the loading indicator.
    isLoading.value = false;
    // print('code sent');
    // go to previous screen
    Get.back();
    //show a default get dialouge with a success message
    Get.defaultDialog(
      title: 'Auth.Login.Success'.tr(),
      middleText: 'Auth.Login.CheckEmail'.tr(),
      middleTextStyle: const TextStyle(fontSize: 16),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
