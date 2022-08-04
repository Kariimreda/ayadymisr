import 'package:ayadymisr/Layout/Controllers/LayoutController.dart';
import 'package:ayadymisr/category/screens/category_screen.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final layoutController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: layoutController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: MyPadding.hPadding,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MySize.height * 0.03,
                      ),
                      Center(
                        child: Text(
                          'Category.Categories'.tr(),
                          style: TextStyle(
                            fontSize: MySize.height * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: MySize.height * 0.003,
                        color: MyColors.primary,
                      ),
                      SizedBox(
                        height: MySize.height * 0.03,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: MyPadding.lPadding,
                            crossAxisSpacing: MyPadding.lPadding,
                          ),
                          itemCount: layoutController.categories.length,
                          itemBuilder: (context, index) {
                            //image and title of category
                            return LayoutBuilder(
                                builder: (context, constrains) {
                              return Container(
                                width: constrains.maxWidth,
                                height: constrains.maxHeight,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  color: MyColors.white,
                                  borderRadius: MyRadius.lCircularRadius,
                                ),
                                child: Stack(
                                  children: [
                                    //image of category with shadow on top where tilte is
                                    ClipRRect(
                                      borderRadius: MyRadius.lCircularRadius,
                                      child: Image.network(
                                        layoutController
                                            .categories[index].thumbnail!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        loadingBuilder:
                                            (context, child, loadingProgress) =>
                                                loadingProgress == null
                                                    ? child
                                                    : const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                    //gradient shadow on top of image

                                    Container(
                                      height: MySize.height,
                                      decoration: BoxDecoration(
                                        borderRadius: MyRadius.lCircularRadius,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          tileMode: TileMode.decal,
                                          colors: [
                                            Colors.black.withOpacity(0.35),
                                            Colors.black.withOpacity(0.05),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                    //title of category in center top of image
                                    Padding(
                                      padding: EdgeInsets.only(
                                              top: MyPadding.mPadding)
                                          .add(MyPadding.hPadding),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: FittedBox(
                                          child: Text(
                                            layoutController
                                                .categories[index].title,
                                            style: TextStyle(
                                              fontSize: MySize.width * 0.055,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      borderRadius: MyRadius.lCircularRadius,
                                      clipBehavior: Clip.hardEdge,
                                      color: MyColors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            CategoryScreen.routeName,
                                            arguments: layoutController
                                                .categories[index],
                                          );
                                        },
                                        splashColor:
                                            MyColors.primary.withOpacity(0.35),
                                        child: SizedBox(
                                          width: constrains.maxWidth,
                                          height: constrains.maxHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          }),
                    ],
                  ),
                )),
    );
  }
}
