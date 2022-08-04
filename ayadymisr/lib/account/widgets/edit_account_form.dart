import 'package:ayadymisr/account/controllers/account_controller.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

/// A form to edit an [Account] info.
class EditAccountForm extends StatefulWidget {
  const EditAccountForm({
    Key? key,
    required this.accountController,
  }) : super(key: key);

  /// an [AccountController] that handles all [Account] related requests.
  final AccountController accountController;

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  @override
  Widget build(BuildContext context) {
    final accountController = widget.accountController;
    //form key used to validate the form
    final formKey = GlobalKey<FormState>();

    return Obx(
      () {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    keyboardType: TextInputType.name,
                    controller: accountController.firstNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: MyValidators.instance.getNameValidator().build(),
                    hintText: 'Auth.Signup.FirstName'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    keyboardType: TextInputType.name,
                    controller: accountController.lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: MyValidators.instance.getNameValidator().build(),
                    hintText: 'Auth.Signup.LastName'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    keyboardType: TextInputType.emailAddress,
                    controller: accountController.emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        MyValidators.instance.getEmailValidator().build(),
                    hintText: 'Auth.Signup.Email'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    keyboardType: TextInputType.phone,
                    controller: accountController.phoneNumberController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        MyValidators.instance.getPhoneValidator().build(),
                    hintText: 'Auth.Signup.Phone'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  ButtonControllers().customRoundedLoaderButton(
                    context,
                    text: 'Auth.Signup.Next'.tr(),
                    controller: accountController,
                    onPressed: () => editInfo(formKey, accountController),
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

  /// if the form is valid, it will call the [AccountController] to edit the [Account] info.
  /// if the form is invalid, it will show a error text under Text Forms.
  void editInfo(
    final formKey,
    final AccountController accountController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      accountController.editAccountInfo();
    }
  }
}
