import 'package:ayadymisr/Home/Models/cart_item.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

/// Defines the current Cart State
///   * [loading]: indicates that cart items are being loaded
///   * [empty]: indicates that the cart has no items
///   * [error]: indicates that an error occurred while loading the cart
///   * [containsItems]: indicates that the cart has items
enum CartState {
  loading,
  empty,
  error,
  containsItems,
}

/// A controller class that manages the cart. extends [GetxController] class.
///
/// To get an instance of this class, use:
/// ```dart
///final cartController = Get.put(CartController()); //creates a new controller
/// or
///final cartController = Get.find<CartController>(); // finds an existing controller
///```
class CartController extends GetxController {
  /// The current cart state.
  final cartState = CartState.loading.obs;

  /// a list of [CartItem] objects.
  final cartItems = <CartItem>[].obs;

  /// Get Cart Items and fill the [cartItems] list.
  Future<void> getCartItems() async {
    //set the cart state to loading to show the loading indicator
    cartState.value = CartState.loading;
    //dummy delay to simulate loading
    await Future.delayed(const Duration(seconds: 2));
    //return some dummy cart items
    cartItems.value = [
      CartItem(
        id: 1,
        title: 'شال مطرز بخيوط القطنية',
        pricePerItem: 100,
        quantity: 1,
        total: 100,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/227/WhatsApp%20Image%202022-04-13%20at%2010.05.26%20AM-1000x1000.jpeg',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 2,
        title: 'غطاء صينية من الخوص - متعدد الألوان - 50 سم',
        pricePerItem: 123,
        quantity: 10,
        total: 1230,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/624/FMT1-1000x1000.jpg',
        minQuant: 2,
        maxQuant: 15,
      ),
      CartItem(
        id: 3,
        title: 'قبعة (برنيطه) أطفال - متعددة الألوان',
        pricePerItem: 10.23,
        quantity: 3,
        total: 30,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/623/SHM%20(4)-1000x1000.jpg',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 4,
        title: 'بانشوه تلي مطرز بخيوط الفضة',
        pricePerItem: 100,
        quantity: 5,
        total: 100,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/285/IMG_3992-1000x1000.jpg',
        minQuant: 5,
        maxQuant: 10,
      ),
    ];
    //set the cart state to contains items to show the cart items
    cartState.value = CartState.containsItems;
  }

  /// Refreshs Cart Items.
  Future<void> refreshCartItems() async {
    await getCartItems();
  }

  /// Removes the [CartItem] at [index] from the [cartItems] list.
  void removeItem(int index) {
    cartItems.removeAt(index);
    if (cartItems.isEmpty) {
      // if the cart is empty, set the cart state to empty
      cartState.value = CartState.empty;
    }
  }
}
