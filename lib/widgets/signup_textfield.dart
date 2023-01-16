import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class SignupTextfield extends StatelessWidget {
  final String hintText;
  final  prefixicons;
  final suffixIcons;
  final obscureTextValues;
  final formKey;
  final textFieldController;
  final textFieldKeyboardType;
  final textFieldValidator;
  final double textfieldHeight;
  final double textfieldWidth;
  final double bottompadding;
  final sufix;
  const SignupTextfield({Key? key,required this.hintText,this.bottompadding=0,this.sufix, required this.textfieldHeight,required this.textfieldWidth,this.prefixicons,this.suffixIcons,required this.obscureTextValues, this.formKey, this.textFieldController, this.textFieldKeyboardType, this.textFieldValidator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: getPadding(
        bottom: bottompadding,
      ),
      child: Container(
        height: getVerticalSize(textfieldHeight),
        width: getHorizontalSize(textfieldWidth),
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: textFieldController,
            keyboardType: textFieldKeyboardType,
            validator: textFieldValidator,
            obscureText: obscureTextValues,
            decoration: InputDecoration(
suffix: sufix,
              suffixIcon: suffixIcons,
                prefixIcon:prefixicons,
                fillColor: ColorConstant.constantWhite,
                filled: true,
                hintText: hintText,
                hintStyle: Textstyles.hintStyle,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: ColorConstant.buttonBlue, width: 1),
                    borderRadius:BorderRadiusStyles.roundedBorder6)),
          ),
        ),
      ),
    );
  }
}
