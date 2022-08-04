import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

/// a controller that manages all [Product] requests. extends [GetxController].
///
/// To get an instance of this class, use:
/// ```dart
/// final categoryController = Get.put(ProductController()); //creates a new controller
/// or
/// final categoryController = Get.find<ProductController>(); // finds an existing controller
/// ```
class ProductController extends GetxController {
  /// a quantity Text Editing Controller.
  final quantityController = TextEditingController().obs;

  /// whether the quantity Text was changed.
  final isQuantChanged = false.obs;

  /// whether product is loading. used to show a loading indicator.
  final isLoading = false.obs;

  /// whether product is added to cart.
  final isAddedToCart = false.obs;

  ///Adds a [Product] to cart.
  void addToCart() async {
    /// show loading indicator.
    isLoading.value = true;

    /// dummy delay.
    await Future.delayed(const Duration(seconds: 2), () {
      //show snackbar
      Get.snackbar(
        'Product.CartHasBeenUpdated'.tr(),
        'Product.ItemAddedToCart'.tr(),
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: MyColors.primary,
        ),
        isDismissible: true,
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: MyColors.white.withOpacity(0.4),
      );

      /// hide loading indicator.
      isLoading.value = false;

      /// set isAddedToCart to true.
      isAddedToCart.value = true;
    });
  }
}
