import 'package:ayadymisr/account/controllers/adress_controller.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

/// a form to edit the [Address] of the user, or create a new one.
class EditAdressForm extends StatefulWidget {
  const EditAdressForm({
    Key? key,
    required this.addressController,
  }) : super(key: key);

  /// an [AddressController] that handles all [Address] related requests.
  final AddressController addressController;

  @override
  State<EditAdressForm> createState() => _EditAdressFormState();
}

class _EditAdressFormState extends State<EditAdressForm> {
  @override
  Widget build(BuildContext context) {
    final addressController = widget.addressController;
    //form key used to validate the form.
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Obx(
        () {
          return ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: MySize.height * 0.1),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      hintText: 'Settings.Address.FirstName'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      hintText: 'Settings.Address.LastName'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.companyController,
                      hintText: 'Settings.Address.Company'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.firstAdressController,
                      hintText: 'Settings.Address.FirstAddress'.tr(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.secondAdressController,
                      hintText: 'Settings.Address.SecondAddress'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.cityController,
                      hintText: 'Settings.Address.City'.tr(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.firstAdressController,
                      hintText: 'Settings.Address.PostalCode'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    Padding(
                      padding: MyPadding.hPadding,
                      child: CSCPicker(
                        showCities: false,
                        countryDropdownLabel: 'Settings.Address.Country'.tr(),
                        stateDropdownLabel: 'Settings.Address.Governorate'.tr(),
                        currentCountry:
                            addressController.countryController.value == ''
                                ? null
                                : addressController.countryController.value,
                        currentState:
                            addressController.governorateController.value == ''
                                ? null
                                : addressController.governorateController.value,
                        defaultCountry: DefaultCountry.Egypt,

                        ///triggers once country selected in dropdown
                        onCountryChanged: onCountryChanged,
                        onCityChanged: onCityChanged,
                        flagState: CountryFlag.DISABLE,

                        ///triggers once state selected in dropdown
                        onStateChanged: onGovChanged,
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Auth.Signup.Next'.tr(),
                      controller: addressController,
                      onPressed: () => editInfo(formKey, addressController),
                      isLoading: addressController.isLoading,
                    ),
                    SizedBox(height: MySize.height * 0.01),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// [CSCPicker.onStateChanged] callback, sets [AddressController.governorateController] to the selected state.
  void onGovChanged(String? value) {
    widget.addressController.governorateController.value = value ?? '';
  }

  /// [CSCPicker.onCountryChanged] callback, sets [AddressController.countryController] to the selected country.
  void onCountryChanged(String value) {
    widget.addressController.countryController.value = value;
  }

  /// [CSCPicker.onCityChanged] callback, has no effect, however it is used
  /// to avoid null exceptions in the [CSCPicker] widget.
  void onCityChanged(String? value) {
    return;
  }

  /// Saves the user's [Address] information to the server if the form is valid.
  /// If the form is invalid, it displays error text under form fields.
  void editInfo(
    final formKey,
    final AddressController addressController,
  ) async {
    // if no governorate was selected, alert the user then return.
    if (addressController.governorateController.value == '' ||
        addressController.governorateController.value ==
            'Settings.Address.Governorate'.tr()) {
      Get.dialog(
        AlertDialog(
          title: Text('Settings.Address.Governorate'.tr()),
          content: Text('Settings.Address.GovernorateError'.tr()),
        ),
      );
      return;
    }
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      // edit address.
    }
  }
}
