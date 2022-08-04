/// Global strings for the application.
/// Contains image paths, urls, const strings, etc.
///
/// example:
/// ```dart
/// print(MyStrings.logoPath); //prints 'assets/images/logo.png'
/// ```
class MyStrings {
  /// base url of the API
  static const String baseUrl = 'https://www.google.com';

  /// path of the logo image
  static const String logoPath = 'assets/images/logo.png';
  static const String googleGIconPath = 'assets/images/Google_G_Logo.png';

  /// the Uri of the Privacy Policy page
  static Uri privacyPolicyUri = Uri.parse(
      'https://ayadymisr.com/index.php?route=information/information/agree&information_id=3');

  /// the Uri of the About page.
  static Uri aboutUs = Uri.parse(
      'https://agrimisr.com/index.php?route=information/information&information_id=4');

  /// the Uri of the Terms & Conditions page
  static Uri conditions = Uri.parse(
      'https://ayadymisr.com/index.php?route=information/information/agree&information_id=3');

  /// the Uri of the Companies page
  static Uri companies =
      Uri.parse('https://agrimisr.com/index.php?route=product/manufacturer');

  /// the Uri of the Site Map page
  static Uri map =
      Uri.parse('https://agrimisr.com/index.php?route=information/sitemap');

  ///the Uri of the Contact Us phone number
  static Uri phone = Uri.parse('tel:15255');

  /// the contact us phone number
  static const String phoneString = '15255';

  /// path of the green cart image
  static const String greenCartPath = 'assets/images/green_cart.png';

  /// home page image list
  static final List<String> imgList = [
    'https://ayadymisr.com/image/catalog/new-ui/slid-01.jpg',
    'https://ayadymisr.com/image/catalog/new-ui/slid-02.jpg',
  ];
}
