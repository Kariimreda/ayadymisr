import 'package:ayadymisr/account/controllers/account_controller.dart';
import 'package:ayadymisr/account/screens/adresses_screen.dart';
import 'package:ayadymisr/account/widgets/edit_account_form.dart';
import 'package:ayadymisr/account/widgets/edit_password_form.dart';
import 'package:ayadymisr/core/api_client.dart';
import 'package:ayadymisr/core/global/my_strings.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A screen that allows the user to edit his account information or password.
class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({Key? key}) : super(key: key);

  /// A route Name used for navigating and transition animations.
  static const String routeName = '/edit_info';

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  final accountController = Get.put(AccountController());

  ///arguments from the previous screen, used to determine which form to open.
  /// it is of type [AccountFormType].
  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MySize.height * 0.02),
                SizedBox(
                  width: MySize.width * 0.6,
                  height: MySize.height * 0.2,
                  child: Image.asset(MyStrings.logoPath),
                ),
                SizedBox(height: MySize.height * 0.05),
                // if the user is editing their account information, open the account form.
                arguments == AccountFormType.editInfo
                    ? EditAccountForm(accountController: accountController)
                    // if the user is editing their password, open the password form.
                    : arguments == AccountFormType.editPassword
                        ? EditPasswordForm(accountController: accountController)
                        // if the user is editing their address, open the address screen.
                        : arguments == AccountFormType.editAdress
                            ? const AdressesScreen()

                            //otherwise open a dummy screen used to test the [Api] client class.
                            //TODO: Remove this dummy screen and replace it with manage Wishlist screen.
                            : Center(
                                child: ButtonControllers()
                                    .customRoundedLoaderButton(
                                  context,
                                  text: "Press ME",
                                  onPressed: () async {
                                    // await dioClient.request(
                                    //     HttpMethod.get, 'google.com');

                                    try {
                                      final response =
                                          await Api().dio.get('/sdkdjf');
                                      print(response);
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                ),
                              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
