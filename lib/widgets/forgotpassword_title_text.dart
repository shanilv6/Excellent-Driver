import 'package:flutter/material.dart';

import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class ForgotPasswordTitleText extends StatelessWidget {
  final double containerWidth;
  final String firstText;
  final String secondText;
  final double containerLeftPadding;
  final double containerRightPadding;
  const ForgotPasswordTitleText({Key? key,required this.containerRightPadding, required this.containerLeftPadding, required this.containerWidth, required this.firstText, required this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: getPadding(
        left: containerLeftPadding,
        right: containerRightPadding,
      ),
      child: Container(
        width: getHorizontalSize(containerWidth),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             firstText,
              style: Textstyles.forgotPasswordStyle,
            ),
            Text(
              secondText,
              style: Textstyles.forgotPasswordStyle,
            ),
          ],
        ),
      ),
    );
  }
}
