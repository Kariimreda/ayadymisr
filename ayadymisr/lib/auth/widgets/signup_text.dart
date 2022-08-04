import 'package:ayadymisr/auth/screens/signup_screen.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

/// A row that asks the user if he wants to sign up, with an inkwell that opens
/// a [SignupScreen].
class SignUpText extends StatelessWidget {
  const SignUpText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Auth.Login.SignUp1".tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: MyColors.grey,
          ),
        ),
        InkWell(
          borderRadius: MyRadius.mCircularRadius,
          onTap: () {
            Get.toNamed(SignupScreen.routeName);
          },
          child: Padding(
            padding: MyPadding.shPadding,
            child: Text(
              "Auth.Login.SignUp2".tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.primaryDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
