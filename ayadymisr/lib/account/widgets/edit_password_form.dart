import 'package:ayadymisr/account/controllers/account_controller.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

/// A form to edit an [Account] password.
class EditPasswordForm extends StatefulWidget {
  const EditPasswordForm({
    Key? key,
    required this.accountController,
  }) : super(key: key);

  /// an [AccountController] that handles all [Account] related requests.
  final AccountController accountController;

  @override
  State<EditPasswordForm> createState() => _EditPasswordFormState();
}

class _EditPasswordFormState extends State<EditPasswordForm> {
  @override
  Widget build(BuildContext context) {
    final accountController = widget.accountController;
    // form key used to validate the form.
    final formKey = GlobalKey<FormState>();

    return Obx(
      () {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    keyboardType: TextInputType.visiblePassword,
                    controller: accountController.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    isObscureText: true,
                    validator:
                        MyValidators.instance.getPasswordValidator().build(),
                    hintText: 'Auth.Signup.Password'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    isObscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: accountController.confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        MyValidators.instance.getConfirmPasswordValidator(
                      value,
                      accountController,
                    ),
                    hintText: 'Auth.Signup.ConfirmPassword'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  ButtonControllers().customRoundedLoaderButton(
                    context,
                    text: 'Auth.Signup.Next'.tr(),
                    controller: accountController,
                    onPressed: () => editPassword(formKey, accountController),
                    isLoading: accountController.isLoading,
                  ),
                  SizedBox(height: MySize.height * 0.01),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /// Edits the [Account] password if the form is valid.
  /// otherwise, show error text under form fields.
  void editPassword(
    final formKey,
    final AccountController accountController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      //edit password.
      accountController.editPassword();
    }
  }
}
