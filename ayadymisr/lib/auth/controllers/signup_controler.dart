import 'package:ayadymisr/auth/screens/login_screen.dart';
import 'package:ayadymisr/style/my_colors.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

import 'package:easy_localization/easy_localization.dart';

/// Defines user login state or step
///
/// * [personalInfo] : first step of sign up, user enters his personal info.
/// * [password] : second step of sign up, user sets his password and agrees to the policy.
enum SignUpState {
  personalInfo,
  password,
}

/// a controller responsible for managing user sign up, extends
///   the [GetxController].
///
/// To create or find a controller use:
/// ```dart
/// Get.Put<SignUpController>(); // Creates a new instance of this controller.
/// or
/// Get.find<SignUpController>(); // Looks for an instance of this controller.
/// ```
class SignupController extends GetxController {
  /// the current sign up state.
  final _signupState = SignUpState.personalInfo.obs;

  /// the current sign up state.
  SignUpState get signupState => _signupState.value;

  /// sets the current [_signupState] with the input [state].
  void setLoginState(SignUpState state) => _signupState.value = state;

  /// the first name text editing controller.
  final _firstNameController = TextEditingController();

  /// the last name text editing controller.
  final _lastNameController = TextEditingController();

  /// the email text editing controller.
  final _emailController = TextEditingController();

  /// the phone text editing controller.
  final _phoneController = TextEditingController();

  /// the password text editing controller.
  final _passwordController = TextEditingController();

  /// the confirm password text editing controller.
  final _confirmPasswordController = TextEditingController();

  /// the pin text editing controller.
  final _pinController = TextEditingController();

  /// the first name text editing controller.
  TextEditingController get firstNameController => _firstNameController;

  /// the last name text editing controller.
  TextEditingController get lastNameController => _lastNameController;

  /// the email text editing controller.
  TextEditingController get emailController => _emailController;

  /// the phone text editing controller.
  TextEditingController get phoneController => _phoneController;

  /// the password text editing controller.
  TextEditingController get passwordController => _passwordController;

  /// the confirm password text editing controller.
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  /// the pin text editing controller.
  TextEditingController get pinController => _pinController;

  /// Indicates whether [SignupController] is currently loading data or not.
  /// This is used to show a loading indicator while the data is being loaded.
  final isLoading = false.obs;

  /// Indicates whether the user agreed to the policy or not. this should be used
  /// as a checkbox value.
  final agreePolicyController = false.obs;

  /// Signs up the user with the given information.
  Future<void> signUp() async {
    //if user didnt agree to the policy, show error
    if (!agreePolicyController.value) {
      Get.snackbar(
        'Auth.Signup.Error'.tr(),
        'Auth.Signup.AgreePolicy'.tr(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.primaryDark,
        colorText: MyColors.white,
        borderRadius: MyPadding.mPadding,
        isDismissible: true,
        duration: const Duration(milliseconds: 1250),
        icon: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
      );
      return;
    }
    //set loading to true to show loading indicator
    isLoading.value = true;
    //dummy delay to simulate loading
    await Future.delayed(const Duration(seconds: 2));
    //set loading to false to hide loading indicator
    isLoading.value = false;
    // print('Signup Success');
    //go to login screen
    Get.offAllNamed(LoginScreen.routeName);
  }
}
