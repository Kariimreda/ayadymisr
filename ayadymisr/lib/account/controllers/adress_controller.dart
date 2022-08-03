import 'package:ayadymisr/account/models/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

///  Defines The Address editing mode:
///   * [newAddress] : opens an empty address editing form.
///   * [editAdress] : opens a preloaded address editing form.
enum EditAdressMode {
  newAddress,
  editAdress,
}

/// The controller that handles all [Address] related requests. This class extends
/// [GetxController].
///
/// To create or find an instance of this controller use:
/// ```dart
/// Get.Put<AddressController>(); // Creates a new instance of this controller.
/// or
/// Get.find<AddressController>(); // Looks for an instance of this controller.
/// ```
class AddressController extends GetxController {
  /// List of user's [Address]es.
  final adresses = <Address>[].obs;

  /// Indicates whether [AddressController] is currently loading data or not.
  /// This is used to show a loading indicator while the data is being loaded.
  final isLoading = false.obs;

  /// The current [EditAdressMode] of the address editing form,
  /// defaults to [EditAdressMode.newAdress].
  final editAdressMode = EditAdressMode.newAddress.obs;

  //text editing controllers for the form
  final firstName = TextEditingController().obs;
  final lastName = TextEditingController().obs;
  final firstAdress = TextEditingController().obs;
  final secondAdress = TextEditingController().obs;
  final company = TextEditingController().obs;
  final city = TextEditingController().obs;
  final postalCode = TextEditingController().obs;
  final virtualAddress = false.obs;
  final countryController = ''.obs;
  final governorateController = ''.obs;

  /// First Name Text Editing Controller.
  TextEditingController get firstNameController => firstName.value;

  /// Last Name Text Editing Controller.
  TextEditingController get lastNameController => lastName.value;

  /// First Adress Text Editing Controller.
  TextEditingController get firstAdressController => firstAdress.value;

  /// Second Adress Text Editing Controller.
  TextEditingController get secondAdressController => secondAdress.value;

  /// Company Text Editing Controller.
  TextEditingController get companyController => company.value;

  /// City Text Editing Controller.
  TextEditingController get cityController => city.value;

  /// Postal Code Text Editing Controller.
  TextEditingController get postalCodeController => postalCode.value;

  /// Fills the [EditAddressForm] with the given [Address]. If the [Address] is null,
  /// the form will be empty.
  ///
  /// It sets the corresponding text editing controllers to the [Address]'s properties.
  void newAdressForm({Address? address}) {
    // if given address is not null, set the editAdressMode to newAddress
    editAdressMode.value =
        address == null ? EditAdressMode.newAddress : EditAdressMode.editAdress;
    // if given address is not null, set the text editing controllers to the address's properties
    // otherwise set the text editing controllers to empty strings
    firstName.value.text = address?.firstName ?? '';
    lastName.value.text = address?.lastName ?? '';
    firstAdress.value.text = address?.firstAdress ?? '';
    secondAdress.value.text = address?.secondAdress ?? '';
    company.value.text = address?.company ?? '';
    city.value.text = address?.city ?? '';
    postalCode.value.text = address?.postalCode ?? '';
    virtualAddress.value = address?.virtualAdress ?? false;
    countryController.value = address?.country ?? '';
    governorateController.value = address?.governorate ?? '';
  }

  /// Get the list of addresses associated with the user.
  ///
  /// This sets the [adresses] list.
  Future<void> getAdresses() async {
    //  set isLoading to true to show a loading indicator
    isLoading.value = true;
    //return a dummy account for testing
    await Future.delayed(const Duration(seconds: 2));
    adresses.value = [
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
        company: 'e-aswaaq',
        postalCode: '11111',
        secondAdress: 'this is my second andress',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
    ];

    // set isLoading to false to hide the loading indicator
    isLoading.value = false;
  }
}
