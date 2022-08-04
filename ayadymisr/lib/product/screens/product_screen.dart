import 'package:ayadymisr/Layout/Controllers/LayoutController.dart';
import 'package:ayadymisr/Layout/Ui/Layout.dart';
import 'package:ayadymisr/core/custom_validator.dart';
import 'package:ayadymisr/product/controllers/product_controller.dart';
import 'package:ayadymisr/product/models/product.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:ayadymisr/widgets/button_controllers.dart';
import 'package:ayadymisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:like_button/like_button.dart';
import 'package:easy_localization/easy_localization.dart';

/// A screen that displays product information and lets user add it to their cart
/// with a certain quantity and wishlist the item.
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  /// a route Name used for navigation and transition animation.
  static const routeName = '/product';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  /// The [Product] that is displayed. it is retrieved from the previous screen as
  /// route arguments.
  final product = Get.arguments as Product;

  /// The [ProductController] that manages all [Product] requests.
  final productController = Get.put(ProductController());

  /// a form key used to validate the form.
  final formKey = GlobalKey<FormState>();

  /// The [HomeController], used to navigate to cart screen,
  final layoutController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final qunat = 1.obs;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: MyPadding.hPadding,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back(),
              color: MyColors.primary,
              iconSize: MySize.height * 0.03,
            ),
          ),
          title: Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MyColors.primary,
              fontSize: MySize.height * 0.025,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: MyPadding.hPadding,
              child: LikeButton(
                circleColor: const CircleColor(
                    start: MyColors.secondary, end: MyColors.primary),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: MyColors.secondary,
                  dotSecondaryColor: MyColors.primaryDark,
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    isLiked
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isLiked ? MyColors.primary : MyColors.grey,
                    size: MySize.height * 0.035,
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: MySize.height,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MySize.height * 0.4,
                    width: MySize.width,
                    child: Hero(
                      tag: product.id,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: MyColors.primary,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.02),
                  TextControllers().customTwoTextRow(
                    titleText: 'Product.Seller'.tr(),
                    text: product.seller,
                    fontSize: MySize.height * 0.025,
                    maxLines: 2,
                    textColor: MyColors.primary,
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  SizedBox(
                    width: MySize.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextControllers().customTwoTextRowFlexible(
                          titleText: 'Product.Views'.tr(),
                          text: product.views,
                          textColor: MyColors.grey,
                        ),
                        TextControllers().customTwoTextRowFlexible(
                          titleText: 'Product.Availablity'.tr(),
                          text: product.quantity > 0
                              ? 'Product.Available'.tr()
                              : 'Product.Unavailable'.tr(),
                          textColor: MyColors.grey,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  const Divider(),
                  SizedBox(height: MySize.height * 0.01),
                  TextControllers().customThreeTextRow(
                    titleText: 'Product.PricePerItem'.tr(),
                    text: product.price.toString(),
                    suffixText: 'Cart.Currency'.tr(),
                    fontSize: MySize.height * 0.025,
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MySize.height * 0.02),
                      color: MyColors.grey!.withOpacity(0.1),
                    ),
                    child: TextControllers().customTwoTextRowFlexible(
                      titleText: 'Product.PriceNoTax'.tr(),
                      text: product.priceWithoutTax.toString(),
                      textColor: MyColors.grey,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.02),
                  TextControllers().customTextFormField(
                    context,
                    hintText: 'Product.Quantity'.tr(),
                    titleText: 'Product.Quantity'.tr(),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) =>
                        MyValidators.instance.getQuantityValidators(
                      v,
                      product.quantity,
                    ),
                    contentPadding: MyPadding.hPadding,
                    controller: productController.quantityController.value,
                    maxLines: 1,
                    onChanged: (v) {
                      //if v is null return
                      //if v is not int return
                      //if v is int and less than min return
                      //if v is int and greater than quantity return

                      if (v == null ||
                          int.tryParse(v) is! int ||
                          int.parse(v) < 1 ||
                          int.parse(v) > product.quantity) {
                        return;
                      }
                      productController.isQuantChanged.value = true;
                      qunat.value = int.parse(v);
                    },
                    onEditingComplete: () {
                      //close the keyboard
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  Obx(
                    () => TextControllers().customThreeTextRow(
                      titleText: 'Cart.Total'.tr(),
                      text: !productController.isQuantChanged.value
                          ? ' - '
                          : (product.price * qunat.value)
                              .toPrecision(2)
                              .toString(),
                      textColor: MyColors.secondary,
                      fontSize: MySize.height * 0.023,
                      suffixText: !productController.isQuantChanged.value
                          ? ''
                          : ' ${'Cart.Currency'.tr()} ',
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                  Padding(
                    padding: MyPadding.shPadding,
                    child: Center(
                      child: Obx(
                        () => ButtonControllers().customRoundedLoaderButton(
                          context,
                          text: productController.isAddedToCart.value
                              ? 'Home.Cart'.tr()
                              : 'Product.AddToCart'.tr(),
                          isLoading: productController.isLoading,
                          onPressed: addToCart,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Adds a [Product] to the user cart if values are valid.
  void addToCart() {
    if (productController.isAddedToCart.value) {
      Get.offAndToNamed(Layout.routeName);
      layoutController.changeBottomNav(1);
      return;
    }
    //validate the form
    if (formKey.currentState!.validate()) {
      // add product to cart
      productController.addToCart();
    }
  }
}
