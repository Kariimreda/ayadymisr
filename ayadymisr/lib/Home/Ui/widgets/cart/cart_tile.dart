import 'package:ayadymisr/Home/Controllers/cart_controller.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ui' as ui;

/// A tile that represents a [CartItem].
class CartTile extends StatefulWidget {
  const CartTile({Key? key, required this.index, required this.cartController})
      : super(key: key);

  /// index of the [CartItem] in [CartController.cartItems].
  final int index;

  /// The [CartController] that manages the cart.
  final CartController cartController;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile>
    with SingleTickerProviderStateMixin {
  /// Animation that shows a delete slide action.
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: Directionality.of(context) == ui.TextDirection.rtl
        ? const Offset(5, 0)
        : const Offset(8, 0),
    end: Directionality.of(context) == ui.TextDirection.rtl
        ? const Offset(0, 0)
        : const Offset(3, 0),
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut,
  ));
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //show animation on the first cart item
  @override
  void initState() {
    super.initState();
    widget.index == 0 ? repeatOnce() : null;
  }

  void repeatOnce() async {
    await controller.forward();
    await controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = widget.cartController;
    final index = widget.index;

    final formKey = GlobalKey<FormState>();

    final qunatTextEditingController = TextEditingController();
    qunatTextEditingController.text =
        cartController.cartItems[index].quantity.toString();
    final quant = cartController.cartItems[index].quantity.obs;
    return Slidable(
      useTextDirection: false,

      // Specify a key if the Slidable is dismissible.
      key: UniqueKey(),

      // The start action pane is the one at the left or the top side.
      endActionPane: ActionPane(
        extentRatio: 0.4,
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        closeThreshold: 0.2,
        openThreshold: 0.21,

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(
            dismissThreshold: 0.8,
            onDismissed: () {
              cartController.removeItem(index);
            }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            borderRadius: MyRadius.mCircularRadius,
            onPressed: null,
            autoClose: false,
            backgroundColor: MyColors.error,
            foregroundColor: MyColors.white,
            icon: Icons.delete_outline_rounded,
            label: 'Cart.Remove'.tr(),
          ),
        ],
      ),

      child: Stack(
        children: [
          Obx(
            () => Padding(
              padding: MyPadding.hvPadding,
              child: Container(
                height: MySize.height * 0.15,
                decoration: BoxDecoration(
                  color: MyColors.grey!.withOpacity(0.05),
                  borderRadius: MyRadius.mCircularRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MySize.width * 0.35,
                      height: double.infinity,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: MyRadius.mCircularRadius,
                        child: Image.network(
                          cartController.cartItems[index].imageUrl,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                              child: CircularProgressIndicator(
                                color: MyColors.primary,
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MyPadding.mPadding,
                            ),
                            Padding(
                              padding: MyPadding.hPadding,
                              child: Text(
                                cartController.cartItems[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: MyColors.primaryDark,
                                  fontSize: MySize.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: MyPadding.shPadding,
                              child: TextControllers().customPlusMinusFormField(
                                  cartController, index, quant),
                            ),
                            TextControllers().customThreeTextRow(
                              text: cartController.cartItems[index].pricePerItem
                                  .toString(),
                              titleText: 'Cart.PricePerItem'.tr(),
                              suffixText: 'Cart.Currency'.tr(),
                            ),
                            TextControllers().customThreeTextRow(
                              text: (cartController
                                          .cartItems[index].pricePerItem *
                                      quant.value)
                                  .toPrecision(2)
                                  .toString(),
                              titleText: 'Cart.Total'.tr(),
                              suffixText: 'Cart.Currency'.tr(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SlideTransition(
            position: offsetAnimation,
            child: Padding(
              padding: MyPadding.svPadding,
              child: Container(
                height: MySize.height * 0.15,
                width: MySize.width * 0.25,
                decoration: BoxDecoration(
                  color: MyColors.error,
                  borderRadius: MyRadius.mCircularRadius,
                ),
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: MyColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
