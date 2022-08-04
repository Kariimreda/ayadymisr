import 'package:ayadymisr/Home/Ui/widgets/tabBarTile.dart';
import 'package:ayadymisr/Layout/Controllers/LayoutController.dart';
import 'package:ayadymisr/core/global/my_strings.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final controller = HomeController();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = EasyLocalization.of(context)!.locale.languageCode == 'ar'
        ? MyStrings.arimgList
        : MyStrings.enimgList;
    final imageSliders = strings
        .map((item) => Container(
              margin: EdgeInsets.all(MyPadding.m2Padding),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1500.0,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: MyColors.primary,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return SafeArea(
      child: Scaffold(
          body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: MyColors.primary,
        onRefresh: () async {
          await controller.refresh();
        },
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 4,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: true,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                ),
                Padding(
                  padding: MyPadding.shPadding,
                  child: Image.asset(
                      EasyLocalization.of(context)!.locale.languageCode == 'ar'
                          ? 'assets/images/id2-banner2.jpg'
                          : 'assets/images/banner-en-01.jpg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                 DefaultTabController(
                  initialIndex: 0,
                    length: 3,
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: MyColors.primary,
                      isScrollable: false,
                      tabs: [
                        Text('ALL' ),
                        Text('Alabaster'),
                        Text('Fashion'),
                      ],
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    )),
                SizedBox(height: MySize.height * 0.05,),
                SizedBox(
                  height: MySize.height * 0.4,
                  width: MySize.width,
                  child: TabBarView(
                    children: <Widget>[TabBarTile(  products: controller.TabBarLists[0]),TabBarTile(  products: controller.TabBarLists[0]),TabBarTile(  products: controller.TabBarLists[0]),],
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),                SizedBox(height: MySize.height * 0.05,),

                Padding(
                  padding: MyPadding.shPadding,
                  child: Image.asset(
                      EasyLocalization.of(context)!.locale.languageCode == 'ar'
                          ? 'assets/images/id2-banner1.jpg'
                          : 'assets/images/banner-en-02.jpg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTabController(
                    initialIndex: 0,
                    length: 3,
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: MyColors.primary,
                      isScrollable: false,
                      tabs: [
                        Text('Folklore'),
                        Text('Macramé'),
                        Text('Papyrus'),
                      ],
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    )),
                SizedBox(height: MySize.height * 0.05,),
                SizedBox(
                  height: MySize.height * 0.4,
                  width: MySize.width,
                  child: TabBarView(
                    children: <Widget>[TabBarTile(  products: controller.TabBarLists[0]),TabBarTile(  products: controller.TabBarLists[0]),TabBarTile(  products: controller.TabBarLists[0]),],
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: Get.height * 0.4,
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
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //InternetChecker().checkForInternet();
                                    controller.IsSelected();
                  ),
                ),

              ],
            )),
      )),
    );
  }
}




































// Container(
//   padding:
//       //const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//       MyPadding.hvPadding,
//   child: GridView.builder(
//     gridDelegate:
//         const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 15,
//       crossAxisSpacing: 20,
//       childAspectRatio: 0.6,
//     ),
//     physics: const NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     itemBuilder: (context, index) {
//       return SizedBox(
//         height: Get.height * 0.4,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               child: InkWell(
//                 onTap: () => {
//                   Get.toNamed(
//                     ProductScreen.routeName,
//                     arguments: Product(
//                       id: 1,
//                       imageUrl:
//                           'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
//                       priceWithoutTax: 4,
//                       price: 1023,
//                       quantity: 1000,
//                       rating: 4.5,
//                       seller:
//                           ' شركة كفر الزيات للمبيدات و الكيماويات ',
//                       title: 'مبيدات هيومازد ',
//                       views: '500g',
//                       wishlisted: false,
//                     ),
//                   ),
//                 },
//                 child: (Image.network(
//                   'https://ayadymisr.com/image/cache/wkseller/624/FMT1-1000x1000.jpg',
//                   fit: BoxFit.cover,
//                 )),
//               ),
//             ),
//             const Text(
//               'غطاء صينية من الخوص - متعدد الألوان - 50 سم',
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//             const Text('150 جم'),
//             Obx(
//               () => SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     //InternetChecker().checkForInternet();
//                     controller.IsSelected();
//
//                     controller.isSelected.value
//                         ? Get.snackbar(
//                             'Added to cart', 'Check your Cart',
//                             snackPosition: SnackPosition.BOTTOM)
//                         : Get.snackbar('Removed from cart', '',
//                             snackPosition:
//                                 SnackPosition.BOTTOM);
//                   },
//                   child: controller.isSelected.value
//                       ? const Icon(Icons.check)
//                       : const Icon(Icons.add_shopping_cart),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     },
//     itemCount: 7,
//   ),
// )