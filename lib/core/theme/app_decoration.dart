import 'package:flutter/material.dart';
import 'package:edriver/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineLightblue800 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.lightBlue800,
          width: getHorizontalSize(
            5.00,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder75 = BorderRadius.circular(
    getHorizontalSize(
      75.00,
    ),
  );
}
