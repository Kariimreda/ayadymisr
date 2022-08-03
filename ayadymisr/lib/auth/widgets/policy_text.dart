import 'package:ayadymisr/auth/controllers/signup_controler.dart';
import 'package:ayadymisr/core/my_strings.dart';
import 'package:ayadymisr/style/my_colors.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Obx;
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

/// A row that shows the accept policy checkbox and a link to the policy.
class PolicyText extends StatelessWidget {
  const PolicyText({
    Key? key,
    required this.signupController,
  }) : super(key: key);

  /// a [SignupController] that manages signup requests.
  final SignupController signupController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: MyPadding.hPadding,
        child: Row(
          children: [
            Text('Auth.Signup.Policy1'.tr()),
            SizedBox(width: MySize.width * 0.01),
            InkWell(
              onTap: () async {
                if (!await launchUrl(
                  MyStrings.privacyPolicyUri,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not launch ${MyStrings.privacyPolicyUri}';
                }
              },
              child: Text(
                'Auth.Signup.Policy2'.tr(),
                style: const TextStyle(
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Checkbox(
              value: signupController.agreePolicyController.value,
              onChanged: (value) {
                signupController.agreePolicyController.value = value!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
