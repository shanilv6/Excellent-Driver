import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';
import '../presentation/screens/login_screen/controller/login_controller.dart';

class ButtonContainer extends StatelessWidget {
  final String buttonName;
  final double buttonWidth;
  final double buttonHeight;
  final bool isLoadingVariable;
  final buttonColor;
  final double borderRadius;
  final bool isLoadingVariableForPopup;
  final buttonTextStyle;
   ButtonContainer({Key? key,required this.buttonName,required this.buttonTextStyle,required this.borderRadius,this.isLoadingVariableForPopup=false,required this.buttonColor,this.isLoadingVariable=false,required this.buttonHeight,required this.buttonWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(buttonWidth),
      height: getVerticalSize(buttonHeight),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonColor),
      child:(isLoadingVariable == true)? Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        SizedBox(child: CircularProgressIndicator(strokeWidth: 2,color:ColorConstant.constantWhite ,),height: getVerticalSize(22),width: getHorizontalSize(22),),
        SizedBox(width: getHorizontalSize(10),),
        Text('Please Wait...',style: Textstyles.buttonStyle,)
      ],)
          :(isLoadingVariableForPopup == true) ?Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        SizedBox(child: CircularProgressIndicator(strokeWidth: 2,color:ColorConstant.constantWhite ,),height: getVerticalSize(15),width: getHorizontalSize(15),),
        SizedBox(width: getHorizontalSize(4),),
        Text('Please Wait...',style: Textstyles.popupoadingStyle,)
      ],) :
      Center(
        child: Text(
         buttonName,
          style: buttonTextStyle
        ),
      ),
    );
  }
}
