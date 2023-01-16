import 'package:flutter/cupertino.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class BookingStatusButton extends StatelessWidget {
  final borderColor;
  final textStyle;
  final String title;
  const BookingStatusButton({Key? key,required this.borderColor,required this.title,required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: getPadding(
        left: 208,
        top: 28,
        right: 38,
        bottom: 190,
      ),
      child: Container(

        width: getHorizontalSize(91),
        height: getVerticalSize(24),
        decoration: BoxDecoration(
            color: ColorConstant.transparent,
            borderRadius: BorderRadiusStyles.roundedBorder16,
            border: Border.all(
              color: borderColor,
              width: 1.5,
            )),
        child: Center(child: Text(title,style:textStyle),),
      ),
    );
  }
}
