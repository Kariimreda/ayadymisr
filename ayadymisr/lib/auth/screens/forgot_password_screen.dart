import 'package:ayadymisr/auth/controllers/login_controller.dart';
import 'package:ayadymisr/auth/widgets/forgot_password_form.dart';
import 'package:ayadymisr/core/my_strings.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// a screen that allows the user to reset his password.
/// It shows a [ForgotPasswordForm] widget.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  /// a route Name used for navigating and transtion animations.
  static const String routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  /// a [LoginController] that manages login requests.
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MySize.height * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MySize.height * 0.02),
              SizedBox(
                width: MySize.width * 0.6,
                height: MySize.height * 0.2,
                child: Image.asset(MyStrings.logoPath),
              ),
              ForgotPasswordForm(loginController: loginController),
            ],
          ),
        ),
      ),
    );
  }
}
