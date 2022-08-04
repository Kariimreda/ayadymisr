import 'package:ayadymisr/account/controllers/account_controller.dart';
import 'package:ayadymisr/account/screens/edit_info_screen.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

/// A screen that helps the user edit his account info or addresses,
/// it presents the user with 4 buttons, one for each [AccountFormType] value.
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  /// a route Name used to navigate to this screen and for transition animations.
  static const String routeName = '/account';
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  /// an [AccountController] used to get the user's account information.
  final accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
            backgroundColor: MyColors.white,
            body: accountController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: MyColors.primaryDark,
                  ))
                : SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: SizedBox(
                      height: MySize.height * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: MySize.height * 0.02), //arrow back
                          // Padding(
                          //   padding: MyPadding.shPadding,
                          //   child: IconButton(
                          //     icon: Icon(
                          //       Icons.arrow_back_ios_rounded,
                          //       size: MyPadding.lPadding * 1.5,
                          //     ),
                          //     onPressed: () => Get.back(),
                          //     color: MyColors.primary,
                          //   ),
                          // ),
                          // SizedBox(height: MySize.height * 0.02),
                          // Center(
                          //   child: SizedBox(
                          //     width: MySize.width * 0.6,
                          //     height: MySize.height * 0.2,
                          //     child: Image.asset(MyStrings.logoPath),
                          //   ),
                          // ),

                          // const Spacer(),
                          Padding(
                            padding: MyPadding.hPadding,
                            child: Row(
                              children: [
                                Text(
                                  'Settings.Account.Welcome'.tr(),
                                  style: TextStyle(
                                    fontSize: MySize.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: MySize.width * 0.03),
                                Text(
                                  '${accountController.account[0].firstName} ${accountController.account[0].lastName}',
                                  style: TextStyle(
                                    fontSize: MySize.width * 0.05,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MySize.height * 0.04),
                          //4 buttons to navigate to different screens
                          Center(
                            child:
                                ButtonControllers().customRoundedLoaderButton(
                              context,
                              onPressed: () =>
                                  goToNextScreen(AccountFormType.editInfo),
                              text: 'Settings.Account.EditAccountInfo'.tr(),
                            ),
                          ),
                          SizedBox(height: MySize.height * 0.02),
                          //4 buttons to navigate to different screens
                          Center(
                            child:
                                ButtonControllers().customRoundedLoaderButton(
                              context,
                              onPressed: () =>
                                  goToNextScreen(AccountFormType.editPassword),
                              text: 'Settings.Account.ChangePassword'.tr(),
                            ),
                          ),
                          SizedBox(height: MySize.height * 0.02),
                          //4 buttons to navigate to different screens
                          Center(
                            child:
                                ButtonControllers().customRoundedLoaderButton(
                              context,
                              onPressed: () =>
                                  goToNextScreen(AccountFormType.editAdress),
                              text: 'Settings.Account.ChangeAdresses'.tr(),
                            ),
                          ),
                          SizedBox(height: MySize.height * 0.02),
                          //4 buttons to navigate to different screens
                          Center(
                            child:
                                ButtonControllers().customRoundedLoaderButton(
                              context,
                              onPressed: () =>
                                  goToNextScreen(AccountFormType.editWishlist),
                              text: 'Settings.Account.ChangeWishlist'.tr(),
                            ),
                          ),

                          const Spacer(),
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }

  /// Navigates to the [EditInfoScreen], and depending on
  /// the [AccountFormType] value, its shows different forms.
  void goToNextScreen(AccountFormType type) {
    Get.back();
    Get.toNamed(EditInfoScreen.routeName, arguments: type);
  }
}
