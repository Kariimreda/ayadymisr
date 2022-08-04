import 'package:ayadymisr/auth/controllers/login_controller.dart';
import 'package:ayadymisr/auth/widgets/login_form.dart';
import 'package:ayadymisr/core/global/my_strings.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// a screen that allows the user to login.
/// It shows a [LoginForm] widget.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  /// a route Name used for navigating and transtion animations.
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// a [LoginController] that manages login requests.
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MySize.height * 1.2,
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
              LoginForm(loginController: loginController),
            ],
          ),
        ),
      ),
    );
  }
}
