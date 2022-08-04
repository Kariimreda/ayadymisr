import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/restartAppWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);
  static const String routeName = '/NoInternetConnection';

  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: MySize.width,
        height: MySize.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: MyPadding.svPadding,
                child: Icon(
                  Icons.error_outline_rounded,
                  color: MyColors.primaryDark,
                  size: MyPadding.xxlPadding,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Connection.NoConnection'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: TextButton(
              child: Text(
                'Connection.TryAgain'.tr(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                RestartWidget.restartApp(Get.context!);
              },
            ))
          ],
        ),
      ),
    ));
  }
}
