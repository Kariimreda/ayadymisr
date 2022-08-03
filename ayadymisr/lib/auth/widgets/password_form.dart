import 'package:ayadymisr/auth/controllers/signup_controler.dart';
import 'package:ayadymisr/auth/widgets/policy_text.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/style/my_size.dart';

import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

/// a widget that shows a password reset form.
class PasswordForm extends StatefulWidget {
  const PasswordForm({
    Key? key,
    required this.signupController,
  }) : super(key: key);

  /// a [SignupController] that manages signup requests.
  final SignupController signupController;

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    final signupController = widget.signupController;

    //form key used to validate the form.
    final registerFormKey = GlobalKey<FormState>();

    return Obx(
      () => ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Form(
            key: registerFormKey,
            child: Column(
              children: [
                SizedBox(height: MySize.height * 0.02),
                TextControllers().customTextFormField(
                  context,
                  padding: MyPadding.hPadding,
                  controller: signupController.passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: 'Auth.Signup.Password'.tr(),
                  isObscureText: true,
                  validator:
                      MyValidators.instance.getPasswordValidator().build(),
                  contentPadding: const EdgeInsets.only(bottom: 5),
                ),
                SizedBox(height: MySize.height * 0.025),
                TextControllers().customTextFormField(
                  context,
                  padding: MyPadding.hPadding,
                  controller: signupController.confirmPasswordController,
                  hintText: 'Auth.Signup.ConfirmPassword'.tr(),
                  isObscureText: true,
                  validator: ((value) {
                    return MyValidators.instance
                        .getConfirmPasswordValidator(value, signupController);
                  }),
                  contentPadding: const EdgeInsets.only(bottom: 5),
                ),
                SizedBox(height: MySize.height * 0.025),
                TextControllers().customTextFormField(
                  context,
                  padding: MyPadding.hPadding,
                  controller: signupController.pinController,
                  hintText: 'Auth.Signup.Pin'.tr(),
                  contentPadding: const EdgeInsets.only(bottom: 5),
                ),
                SizedBox(height: MySize.height * 0.025),
                PolicyText(signupController: signupController),
                SizedBox(height: MySize.height * 0.03),
                ButtonControllers().customRoundedLoaderButton(
                  context,
                  text: 'Auth.Signup.Signup'.tr(),
                  controller: signupController,
                  onPressed: () => signUp(registerFormKey, signupController),
                  isLoading: signupController.isLoading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// signup the user if the form is valid.
  void signUp(
      GlobalKey<FormState> registerFormKey, SignupController signupController) {
    //validate all using form keys
    if (registerFormKey.currentState!.validate()) {
      // sign up the user.
      signupController.signUp();
    }
  }
}
