import 'package:ayadymisr/account/controllers/adress_controller.dart';
import 'package:ayadymisr/account/widgets/adress_tile.dart';
import 'package:ayadymisr/account/widgets/edit_adress_form.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

/// A Screen that shows a list of user addresses, allowning them to edit or create new ones.
///
/// Each [Address] is displayed as an [AdressTile] inside a list view builder.
class AdressesScreen extends StatefulWidget {
  const AdressesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdressesScreen> createState() => _AdressesScreenState();
}

class _AdressesScreenState extends State<AdressesScreen> {
  /// an [AddressController] that handles all [Address] related requests.
  final addressController = Get.put(AddressController());

  @override
  void initState() {
    // once the screen is initialized, load the addresses from the server.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addressController.getAdresses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // opens an address form meant for creating a new address.
    // no address to edit was passed, thus the form is meant for creating a new address.
    void buttonPressed() {
      //clear any data in the form
      addressController.newAdressForm();
      //open the form
      Get.to(() => EditAdressForm(addressController: addressController));
    }

    return Obx(
      () => addressController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: MyColors.primaryDark,
            ))
          : Column(
              children: [
                ButtonControllers().customRoundedLoaderButton(
                  context,
                  onPressed: buttonPressed,
                  text: 'Settings.AddAddress'.tr(),
                ),
                SizedBox(height: MySize.height * 0.02),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.hardEdge,
                  itemBuilder: (context, index) {
                    return AdressTile(
                      index: index,
                      addressController: addressController,
                    );
                  },
                  itemCount: addressController.adresses.length,
                ),
              ],
            ),
    );
  }
}
