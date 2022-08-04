import 'package:ayadymisr/auth/controllers/signup_controler.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/core/global/my_size.dart';

import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// a widget that shows a personal info form.
class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({
    Key? key,
    required this.signupController,
  }) : super(key: key);

  /// a [SignupController] that manages signup requests.
  final SignupController signupController;

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  @override
  Widget build(BuildContext context) {
    final signupController = widget.signupController;

    //form key used to validate the form.
    final registerFormKey = GlobalKey<FormState>();

    return ListView(
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
                controller: signupController.firstNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Auth.Signup.FirstName'.tr(),
                validator: MyValidators.instance.getNameValidator().build(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.025),
              TextControllers().customTextFormField(
                context,
                padding: MyPadding.hPadding,
                controller: signupController.lastNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Auth.Signup.LastName'.tr(),
                validator: MyValidators.instance.getNameValidator().build(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.025),
              TextControllers().customTextFormField(
                context,
                padding: MyPadding.hPadding,
                controller: signupController.emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: MyValidators.instance.getEmailValidator().build(),
                hintText: 'Auth.Signup.Email'.tr(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.025),
              TextControllers().customTextFormField(
                context,
                padding: MyPadding.hPadding,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: signupController.phoneController,
                keyboardType: TextInputType.phone,
                validator: MyValidators.instance.getPhoneValidator().build(),
                hintText: 'Auth.Signup.Phone'.tr(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.03),
              ButtonControllers().customRoundedLoaderButton(
                context,
                text: 'Auth.Signup.Next'.tr(),
                controller: signupController,
                onPressed: () => nextStep(registerFormKey, signupController),
              ),

              //  SizedBox(height: MySize.height * 0.05),
            ],
          ),
        ),
      ],
    );
  }

  /// Moves the user to the next form if the form is valid.
  void nextStep(
      GlobalKey<FormState> formKey, SignupController signupController) {
    //validate the form.
    if (formKey.currentState!.validate()) {
      //move to next step.
      signupController.setLoginState(SignUpState.password);
    }
  }
}
