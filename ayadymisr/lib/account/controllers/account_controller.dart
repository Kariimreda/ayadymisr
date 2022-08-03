import 'package:ayadymisr/account/models/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

/// Defines the type or states of the account editing forms.
///
///   * [editInfo]: The user is editing their personal info
///   * [editAddress]: The user is editing their addresses or creating new ones.
///   * [editPassword]: The user is editing their password.
///   * [editWishlist]: The user is editing their wishlist.
///
/// can switch between these states by using the [AccountController]
enum AccountFormType {
  editInfo,
  editPassword,
  editAdress,
  editWishlist,
}

/// The controller that handles all [Account] related requests. This class extends
/// [GetxController].
///
///  To create or find an instance of this controller use:
/// ```dart
/// Get.Put<AccountController>(); // Creates a new instance of this controller.
/// or
/// Get.find<AccountController>(); // Looks for an instance of this controller.
/// ```
class AccountController extends GetxController {
  /// The User that is currently logged in.
  final account = <Account>[].obs;

  /// Indicates whether [AccountController] is currently loading data or not.
  /// This is used to show a loading indicator while the data is being loaded.
  final isLoading = false.obs;

  //text editing controllers for
  //first name
  final firstNameTextEditingController = TextEditingController();
  //last name
  final lastNameTextEditingController = TextEditingController();
  //email
  final emailTextEditingController = TextEditingController();
  //password
  final passwordTextEditingController = TextEditingController();
  //confirm password
  final confirmTextEditingPasswordController = TextEditingController();
  //phone number
  final phoneNumberTextEditingController = TextEditingController();

  /// First Name Text Editing Controller
  TextEditingController get firstNameController =>
      firstNameTextEditingController;

  /// Last Name Text Editing Controller
  TextEditingController get lastNameController => lastNameTextEditingController;

  /// Email Text Editing Controller
  TextEditingController get emailController => emailTextEditingController;

  /// Password Text Editing Controller
  TextEditingController get passwordController => passwordTextEditingController;

  /// Confirm Password Text Editing Controller
  TextEditingController get confirmPasswordController =>
      confirmTextEditingPasswordController;

  /// Phone Number Text Editing Controller
  TextEditingController get phoneNumberController =>
      phoneNumberTextEditingController;

  @override
  void onInit() {
    super.onInit();
    //get the user's account info when the controller is created.
    getAccount();
  }

  /// Loads the user's account info into [account].
  ///
  /// This method is called when the controller is created.
  void getAccount() async {
    //set the loading indicator to true, this will show a
    // loading indicator while the data is being loaded.
    isLoading.value = true;
    //return a dummy account for testing
    await Future.delayed(const Duration(seconds: 2));
    account.add(
      Account(
          id: 1, firstName: 'youssef', lastName: 'zaka', phone: '01064504003'),
    );
    //set the loading indicator to false, this will hide the
    // loading indicator once the data is loaded.
    isLoading.value = false;
  }

  /// Saves the user's account info.
  ///
  /// This method is called when the user clicks the save button.
  Future<void> editAccountInfo() async {
    //set the loading indicator to true, this will show a
    // loading indicator while the data is being loaded.
    isLoading.value = true;
    //dummy delay to simulate a loading time.
    await Future.delayed(const Duration(seconds: 2));
    //set the loading indicator to false, this will hide the
    // loading indicator once the data is loaded.
    isLoading.value = false;
    //print('code sent');
    //Go back to the previous screen.
    Get.back();
    //show a default get dialouge with a success message
    Get.defaultDialog(
      title: 'Auth.Login.Success'.tr(),
      middleText: '',
      middleTextStyle: const TextStyle(fontSize: 0),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  /// Saves the user's password.
  ///
  /// This method is called when the user clicks the save button.
  Future<void> editPassword() async {
    //set the loading indicator to true, this will show a
    // loading indicator while the data is being loaded.
    isLoading.value = true;
    //dummy delay to simulate a loading time.
    await Future.delayed(const Duration(seconds: 2));
    //set the loading indicator to false, this will hide the
    // loading indicator once the data is loaded.
    isLoading.value = false;
    // print('code sent');
    //Go back to the previous screen.
    Get.back();
    //show a default get dialouge with a success message
    Get.defaultDialog(
      title: 'Auth.Login.Success'.tr(),
      middleText: '',
      middleTextStyle: const TextStyle(fontSize: 0),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
