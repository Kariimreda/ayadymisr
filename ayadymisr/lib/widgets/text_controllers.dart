import 'package:ayadymisr/Home/Controllers/cart_controller.dart';
import 'package:ayadymisr/core/global/my_colors.dart';
import 'package:ayadymisr/core/global/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:visit_egypt/CommonWidgets/CustomTextWidget.dart';
// import 'package:visit_egypt/Resources/Colors.dart';
// import 'package:visit_egypt/Resources/AppRepoSizes.dart';
// import 'package:visit_egypt/Resources/sizes.dart';
// import 'package:visit_egypt/utility/SizeConfig.dart';

/// A Collection of Text Input Widgets.
class TextControllers {
  TextControllers._internal();

  static final TextControllers _instance = TextControllers._internal();

  factory TextControllers() => _instance;

  /// Row with + and - buttons, and a text to show the number of items in between.
  ///
  /// **Should only be used in [Cart] Screen as it depends on [CartController].**
  Widget customPlusMinusFormField(
      final CartController cartController, final int index, final quantity) {
    final quant = cartController.cartItems[index].quantity.obs;
    //keys for controlling Raw material buttons
    final addGlobalKey = GlobalKey();
    final removeGlobalKey = GlobalKey();

    return Padding(
      padding: MyPadding.xsvPadding,
      child: SizedBox(
        height: MySize.height * 0.035,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                key: removeGlobalKey,
                onPressed: quant.value ==
                        cartController.cartItems[index].minQuant
                    ? null
                    : () {
                        quant.value--;
                        if (quant.value <=
                            cartController.cartItems[index].minQuant) {
                          quant.value =
                              cartController.cartItems[index].minQuant;
                        }
                        cartController.cartItems[index].quantity = quant.value;
                        quantity.value = quant.value;
                      },
                padding: MyPadding.shPadding,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                constraints: const BoxConstraints(minWidth: 0),
                fillColor:
                    quant.value == cartController.cartItems[index].minQuant
                        ? MyColors.grey!.withOpacity(0.15)
                        : MyColors.white,
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(
                  Icons.remove,
                  color: MyColors.error,
                ),
              ),
              Expanded(
                child: Obx(
                  () => Text(
                    quant.value.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              RawMaterialButton(
                key: addGlobalKey,
                onPressed: quant.value ==
                        cartController.cartItems[index].maxQuant
                    ? null
                    : () {
                        quant.value++;
                        if (quant.value >=
                            cartController.cartItems[index].maxQuant) {
                          quant.value =
                              cartController.cartItems[index].maxQuant;
                        }
                        cartController.cartItems[index].quantity = quant.value;
                        quantity.value = quant.value;
                      },
                fillColor:
                    quant.value == cartController.cartItems[index].maxQuant
                        ? MyColors.grey!.withOpacity(0.15)
                        : MyColors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: MyPadding.shPadding,
                constraints: const BoxConstraints(minWidth: 0),
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(
                  Icons.add,
                  color: MyColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// A Text Form Field with a thin box decoration.
  Widget customTextFormField(BuildContext context,
          {TextEditingController? controller,
          AutovalidateMode? autovalidateMode,
          EdgeInsetsGeometry? padding,
          FormFieldValidator<String>? validator,
          bool? fixedHeight = false,
          String? hintText,
          String? titleText,
          bool isObscureText = false,
          double? fontSize,
          double? hintFontSize,
          double? fieldHeight,
          double? fieldWidth,
          Color? textFieldColor,
          Color? fillColor,
          Color? textColor,
          Color? borderColor,
          Color? hintTextColor,
          Color? titleTextColor,
          Widget? prefixWidget,
          Widget? endPrefixWidget,
          Widget? titlePrefixWidget,
          Function(String?)? onChanged,
          int? maxLines,
          FocusNode? focusNode,
          VoidCallback? onTap,
          VoidCallback? onEditingComplete,
          VoidCallback? onPressVCL,
          EdgeInsetsGeometry? margin,
          EdgeInsetsGeometry? contentPadding,
          TextInputType? keyboardType,
          TextInputAction? textInputAction,
          bool readOnly = false,
          BorderRadiusGeometry? borderRadius,
          GlobalKey<FormFieldState>? formKey}) =>
      Container(
        padding: padding ?? EdgeInsets.zero,
        height: fixedHeight! ? fieldHeight ?? MySize.height * 0.02 : null,
        width: fieldWidth ?? MySize.width * 0.9,
        decoration: BoxDecoration(
          color: fillColor ?? MyColors.transparent,
          border: Border.all(color: borderColor ?? MyColors.grey!),
          borderRadius: borderRadius ?? MyRadius.mCircularRadius,
          // Border(
          //     bottom: BorderSide(
          //         color: AppRepoColors().appGreyColor,
          //         width: SizeConfig.safeBlockHorizontal * 0.5)
          // ),
        ),
        child: Padding(
          padding: MyPadding.svPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            verticalDirection: VerticalDirection.up,
            children: [
              prefixWidget ?? Container(),
              if (prefixWidget != null) SizedBox(width: MySize.width / 60),
              Expanded(
                child: TextFormField(
                  key: formKey,
                  readOnly: readOnly,
                  textInputAction: textInputAction ?? TextInputAction.done,
                  focusNode: focusNode,
                  obscureText: isObscureText,
                  controller: controller,
                  maxLines: maxLines ?? 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: textColor, fontSize: fontSize),
                  keyboardType: keyboardType,
                  onTap: onTap ?? () {},
                  onEditingComplete: onEditingComplete ?? () {},
                  validator: validator,
                  onChanged: onChanged ?? (value) {},
                  decoration: InputDecoration(
                    labelText: titleText,
                    counterText: '',
                    isDense: true,
                    counterStyle: const TextStyle(fontSize: 0),
                    contentPadding: contentPadding ?? EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: hintTextColor,
                      fontSize: hintFontSize,
                    ),
                    errorStyle: TextStyle(
                        color: MyColors.error, fontSize: hintFontSize),
                  ),
                  autovalidateMode:
                      autovalidateMode ?? AutovalidateMode.disabled,
                ),
              ),
              endPrefixWidget ?? Container(),
            ],
          ),
        ),
      );

  /// A Text widget that displayes two texts, a tag and a body. It takes this form:
  ///
  /// [titleText] (tag) : [text] (body),
  /// the body [text] expands to fill the [Row].
  Widget customTwoTextRow({
    String? titleText,
    String? text,
    double? fontSize,
    int? maxLines,
    Color? titleTextColor,
    Color? textColor,
  }) =>
      Padding(
        padding: MyPadding.hPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${titleText ?? ''}${titleText != null ? ': ' : ''}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize ?? 14,
                fontWeight: FontWeight.bold,
                color: titleTextColor,
              ),
            ),
            Expanded(
              child: Text(
                text ?? '',
                maxLines: maxLines ?? 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize ?? 14,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      );

  /// A Text widget that displayes two texts, a tag and a body. It takes this form:
  ///
  /// [titleText] (tag) : [text] (body),
  /// the body [text] Does not expand to fill the [Row], instead it is wrapped
  /// in a [Flexible] widget. the tag is **Bold**.
  Widget customTwoTextRowFlexible({
    String? titleText,
    String? text,
    double? fontSize,
    int? maxLines,
    Color? textColor,
  }) =>
      Padding(
        padding: MyPadding.hPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '${titleText ?? ''}${titleText != null ? ': ' : ''}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize ?? 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                text ?? '',
                maxLines: maxLines ?? 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize ?? 14,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      );

  /// A Text widget that displayes three texts, a tag and a body and a suffix. It takes this form:
  ///
  /// [titleText] (tag) : [text] (body) [suffixText] (suffix),
  /// the body [text] expands to fill the [Row], both the tag and the suffix are **Bold**.
  Widget customThreeTextRow({
    String? titleText,
    String? text,
    String? suffixText,
    double? fontSize,
    Color? textColor,
  }) =>
      Padding(
        padding: MyPadding.hPadding,
        child: Row(
          children: [
            Text(
              '${titleText ?? ''}${titleText != null ? ': ' : ''}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize ?? MySize.width * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Text(
                text ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize ?? MySize.width * 0.03,
                  color: textColor,
                ),
              ),
            ),
            Text(
              suffixText ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize ?? MySize.width * 0.03,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  // Widget customRoundedTextFormField(
  //         {TextEditingController? controller,
  //          Function? validator,
  //          Function? onChanged,
  //         String? hintText,
  //         bool isObscureText = false,
  //         double? fontSize,
  //         double? hintFontSize,
  //         double? fieldHeight,
  //         Color? textFieldColor,
  //         // Color fillColor,
  //         Color? textColor,
  //         Color? borderColor,
  //         Color? hintTextColor,
  //         Color? boxDecorationColor,
  //         Widget? suffixWidget,
  //         Widget? prefixWidget,
  //         int? maxLines,
  //         FocusNode? focusNode,
  //         Function? onTap,
  //         VoidCallback? onPressVCL,
  //         EdgeInsetsGeometry? margin,
  //         EdgeInsetsGeometry? contentPadding,
  //         TextInputType? keyboardType,
  //         GlobalKey<FormFieldState>? formKey}) =>
  //     TextFormField(
  //       key: formKey,
  //       obscureText: isObscureText,
  //       controller: controller,
  //       maxLines: maxLines ?? 1,
  //       textAlign: TextAlign.start,
  //       textAlignVertical: TextAlignVertical.center,
  //       style: TextStyle(color: textColor, fontSize: fontSize, fontFamily: ""),
  //       keyboardType: keyboardType,
  //       onTap: ()=> onTap ?? () {},
  //       // validator: validator(),
  //       // onChanged: onChanged(),
  //       cursorColor: AppRepoColors().appMainColor,
  //       cursorHeight: SizeConfig.safeBlockVertical * 2.5,
  //       decoration: InputDecoration(
  //           counterText: '',
  //           fillColor: boxDecorationColor ??
  //               AppRepoColors().appWhiteColor.withOpacity(0.2),
  //           filled: true,
  //            border: OutlineInputBorder(
  //             borderSide: BorderSide(color: MyColors.transparent,),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: MyColors.transparent,),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //          enabledBorder: OutlineInputBorder(
  //            borderSide: BorderSide(color: MyColors.transparent,),
  //            borderRadius: BorderRadius.circular(8.0),
  //          ),
  //           errorBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: AppRepoColors().appLightGreyColor.withOpacity(0.34),),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           disabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: AppRepoColors().appLightGreyColor.withOpacity(0.34),),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           counterStyle: TextStyle(fontSize: 0),
  //           contentPadding: contentPadding ?? EdgeInsets.zero,
  //           hintText: hintText,
  //           hintStyle: TextStyle(color: hintTextColor, fontSize: hintFontSize),
  //           errorMaxLines: 1,
  //           errorStyle: TextStyle(
  //               color: MyColors.error, fontSize: hintFontSize),
  //           suffixIcon: suffixWidget,
  //           prefixIcon: prefixWidget),
  //     );

  // Widget customTitledTextFormField(BuildContext context, {
  //   TextEditingController? controller,
  //   String? titleText,
  //   String? hintText,
  //   bool isObscureText = false,
  //   double? fontSize,
  //   double? hintFontSize,
  //   double? fieldHeight,
  //   Color? textFieldColor,
  //   Color? textColor,
  //   Color? borderColor,
  //   Color? hintTextColor,
  //   Icon? suffixIcon,
  //   int? maxLines,
  //   FocusNode? focusNode,
  //   Function? onTap,
  //   VoidCallback? onPressVCL,
  //   Widget? titlePrefixWidget,
  //   Widget? suffixWidget,
  //   EdgeInsetsGeometry? contentPadding,
  //   TextInputType? keyboardType,
  //   TextAlign? textAlign,
  //   GlobalKey<FormFieldState>? formKey,
  //   required Function validator,
  // }) =>
  //     Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Padding(
  //           padding: EdgeInsets.symmetric(
  //               vertical: SizeConfig.safeBlockHorizontal * 4),
  //           child: CustomTextWidget().customWidgetWithText(context,
  //             text: titleText ?? '',
  //             textColor: AppRepoColors().appBlackColor,
  //             textAlign: TextAlign.start,
  //             fontSize: Sizes.fontSizes(context)['h5'],
  //             fontWeight: FontWeight.w400,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             prefixWidget: titlePrefixWidget ?? Container(),
  //             spacerWidget: SizedBox(
  //               width: SizeConfig.safeBlockHorizontal * 2,
  //             ),
  //           ),
  //         ),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             // CustomTextWidget().customWidgetWithText(context,
  //             //   text: titleText ?? '',
  //             //   fontSize: Sizes.fontSizes(context)['h6'],
  //             //   textColor: titleTextColor ?? AppRepoColors().appBlackColor,
  //             //   fontWeight: FontWeight.w400,
  //             //   textAlign: TextAlign.start,
  //             // ),
  //             TextFormField(
  //               key: formKey,
  //               obscureText: isObscureText,
  //               controller: controller,
  //               maxLines: maxLines ?? 1,
  //               textAlign: TextAlign.start,
  //               style: TextStyle(color: textColor, fontSize: fontSize),
  //               keyboardType: keyboardType,
  //               onTap: ()=>onTap ?? () {},
  //               validator: validator(),
  //               decoration: InputDecoration(
  //                   counterText: '',
  //                   counterStyle: TextStyle(fontSize: 0),
  //                   contentPadding: contentPadding ??
  //                       EdgeInsets.symmetric(
  //                           horizontal: SizeConfig.safeBlockHorizontal * 8,
  //                           vertical: 0),
  //                   border: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius),
  //                   enabledBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: borderColor ??
  //                               MyColors.transparent,
  //                           width: SizeConfig.safeBlockHorizontal * 0.2)),
  //                   focusedBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: borderColor ??
  //                               MyColors.transparent,
  //                           width: SizeConfig.safeBlockHorizontal * 0.2)),
  //                   disabledBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: borderColor ??
  //                               MyColors.transparent,
  //                           width: SizeConfig.safeBlockHorizontal * 0.2)),
  //                   hintText: hintText ?? '',
  //                   hintStyle:
  //                       TextStyle(color: hintTextColor, fontSize: hintFontSize),
  //                   errorMaxLines: 1,
  //                   errorStyle: TextStyle(
  //                       color: MyColors.error,
  //                       fontSize: hintFontSize),
  //                   errorBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: MyColors.error,
  //                           width: SizeConfig.safeBlockHorizontal * 0.1)),
  //                   suffixIcon: suffixIcon != null
  //                       ? IconButton(
  //                           onPressed: onPressVCL,
  //                           icon: suffixIcon,
  //                         )
  //                       : SizedBox(
  //                           width: 0.0,
  //                         )),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );

}
