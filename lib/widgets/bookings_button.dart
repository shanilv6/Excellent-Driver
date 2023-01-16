import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class BookingsButton extends StatelessWidget {
  final borderColor;
  final buttonColor;
  final textStyles;
  final String iconPath;
  final double topPadding;
  final String buttonText;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final double buttonHeight;
  final double buttonWidth;
  final bool isLoadingVariable;
  final indicatorColor;
  const BookingsButton(
      {Key? key,
      required this.borderColor,
      this.indicatorColor,
      this.isLoadingVariable = false,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.topPadding,
      required this.iconPath,
      required this.buttonColor,
      this.bottomPadding = 0,
      this.leftPadding = 0,
      this.rightPadding = 0,
      required this.buttonText,
      required this.textStyles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: topPadding,
        left: leftPadding,
        right: rightPadding,
        bottom: bottomPadding,
      ),
      child: Container(
        width: getHorizontalSize(buttonWidth),
        height: getVerticalSize(buttonHeight),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadiusStyles.roundedBorder20,
            border: Border.all(color: borderColor, width: 1)),
        child: (isLoadingVariable == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ColorConstant.constantWhite,
                    ),
                    height: getVerticalSize(22),
                    width: getHorizontalSize(22),
                  ),
                  SizedBox(
                    width: getHorizontalSize(10),
                  ),
                  Text(
                    'Please Wait...',
                    style: textStyles,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getVerticalSize(20),
                    width: getHorizontalSize(20),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(iconPath))),
                  ),
                  SizedBox(
                    width: getHorizontalSize(6),
                  ),
                  Text(
                    buttonText,
                    style: textStyles,
                  ),
                ],
              ),
      ),
    );
  }
}
