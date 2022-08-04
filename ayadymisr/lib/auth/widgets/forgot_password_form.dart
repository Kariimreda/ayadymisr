import 'package:ayadymisr/auth/controllers/login_controller.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

/// A widget that shows a form to reset password.
class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  /// a [LoginController] that manages login requests.
  final LoginController loginController;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    final loginController = widget.loginController;
    //form key used to validate the form.
    final formKey = GlobalKey<FormState>();

    return Obx(
      () {
        return Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.emailAddress,
                      controller: loginController.emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: MyValidators.instance
                          .getEmailOrPhoneValidator()
                          .build(),
                      prefixWidget: const Icon(Icons.email_outlined),
                      hintText: 'Auth.Signup.Email'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.05),
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Auth.Signup.Next'.tr(),
                      controller: loginController,
                      onPressed: () => reset(formKey, loginController),
                      isLoading: loginController.isLoading,
                    ),
                    SizedBox(height: MySize.height * 0.01),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// resets the user password if the form is valid.
  void reset(
    final formKey,
    final loginController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      //reset password.
      loginController.resetPassword();
    }
  }
}
