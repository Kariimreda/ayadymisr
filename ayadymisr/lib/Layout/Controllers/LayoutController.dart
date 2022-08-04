import 'package:ayadymisr/Home/Ui/categoriesScreen.dart';
import 'package:ayadymisr/InternetChecker/controller.dart';
import 'package:ayadymisr/Layout/Ui/Layout.dart';
import 'package:ayadymisr/Home/Ui/cartScreen.dart';
import 'package:ayadymisr/Home/Ui/homePage.dart';
import 'package:ayadymisr/Home/Ui/settingsScreen.dart';
import 'package:ayadymisr/category/models/category.dart';
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
          thumbnail: 'https://picsum.photos/1000/1000?random=10510'),
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
          thumbnail: 'https://picsum.photos/1000/1000?random=10910'),
      Category(
          id: 9,
          title: 'المنزل',
          path: 'size',
          thumbnail: 'https://picsum.photos/1000/1000?random=10810'),
      Category(
          id: 10,
          title: 'بردي',
          path: 'size',
          thumbnail: 'https://picsum.photos/1000/1000?random=10100'),
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
          thumbnail: 'https://picsum.photos/1000/1000?random=1233010'),
      Category(
          id: 14,
          title: 'منتجات تراثية',
          path: 'size',
          thumbnail: 'https://picsum.photos/1000/1000?random=101210'),
      Category(
          id: 15,
          title: 'الألباستر',
          path: 'size',
          thumbnail: 'https://picsum.photos/1000/1000?random=1057610'),
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
  Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 8));
  }
}
