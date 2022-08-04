

import 'package:ayadymisr/core/global/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Layout/Controllers/LayoutController.dart';
import '../../../product/models/product.dart';
import '../../../product/screens/product_screen.dart';

class TabBarTile extends StatefulWidget {
  const TabBarTile({Key? key, required this.products}) : super(key: key);

  final  List<Product> products;
  @override
  State<TabBarTile> createState() => _TabBarTileState();
}

class _TabBarTileState extends State<TabBarTile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
  final products = widget.products;
    return SizedBox(
      height: MySize.height * 0.5,
      width: MySize.width * 0.5,
      child: ListView.builder(

        itemBuilder: (context, index) {
        return Padding(
          padding: MyPadding.hPadding,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:SizedBox(
              height: Get.height * 0.4,
              width: MySize.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => {
                        Get.toNamed(
                          ProductScreen.routeName,
                          arguments: Product(
                            id: 1,
                            imageUrl:
                            'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
                            priceWithoutTax: 4,
                            price: 1023,
                            quantity: 1000,
                            rating: 4.5,
                            seller:
                            ' شركة كفر الزيات للمبيدات و الكيماويات ',
                            title: 'مبيدات هيومازد ',
                            views: '500g',
                            wishlisted: false,
                          ),
                        ),
                      },
                      child: (Image.network(
                        'https://ayadymisr.com/image/cache/wkseller/624/FMT1-1000x1000.jpg',
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  const Text(
                    'غطاء صينية من الخوص - متعدد الألوان - 50 سم',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Text('150 جم'),
                  Obx(
                        () => SizedBox(
                          width: MySize.width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {
                              //InternetChecker().checkForInternet();
                              controller.IsSelected();

                              controller.isSelected.value
                                  ? Get.snackbar(
                                  'Added to cart', 'Check your Cart',
                                  snackPosition: SnackPosition.BOTTOM)
                                  : Get.snackbar('Removed from cart', '',
                                  snackPosition:
                                  SnackPosition.BOTTOM);
                            },
                            child: controller.isSelected.value
                                ? const Icon(Icons.check)
                                : const Icon(Icons.add_shopping_cart),
                          ),
                        ),
                  )
                ],
              ),
            ),


          ),
        );
      },
      itemCount: products.length,
        shrinkWrap: true,
        scrollDirection:Axis.horizontal ,

      physics: const BouncingScrollPhysics(),


      ),
    );
  }
}
