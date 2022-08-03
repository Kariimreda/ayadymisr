import 'package:ayadymisr/InternetChecker/Screen.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// InternetChecker is a class that check the connectivity state.
/// It extends [GetxController] class.
/// To get an instance of this class, use:
/// ```dart
/// final InternetChecker = Get.put(InternetChecker()); //creates a new controller
/// or
/// final InternetChecker = Get.find<InternetChecker>(); // finds an existing controller
/// ```
class InternetChecker extends GetxController {
  ///initialize [hasInternet] with default value false using in [checkForInternet()]
  var hasInternet = false.obs;

  ///Method to check connectivity state.
  /// If [hasInternet] is true so there is internet else if it is false  navigate to [NoInternetConnection]
  void checkForInternet() async {
    hasInternet.value = await InternetConnectionChecker().hasConnection;
    if (!hasInternet.value) {
      Get.offAllNamed(NoInternetConnection.routeName);
    }
  }
}
