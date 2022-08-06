import 'package:ayadymisr/Home/Ui/categoriesScreen.dart';
import 'package:ayadymisr/InternetChecker/controller.dart';
import 'package:ayadymisr/Layout/Ui/Layout.dart';
import 'package:ayadymisr/Home/Ui/cartScreen.dart';
import 'package:ayadymisr/Home/Ui/homePage.dart';
import 'package:ayadymisr/Home/Ui/settingsScreen.dart';
import 'package:ayadymisr/category/models/category.dart';
import 'package:ayadymisr/product/models/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

/// A controller class that manages the [Layout]s.
/// It extends [GetxController] class.
/// To get an instance of this class, use:
/// ```dart
/// final HomeController = Get.put(HomeController()); //creates a new controller
/// or
/// final HomeController = Get.find<HomeController>(); // finds an existing controller
/// ```
class HomeController extends GetxController {
  ///initialize [currentIndex] with default value 0 using as [index] in [changeBottomNav()]
  RxInt currentIndex = 0.obs;

  /// List of [categories]
  final categories = <Category>[].obs;

  ///initialize [isLoading] with default value false using in [getCategories()] to check loading state
  final isLoading = false.obs;

  ///initialize [isSelected] with default value false using in [IsSelected()]
  RxBool isSelected = false.obs;

  /// getCategories return dummy categories
  void getCategories() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    categories.value = [
      Category(
          id: 1,
          title: 'الأزياء',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-03-210x210.png'),
      Category(
          id: 2,
          title: 'التلّي',
          path: 'color',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-05-210x210.png'),
      Category(
          id: 3,
          title: 'السجاد والكليم',
          path: 'type',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/categorie-06-210x210.png'),
      Category(
          id: 4,
          title: 'الفخار والخزف',
          path: 'product',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-03-210x210.png'),
      Category(
          id: 5,
          title: 'المشغولات الجلدية',
          path: 'product',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-11-210x210.png'),
      Category(
          id: 6,
          title: 'المشغولات الخشبية',
          path: 'product',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-07-210x210.png'),
      Category(
          id: 7,
          title: 'المشغولات الصدفية',
          path: 'product',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-02-210x210.png'),
      Category(
          id: 8,
          title: 'المشغولات المعدنية',
          path: 'product',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-11-210x210.png'),
      Category(
          id: 9,
          title: 'المنزل',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-10-210x210.png'),
      Category(
          id: 10,
          title: 'بردي',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-02-210x210.png'),
      Category(
          id: 11,
          title: 'مستلزمات الصيف',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-10-210x210.png'),
      Category(
          id: 12,
          title: 'مكرمية',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-11-210x210.png'),
      Category(
          id: 13,
          title: 'منتجات الشمع',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-07-210x210.png'),
      Category(
          id: 14,
          title: 'منتجات تراثية',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-02-210x210.png'),
      Category(
          id: 15,
          title: 'الألباستر',
          path: 'size',
          thumbnail:
              'https://ayadymisr.com/image/cache/catalog/new-ui/categorie-11-210x210.png'),
    ];
    isLoading.value = false;
  }

  ///Method to toggle between to cases
  void IsSelected() {
    isSelected.value = !isSelected.value;
  }

  /// List of [BottomNavigationBarItem]s
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined), label: 'Home.Home'.tr()),
    BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_bag_outlined),
        label: 'Category.Categories'.tr()),
    BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        label: 'Home.Cart'.tr()),
    BottomNavigationBarItem(
        icon: const Icon(Icons.settings), label: 'Home.Settings'.tr()),
  ];

  /// List of [screens]
  List<Widget> screens = [
    const HomePage(),
    const CategoriesScreen(),
    const Cart(),
    const Settings()
  ];

  /// Method to toggle between [screens] using [index]
  void changeBottomNav(int index) {
    currentIndex.value = index;
    InternetChecker().checkForInternet();
  }

  /// Method to refresh page
  @override
  Future<void> refresh() async {
    return Future.delayed(const Duration(seconds: 3));
  }

  List<List<Product>> TabBarLists = [
    [
      Product(
          id: 1,
          imageUrl:
              'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
          priceWithoutTax: 4,
          price: 1023,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'مبيدات هيومازد ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 2,
          imageUrl:
              'https://agrimisr.com/image/cache/mshtl-alkhlyj/Untitled-1-242x297.jpg',
          priceWithoutTax: 4,
          price: 50,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'نخل برحى متر خشب',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 23,
          imageUrl: 'https://agrimisr.com/image/cache/keymanda/13-252x309.jpg',
          priceWithoutTax: 4,
          price: 600,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'جيست',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 4,
          imageUrl:
              'https://agrimisr.com/image/cache/folder_98/0.30453800%201656332856-252x309.jpg',
          priceWithoutTax: 4,
          price: 5120,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'سينوزد - 1 كيلو',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 5,
          imageUrl: 'https://agrimisr.com/image/cache//1573735590-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'كزد اويل -زيت معدني 95% (200 لتر ) ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 6,
          imageUrl:
              'https://agrimisr.com/image/cache/catalog/product/_0004_Layer%203-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'شتلات نبات الهوهوبا ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 7,
          imageUrl:
              'https://agrimisr.com/image/cache/almktb-alfny-alzray-alhdyth/0.84881900%201646052843-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'شتله روزمارى ',
          views: '500g',
          wishlisted: false,
          model: 's'),
    ],
    [
      Product(
          id: 1,
          imageUrl:
              'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
          priceWithoutTax: 4,
          price: 1023,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'مبيدات هيومازد ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 2,
          imageUrl:
              'https://agrimisr.com/image/cache/mshtl-alkhlyj/Untitled-1-242x297.jpg',
          priceWithoutTax: 4,
          price: 50,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'نخل برحى متر خشب',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 23,
          imageUrl: 'https://agrimisr.com/image/cache/keymanda/13-252x309.jpg',
          priceWithoutTax: 4,
          price: 600,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'جيست',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 4,
          imageUrl:
              'https://agrimisr.com/image/cache/folder_98/0.30453800%201656332856-252x309.jpg',
          priceWithoutTax: 4,
          price: 5120,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'سينوزد - 1 كيلو',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 5,
          imageUrl: 'https://agrimisr.com/image/cache//1573735590-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'كزد اويل -زيت معدني 95% (200 لتر ) ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 6,
          imageUrl:
              'https://agrimisr.com/image/cache/catalog/product/_0004_Layer%203-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'شتلات نبات الهوهوبا ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 7,
          imageUrl:
              'https://agrimisr.com/image/cache/almktb-alfny-alzray-alhdyth/0.84881900%201646052843-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'شتله روزمارى ',
          views: '500g',
          wishlisted: false,
          model: 's'),
    ],
    [
      Product(
          id: 1,
          imageUrl:
              'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
          priceWithoutTax: 4,
          price: 1023,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'مبيدات هيومازد ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 2,
          imageUrl:
              'https://agrimisr.com/image/cache/mshtl-alkhlyj/Untitled-1-242x297.jpg',
          priceWithoutTax: 4,
          price: 50,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'نخل برحى متر خشب',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 23,
          imageUrl: 'https://agrimisr.com/image/cache/keymanda/13-252x309.jpg',
          priceWithoutTax: 4,
          price: 600,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'جيست',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 4,
          imageUrl:
              'https://agrimisr.com/image/cache/folder_98/0.30453800%201656332856-252x309.jpg',
          priceWithoutTax: 4,
          price: 5120,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'سينوزد - 1 كيلو',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 5,
          imageUrl: 'https://agrimisr.com/image/cache//1573735590-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'كزد اويل -زيت معدني 95% (200 لتر ) ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 6,
          imageUrl:
              'https://agrimisr.com/image/cache/catalog/product/_0004_Layer%203-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'شتلات نبات الهوهوبا ',
          views: '500g',
          wishlisted: false,
          model: 's'),
      Product(
          id: 7,
          imageUrl:
              'https://agrimisr.com/image/cache/almktb-alfny-alzray-alhdyth/0.84881900%201646052843-252x309.jpg',
          priceWithoutTax: 4,
          price: 1,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'شتله روزمارى ',
          views: '500g',
          wishlisted: false,
          model: 's'),
    ],
  ];
}
