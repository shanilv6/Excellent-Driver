import 'package:flutter/material.dart';
import 'package:edriver/core/app_export.dart';


class AppStyle {
  static TextStyle txtPlusJakartaSansBold32 = TextStyle(
    color: ColorConstant.gray900,
    fontSize: getFontSize(
      32,
    ),
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtRobotoRomanSemiBold16 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPlusJakartaSansMedium16 = TextStyle(
    color: ColorConstant.gray90087,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );
}
