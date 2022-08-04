import 'package:ayadymisr/Home/Ui/cartScreen.dart';
import 'package:ayadymisr/account/screens/my_account_screen.dart';
import 'package:ayadymisr/core/locales.dart';
import 'package:ayadymisr/core/global/my_strings.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/restartAppWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void openLink(final url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    RxBool toggled = RxBool(
        EasyLocalization.of(context)!.locale.languageCode == 'ar'
            ? false
            : true);
    return Obx(() => SingleChildScrollView(
          child: Padding(
            padding: MyPadding.shPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SwitchListTile(
                  title: Text('Settings.English'.tr()),
                  subtitle:
                      Text('Settings.Choose your preferred language'.tr()),
                  value: toggled.value,
                  onChanged: (bool value) {
                    toggled.value = value;
                    EasyLocalization.of(context)!
                        .setLocale(MyLocales.supportedLocales[value ? 1 : 0]);
                    Get.updateLocale(MyLocales.supportedLocales[value ? 1 : 0]);
                    RestartWidget.restartApp(context);
                  },
                  secondary: Image.asset('assets/images/add-cat.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpansionTile(
                  title: Text('Settings.Information'.tr()),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                                onTap: () {
                                  openLink(MyStrings.aboutUs);
                                },
                                child:
                                    Center(child: Text('Settings.About'.tr()))),
                          ),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                                onTap: () {
                                  openLink(MyStrings.privacyPolicyUri);
                                },
                                child: Center(
                                    child: Text('Settings.Privacy'.tr()))),
                          ),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                                onTap: () {
                                  openLink(MyStrings.aboutUs);
                                },
                                child: Center(
                                    child: Text('Settings.Conditions'.tr()))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Settings.Additions'.tr()),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                                onTap: () {
                                  openLink(MyStrings.companies);
                                },
                                child: Center(
                                    child: Text('Settings.corporation'.tr()))),
                          ),
                          const Divider(),
                          SizedBox(
                              width: double.infinity,
                              height: MySize.height * 0.05,
                              child: InkWell(
                                  onTap: () {
                                    openLink(MyStrings.map);
                                  },
                                  child: Center(
                                      child: Text('Settings.Location'.tr())))),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Settings.My account'.tr()),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                                onTap: () {
                                  //open a bottom sheet with Account Screen
                                  Get.bottomSheet(
                                    const AccountScreen(),
                                    enableDrag: true,
                                    ignoreSafeArea: false,
                                    backgroundColor: MyColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: MyRadius.mCircularRadius,
                                    ),
                                  );

                                  // Get.toNamed(AccountScreen.routeName);
                                },
                                child: Center(
                                    child: Text('Settings.My account'.tr()))),
                          ),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                                onTap: () {
                                  Get.to(const Cart());
                                },
                                child: Center(
                                    child: Text('Settings.Orders'.tr()))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Settings.Contact us'.tr()),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(child: Text('Settings.Loc'.tr())),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            height: MySize.height * 0.05,
                            child: InkWell(
                              onTap: () {
                                launchUrl(MyStrings.phone);
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: ui.TextDirection.ltr,
                                  children: [
                                    Icon(
                                      Icons.call_rounded,
                                      textDirection: Directionality.of(context),
                                      color: MyColors.primary,
                                    ),
                                    SizedBox(
                                      width: MySize.width * 0.02,
                                    ),
                                    Text(
                                      MyStrings.phoneString,
                                      style: TextStyle(
                                        fontSize: MySize.width * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
