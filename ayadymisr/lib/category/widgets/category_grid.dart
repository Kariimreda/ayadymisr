import 'package:ayadymisr/category/controllers/category_controller.dart';
import 'package:ayadymisr/category/widgets/category_tile.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// A grid view that displays a list of [Product]s as [CategoryTile]s.
class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPadding.hvPadding,
      child: Center(
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: MySize.width * 0.05,
              mainAxisSpacing: 10,
            ),
            itemCount: categoryController.products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryTile(index: index);
            }),
      ),
    );
  }
}
