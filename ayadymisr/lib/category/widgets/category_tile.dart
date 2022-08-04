import 'package:ayadymisr/category/controllers/category_controller.dart';
import 'package:ayadymisr/product/screens/product_screen.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

/// Represents a [Product].
class CategoryTile extends StatefulWidget {
  const CategoryTile({Key? key, required this.index}) : super(key: key);

  /// index of the [Product] in [CategoryController.products].
  final int index;
  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    final index = widget.index;

    return SizedBox(
      height: Get.height * 0.4,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => {
                Get.toNamed(
                  ProductScreen.routeName,
                  arguments: categoryController.products[index],
                ),
              },
              child: Center(
                child: ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Hero(
                    tag: categoryController.products[index].id,
                    child: (Image.network(
                      categoryController.products[index].imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ),
            ),
          ),
          Text(
            categoryController.products[index].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: MySize.height * 0.022,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.ideographic,
            ),
          ),
          Text(
            '${categoryController.products[index].price} ${'Cart.Currency'.tr()}',
            style: TextStyle(fontSize: MySize.width * 0.035),
          ),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  //InternetChecker().checkForInternet();
                  categoryController.IsSelected();

                  categoryController.isSelected.value
                      ? Get.snackbar('Added to cart', 'Check your Cart',
                          snackPosition: SnackPosition.BOTTOM)
                      : Get.snackbar('Removed from cart', '',
                          snackPosition: SnackPosition.BOTTOM);
                },
                child: categoryController.isSelected.value
                    ? const Icon(Icons.check)
                    : const Icon(Icons.add_shopping_cart),
              ),
            ),
          )
        ],
      ),
    );
  }
}
