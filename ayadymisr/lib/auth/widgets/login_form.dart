import 'package:ayadymisr/Layout/Ui/Layout.dart';
import 'package:ayadymisr/auth/controllers/login_controller.dart';
import 'package:ayadymisr/auth/widgets/signup_text.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/core/my_strings.dart';
import 'package:ayadymisr/style/my_colors.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_sign_in/google_sign_in.dart';

/// a widget that shows a login form.
class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  /// a [LoginController] that manages login requests.
  final LoginController loginController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MySize.height * 0.02),
                    const SignUpText(),
                    SizedBox(height: MySize.height * 0.02),
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
                      hintText: 'Auth.Login.Email'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.025),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      isObscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      controller: loginController.passwordController,
                      validator:
                          MyValidators.instance.getPasswordValidator().build(),
                      prefixWidget: const Icon(Icons.lock_outline_rounded),
                      hintText: 'Auth.Login.Password'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                    InkWell(
                      borderRadius: MyRadius.mCircularRadius,
                      onTap: () {
                        loginController.forgotPassword();
                      },
                      child: Padding(
                        padding: MyPadding.hPadding,
                        child: Text(
                          'Auth.Login.ForgotPassword'.tr(),
                          style: TextStyle(
                            fontSize: MySize.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryDark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Auth.Login.Login'.tr(),
                      controller: loginController,
                      onPressed: () => login(formKey, loginController),
                      isLoading: loginController.isLoading,
                    ),
                    SizedBox(height: MySize.height * 0.03),
                    InkWell(
                      borderRadius: MyRadius.mCircularRadius,
                      onTap: () {
                        Get.offAllNamed(Layout.routeName);
                      },
                      child: Padding(
                        padding: MyPadding.hPadding,
                        child: Text(
                          'Auth.Login.ContinueAsGuest'.tr(),
                          style: TextStyle(
                            fontSize: MySize.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryDark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.04),
                    Text(
                      '- ${'Auth.Login.Or'.tr()} -',
                      style: TextStyle(
                        color: MyColors.grey!.withOpacity(0.5),
                        fontSize: MySize.height * 0.03,
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButtonBuilder(
                          onPressed: () async {
                            Get.dialog(
                              const Center(child: CircularProgressIndicator()),
                              barrierDismissible: false,
                            );
                            try {
                              await signInWithGoogle();
                              if (FirebaseAuth.instance.currentUser != null) {
                                Get.offAllNamed(Layout.routeName);
                              }
                            } catch (e) {
                              Get.back();
                              print(e);
                            }
                          },
                          backgroundColor: MyColors.white,
                          elevation: 3,
                          height: MySize.width * 0.12,
                          shape: RoundedRectangleBorder(
                            borderRadius: MyRadius.lCircularRadius,
                          ),
                          text: '',
                          mini: true,
                          image: Image.asset(MyStrings.googleGIconPath),
                          icon: FontAwesomeIcons.google,
                          iconColor: MyColors.black,
                        ),
                        SizedBox(width: MySize.width * 0.075),
                        SignInButtonBuilder(
                          onPressed: () {},
                          backgroundColor: MyColors.facebookColor,
                          elevation: 3,
                          height: MySize.width * 0.12,
                          shape: RoundedRectangleBorder(
                            borderRadius: MyRadius.lCircularRadius,
                          ),
                          text: '',
                          mini: true,
                          icon: FontAwesomeIcons.facebookF,
                          iconColor: MyColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // logs in the user if the form is valid.
  void login(
    final formKey,
    final loginController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      // log in user.
      loginController.login();
    }
  }
}
