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
            'https://ayadymisr.com/image/cache/wkseller/666/GHA7%20(1)-1000x1000.jpg',
        priceWithoutTax: 130,
        price: 130,
        quantity: 1000,
        rating: 4.5,
        seller: ' ghaly.store',
        title:
            'تمثال لبائع العرقسوس مصنوع من خشب البرتقال-28*30*5 سم- متعدد الألوان',
        views: '322',
        wishlisted: false,
        model: ' تمثال',
      ),
      Product(
        id: 2,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/622/ZAE3%20(1)-1000x1000.jpg',
        priceWithoutTax: 110,
        price: 110,
        quantity: 1000,
        rating: 4.5,
        seller: 'Zenab-AbdelFatah',
        title: 'شنطة حريمى من الخوص - بيج - 10 * 15 سم',
        views: '322',
        wishlisted: false,
        model: ' ZAE3',
      ),
      Product(
        id: 23,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/548/45-1000x1000.jpg',
        priceWithoutTax: 2800,
        price: 2800,
        quantity: 1000,
        rating: 4.5,
        seller: ' ghaly.store',
        title: 'تعليقة مكرمية',
        views: '322',
        wishlisted: false,
        model: ' تمثال',
      ),
      Product(
        id: 4,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/94/7-1000x1000.jpg',
        priceWithoutTax: 650,
        price: 650,
        quantity: 1000,
        rating: 4.5,
        seller: '  ابو شقة',
        title: 'تربيزه صدف طبيعي',
        views: '322',
        wishlisted: false,
        model: '  تربيزه صدف طبيعي',
      ),
      Product(
        id: 5,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/94/1-1000x1000.jpg',
        priceWithoutTax: 375,
        price: 375,
        quantity: 1000,
        rating: 4.5,
        seller: '  ابو شقة',
        title: 'علبه صدف طبيعي  ',
        views: '322',
        wishlisted: false,
        model: '  تربيزه صدف طبيعي',
      ),
      Product(
        id: 6,
        imageUrl:
            'https://ayadymisr.com/image/cache/wkseller/88/DSC08567-1000x1000.jpg',
        priceWithoutTax: 120,
        price: 120,
        quantity: 1000,
        rating: 4.5,
        seller: '  فاخورة عادل امام',
        title: 'طاجن فخار جرانيت',
        views: '322',
        wishlisted: false,
        model: '  أدوات مائدة',
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
