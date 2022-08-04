import 'package:ayadymisr/InternetChecker/controller.dart';
import 'package:ayadymisr/Layout/Controllers/LayoutController.dart';
import 'package:ayadymisr/Home/Ui/searchScreen.dart';
import 'package:ayadymisr/auth/screens/login_screen.dart';
import 'package:ayadymisr/category/screens/category_screen.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_sign_in/google_sign_in.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);
  static const String routeName = '/layout';

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final controller = Get.put(HomeController());
  final internetController = Get.put(InternetChecker());
  var darwertext = ButtonControllers().drawerTextButton;

  @override
  void initState() {
    internetController.checkForInternet();
    controller.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            drawer: Drawer(
              backgroundColor: MyColors.background,
              child: ListView(
                children: [
                  DrawerHeader(child: Image.asset('assets/images/logo.png')),
                  Divider(
                    color: MyColors.background,
                  ),
                  Container(
                    color: MyColors.background,
                    child: ExpansionTile(
                      title: const Text('أقسام السوق الزراعي'),
                      collapsedBackgroundColor: MyColors.background,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(CategoryScreen.routeName,
                                            arguments:
                                                controller.categories[index]);
                                      },
                                      child: Text(
                                          controller.categories[index].title),
                                    ),
                                  );
                                },
                                itemCount: controller.categories.length,
                              ),
                              Divider(
                                color: MyColors.background,
                              ),
                              ExpansionTile(
                                title: const Text('الأسمدة و المخصبات'),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text('الأسمدة البوتاسية (90)'),
                                          Divider(
                                            color: MyColors.background,
                                          ),
                                          const Text('الأسمدة الفوسفاتية (57)')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    color: MyColors.background,
                    child: ExpansionTile(
                      title: const Text('شركات و خدمات'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(' تسجيل بائعين'),
                                Divider(
                                  color: MyColors.background,
                                ),
                                const Text("تسجيل مقدمى الخدمات")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  darwertext(context, text: 'الجماعيات الاهليه'),
                  const Divider(),
                  darwertext(context, text: 'خدمات الجماعيات الاهليه'),
                  const Divider(),
                  darwertext(context, text: 'الارشاد'),
                  const Divider(),
                  InkWell(
                      onTap: () async {
                        // await GoogleSignIn().signOut();
                        Get.dialog(
                          const Center(child: CircularProgressIndicator()),
                          barrierDismissible: false,
                        );

                        try {
                          if (FirebaseAuth.instance.currentUser != null) {
                            await GoogleSignIn().disconnect();
                          }
                        } catch (e) {
                          print(e);
                        }
                        Get.offAllNamed(LoginScreen.routeName);
                      },
                      child: darwertext(context, text: 'Auth.Logout'.tr()))
                ],
              ),
            ),
            backgroundColor: Colors.white,
            appBar: controller.currentIndex.value == 1
                ? null
                : AppBar(
                    foregroundColor: MyColors.primaryDark,
                    backgroundColor: Colors.white,
                    actions: [
                      IconButton(
                          onPressed: () => Get.to(const Search()),
                          icon: const Icon(
                            Icons.search,
                            color: MyColors.primaryDark,
                          )),
                    ],
                    // leading:
                    //     IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.changeBottomNav(index);
              },
              items: controller.bottomItems,
            ),
            body: controller.screens[controller.currentIndex.value],
          ),
        ));
  }
}
