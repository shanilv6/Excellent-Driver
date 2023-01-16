import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class GoogleSignupContainer extends StatelessWidget {
  final boxText;
  const GoogleSignupContainer({Key? key,required this.boxText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: getVerticalSize(50),
      width: getHorizontalSize(297),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusStyles.roundedBorder6,
          color: ColorConstant.constantWhite,
          border:
          Border.all(color: ColorConstant.buttonBlue, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: getVerticalSize(18),
            width: getHorizontalSize(15),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(ImageConstant.googleIcon),
              ),
            ),
          ),
          SizedBox(
            width: getHorizontalSize(5),
          ),
          Text(
            boxText,
            style: Textstyles.signupWithGoogleStyle,
          )
        ],
      ),
    );
  }
}

