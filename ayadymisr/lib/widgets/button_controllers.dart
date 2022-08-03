import 'package:ayadymisr/style/my_colors.dart';
import 'package:ayadymisr/style/my_size.dart';
import 'package:flutter/material.dart';

// class ConfirmButton extends StatefulWidget {
//   final double width;
//   final double height;
//   final Widget mainChild;
//   final Widget subOneChild;
//   final Widget subTwoChild;
//   final Color mainColor;
//   final Color subOneColor;
//   final Color subTwoColor;
//   final Function btnOneOnpressed;
//   final Function btnTwoOnpressed;
//   final bool btnOneClickReverseSlider;
//   final bool btnTwoClickReverseSlider;
//   const ConfirmButton(
//       {Key? key,
//       required this.width,
//       required this.height,
//       required this.mainChild,
//       required this.subOneChild,
//       required this.subTwoChild,
//       this.mainColor = Colors.blue,
//       this.subOneColor = Colors.green,
//       this.subTwoColor = Colors.red,
//       required this.btnOneOnpressed,
//       required this.btnTwoOnpressed,
//       this.btnOneClickReverseSlider = true,
//       this.btnTwoClickReverseSlider = true})
//       : super(key: key);
//   @override
//   ConfirmButtonState createState() => ConfirmButtonState();
// }

// class ConfirmButtonState extends State<ConfirmButton>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//     animationController.addListener(() {
//       setState(() {});
//     });

//     animation = Tween<double>(begin: 0, end: widget.width).animate(
//         CurvedAnimation(
//             parent: animationController, curve: Curves.easeInOutCubic));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height,
//       child: Stack(
//         children: <Widget>[
//           Align(
//               alignment: Alignment.centerRight,
//               child: Row(
//                 children: <Widget>[
//                   MaterialButton(
//                     elevation: 1,
//                     height: widget.height,
//                     minWidth: animation.value / 2,
//                     color: widget.subOneColor,
//                     onPressed: () {
//                       widget.btnOneOnpressed();
//                       if (widget.btnOneClickReverseSlider) {
//                         animationController.reverse();
//                       }
//                     },
//                     child: widget.subOneChild,
//                   ),
//                   MaterialButton(
//                     elevation: 1,
//                     height: widget.height,
//                     minWidth: animation.value / 2,
//                     color: widget.subTwoColor,
//                     onPressed: () {
//                       widget.btnTwoOnpressed();
//                       if (widget.btnTwoClickReverseSlider) {
//                         animationController.reverse();
//                       }
//                     },
//                     child: widget.subTwoChild,
//                   )
//                 ],
//               )),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: SizedBox(
//               height: widget.height,
//               width: widget.width - animation.value,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: widget.mainColor,
//                   elevation: 1,
//                 ),
//                 onPressed: () {
//                   animationController.forward();
//                 },
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: widget.mainChild,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/// Global Buttons for this app.
class ButtonControllers {
  ButtonControllers._internal();

  static final ButtonControllers _instance = ButtonControllers._internal();

  factory ButtonControllers() => _instance;

  /// Customisable Rounded Button.
  ///
  /// If this button triggers a controller request, the passed [controller]
  /// **Must have a memebr called** [isLoading], which is a [bool] that is used
  /// to display a loading indicator on the button. It should also extend the [GetxController] class.
  /// **Don't pass a [controller] without [isLoading] or vise versa**.
  Widget customRoundedLoaderButton(
    BuildContext context, {
    String? text,
    void Function()? onPressed,
    Color? color,
    Color? textColor,
    double? fontSize,
    BorderRadius? borderRadius,
    double? height,
    double? width,
    EdgeInsets? padding,
    final controller,
    final isLoading,
  }) {
    return Container(
      width: width ?? MySize.width * 0.9,
      height: height ?? MySize.height * 0.06,
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color ?? MyColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? MyRadius.lCircularRadius,
          ),
        ),
        child: isLoading == null
            ? Text(
                text ?? '',
                style: TextStyle(
                  color: textColor ?? MyColors.white,
                  fontSize: fontSize ?? MySize.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              )
            : isLoading.value
                ? const CircularProgressIndicator(
                    color: MyColors.white,
                  )
                : Text(
                    text ?? '',
                    style: TextStyle(
                      color: textColor ?? MyColors.white,
                      fontSize: fontSize ?? MySize.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      ),
    );
  }

  // final double width;
  // final double height;
  // final Widget mainChild;
  // final Widget subOneChild;
  // final Widget subTwoChild;
  // final Color mainColor;
  // final Color subOneColor;
  // final Color subTwoColor;
  // final Function btnOneOnpressed;
  // final Function btnTwoOnpressed;
  // final bool btnOneClickReverseSlider;
  // final bool btnTwoClickReverseSlider;

  // Widget customSliderConfirmButton(
  //     {required double width,
  //     required double height,
  //     required Widget mainChild,
  //     required Widget subOneChild,
  //     required Widget subTwoChild,
  //     Color mainColor = Colors.blue,
  //     Color subOneColor = Colors.green,
  //     Color subTwoColor = Colors.red,
  //     required Function btnOneOnpressed,
  //     required Function btnTwoOnpressed,
  //     bool btnOneClickReverseSlider = true,
  //     bool btnTwoClickReverseSlider = true}) {
  //   return ConfirmButton(
  //     width: width,
  //     height: height,
  //     mainChild: mainChild,
  //     subOneChild: subOneChild,
  //     subTwoChild: subTwoChild,
  //     mainColor: mainColor,
  //     subOneColor: subOneColor,
  //     subTwoColor: subTwoColor,
  //     btnOneOnpressed: btnOneOnpressed,
  //     btnTwoOnpressed: btnTwoOnpressed,
  //     btnOneClickReverseSlider: btnOneClickReverseSlider,
  //     btnTwoClickReverseSlider: btnTwoClickReverseSlider,
  //   );
  // }

  Widget drawerTextButton(
    BuildContext context, {
    required String? text,
    void Function()? onPressed,
    // Color? color,
    Icon? icons,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10.0),
      color: MyColors.background,
      child: Row(
        children: [
          Text(text!),
          const Spacer(),
          icons ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
