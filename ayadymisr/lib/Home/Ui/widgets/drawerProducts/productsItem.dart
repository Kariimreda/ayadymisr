// import 'package:ayadymisr/Home/Controllers/productsControlller.dart';
// import 'package:ayadymisr/Home/Ui/widgets/drawerProducts/ProductsTile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductsItems extends StatefulWidget {
//   ProductsItems(
//       {Key? key, required this.index, required this.productsController})
//       : super(key: key);
//   final int index;
//   final ProductsController productsController;
//
//   @override
//   State<ProductsItems> createState() => _ProductsItemsState();
// }
//
// class _ProductsItemsState extends State<ProductsItems> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 15,
//           crossAxisSpacing: 20,
//           childAspectRatio: 0.6,
//         ),
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return ProductTile(productsController:ProductsController ,index: index );
//         },
//       ),
//     );
//   }
// }
