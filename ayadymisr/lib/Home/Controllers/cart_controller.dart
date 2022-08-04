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
        title: 'معلج ملوحة نانو سال- 5 لتر',
        pricePerItem: 100,
        quantity: 1,
        total: 100,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.27603300%201656332880-242x297.jpg',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 2,
        title: 'نخل برحى متر خشب',
        pricePerItem: 123,
        quantity: 10,
        total: 1230,
        imageUrl:
            'https://agrimisr.com/image/cache/mshtl-alkhlyj/Untitled-1-242x297.jpg',
        minQuant: 2,
        maxQuant: 15,
      ),
      CartItem(
        id: 3,
        title: 'جيست',
        pricePerItem: 10.23,
        quantity: 3,
        total: 30,
        imageUrl: 'https://agrimisr.com/image/cache/keymanda/13-252x309.jpg',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 4,
        title: 'سينوزد - 1 كيلو',
        pricePerItem: 100,
        quantity: 5,
        total: 100,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.30453800%201656332856-252x309.jpg',
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
