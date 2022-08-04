import 'package:get/get.dart';

/// Defines the current Search State
///   * [loading]: indicates that search results are being loaded
///   * [empty]: indicates that the search has no items
///   * [error]: indicates that an error occurred while loading the results
///   * [success]: indicates that the search has results
enum SearchState {
  loading,
  empty,
  success,
  error,
}

/// SearchControllers is a controller class that manages the searchResults.
/// It extends [GetxController] class.
/// To get an instance of this class, use:
/// ```dart
/// final SearchControllers = Get.put(SearchControllers()); //creates a new controller
/// or
/// final SearchControllers = Get.find<SearchControllers>(); // finds an existing controller
/// ```

class SearchControllers extends GetxController {
  void searchResults(String? val) {}
}
