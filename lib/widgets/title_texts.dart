import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class TitleTexts extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  const TitleTexts({Key? key,required this.mainTitle,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.center,
        child: Padding(
          //absalute position
          padding: getPadding(
            top: 43,
          ),
          child: Text(
            mainTitle,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: getFontSize(32),
              color: ColorConstant.titleColor,
            ),
          ),
        ),
      ),
      SizedBox(
        height: getVerticalSize(8),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          subTitle,
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w500,
            fontSize: getFontSize(16),
            color: ColorConstant.titleColor.withOpacity(0.5),
          ),
        ),
      ),
    ],);
  }
}
