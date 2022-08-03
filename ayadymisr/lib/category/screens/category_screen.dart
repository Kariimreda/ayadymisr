import 'package:ayadymisr/category/controllers/category_controller.dart';
import 'package:ayadymisr/category/models/category.dart';
import 'package:ayadymisr/category/screens/category_empty_screen.dart';
import 'package:ayadymisr/category/screens/category_error_screen.dart';
import 'package:ayadymisr/category/widgets/category_grid.dart';
import 'package:ayadymisr/style/my_colors.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A Screen that displays a list of [Product]s in a [Category].
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  /// a  route Name used for navigation and transitions animations.
  static const String routeName = '/category';
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  /// The [Category] of which its [Product]s are displayed. it is retrieved from
  /// the previous screen as a route arguments.
  final Category category = Get.arguments;

  /// The [CategoryController] that manages the category.
  final categoryController = Get.put(CategoryController());
  @override
  void initState() {
    //get the products in this category
    categoryController.getProducts(category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: MyPadding.hPadding,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
                color: MyColors.primary,
                iconSize: MySize.height * 0.03,
              ),
            ),
            title: Text(
              category.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: MyColors.primary,
                fontSize: MySize.height * 0.025,
              ),
            ),
            centerTitle: true,
          ),
          body: categoryController.categoryState.value == CategoryState.loading
              ? const Center(child: CircularProgressIndicator())
              : categoryController.categoryState.value == CategoryState.empty
                  ? const EmptyCategory()
                  : categoryController.categoryState.value ==
                          CategoryState.error
                      ? const ErrorCategory()
                      : const CategoryGrid()),
    ));
  }
}
