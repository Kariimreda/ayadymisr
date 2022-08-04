import 'package:ayadymisr/Home/Controllers/cart_controller.dart';
import 'package:ayadymisr/Home/Ui/widgets/cart/empty_cart.dart';
import 'package:ayadymisr/Home/Ui/widgets/cart/error_cart.dart';
import 'package:ayadymisr/Home/Ui/widgets/cart/items_cart.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A Screen that displays the cart items in a list view.
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // a controller that manages the cart
    final cartController = Get.put(CartController());
    // refresh call back for refresh indicator
    Future<void> _pullRefresh() async {
      await cartController.refreshCartItems();
    }

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: cartController.getCartItems(),
          builder: (context, snapshot) {
            return RefreshIndicator(
              backgroundColor: MyColors.primary,
              color: MyColors.white,
              onRefresh: _pullRefresh,
              child: Stack(
                children: [
                  ListView(),
                  Obx(() => futureBuilderBody(snapshot, cartController)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// A future builder body that displays the cart items according to [CartState].
  Widget futureBuilderBody(
      AsyncSnapshot<Object?> snapshot, CartController cartController) {
    //if loading return a loading indicator
    return cartController.cartState.value == CartState.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: MyColors.primary,
            ),
          )
        // if empty return empty cart widget
        : cartController.cartState.value == CartState.empty
            ? const EmptyCart()
            // if error return error cart widget
            : cartController.cartState.value == CartState.error
                ? const ErrorCart()
                // otherwise return cart items list
                : Padding(
                    padding: EdgeInsets.only(top: MySize.height * 0.05),
                    child: CartItems(cartController: cartController),
                  );
  }
}
