import 'package:ayadymisr/category/models/category.dart';
import 'package:ayadymisr/product/models/product.dart';
import 'package:get/get.dart' hide Trans;

/// Defines the State of the [Category]
///   * [loading]: indicates that loading is in progress.
///   * [empty]: idicates that there are no [Product]s in this [Category].
///   * [error]: indicates that loading failed.
///   * [containsItems]: indicates loading of [Product]s success.
enum CategoryState {
  loading,
  empty,
  error,
  containsItems,
}

/// A controller class that manages the [Category]s. extends [GetxController] class.
///
/// To get an instance of this class, use:
/// ```dart
/// final categoryController = Get.put(CategoryController()); //creates a new controller
/// or
/// final categoryController = Get.find<CategoryController>(); // finds an existing controller
/// ```
class CategoryController extends GetxController {
  /// List of [Product] objects in this [Category].
  final products = <Product>[].obs;

  /// indicates whether category is loading or not. used to show the loading indicator.
  final isLoading = false.obs;

  /// The current [Category] state.
  final categoryState = CategoryState.loading.obs;

  /// Get [Product]s from this [Category] from API.
  void getProducts(Category category) async {
    //set the category state to loading to show the loading indicator
    categoryState.value = CategoryState.loading;
    //dummy delay to simulate loading
    await Future.delayed(const Duration(seconds: 2));
    //  return some dummy products
    products.value = [
      Product(
        id: 1,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
        min: 4,
        price: 1023,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات هيومازد ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 2,
        imageUrl:
            'https://agrimisr.com/image/cache/mshtl-alkhlyj/Untitled-1-242x297.jpg',
        min: 4,
        price: 50,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'نخل برحى متر خشب',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 23,
        imageUrl: 'https://agrimisr.com/image/cache/keymanda/13-252x309.jpg',
        min: 4,
        price: 600,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'جيست',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 4,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.30453800%201656332856-252x309.jpg',
        min: 4,
        price: 5120,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'سينوزد - 1 كيلو',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 5,
        imageUrl: 'https://agrimisr.com/image/cache//1573735590-252x309.jpg',
        min: 4,
        price: 1,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'كزد اويل -زيت معدني 95% (200 لتر ) ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 6,
        imageUrl:
            'https://agrimisr.com/image/cache/catalog/product/_0004_Layer%203-252x309.jpg',
        min: 4,
        price: 1,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'شتلات نبات الهوهوبا ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 7,
        imageUrl:
            'https://agrimisr.com/image/cache/almktb-alfny-alzray-alhdyth/0.84881900%201646052843-252x309.jpg',
        min: 4,
        price: 1,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'شتله روزمارى ',
        weight: '500g',
        wishlisted: false,
      ),
    ];
    //set the category state to contains items to hide the loading indicator
    categoryState.value = CategoryState.containsItems;
    // set loading to false to hide the loading indicator
    isLoading.value = false;
  }

  RxBool isSelected = false.obs;
  void IsSelected() {
    isSelected.value = !isSelected.value;
  }
}
