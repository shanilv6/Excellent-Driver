import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color gray700 = fromHex('#5b5858');

  static Color gray901 = fromHex('#000929');

  static Color red700 = fromHex('#e11924');

  static Color gray90087 = fromHex('#87000929');

  static Color indigoA4007f = fromHex('#7f4169e1');

  static Color gray800 = fromHex('#4d4c4c');

  static Color gray701 = fromHex('#5a5a5a');

  static Color gray900 = fromHex('#1b1c1e');

  static Color red800 = fromHex('#d11a2a');

  static Color teal50 = fromHex('#ddeaf0');

  static Color black9003f = fromHex('#3f000000');

  static Color green500 = fromHex('#4bb543');

  static Color lightBlue800 = fromHex('#027eba');

  static Color bluegray900 = fromHex('#383636');

  static Color bluegray800 = fromHex('#33334f');

  static Color greenA700 = fromHex('#25d366');

  static Color black900 = fromHex('#000000');

  static Color black90071 = fromHex('#71000000');

  static Color bluegray200 = fromHex('#b3b9c4');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color constantBlack = fromHex('#000000');

  static Color constantWhite = fromHex('#FFFFFF');

  static Color titleColor = fromHex('#000929');

  static Color buttonBlue = fromHex('#027EBA');

  static Color transparent = Colors.transparent;

  static Color termsColor = fromHex('#000000');
  static Color grey400 = fromHex('#9EA3AE');


  static Color orConditionColor = fromHex('#1B1C1E');

  static Color emailSendIndicatorColor = fromHex('#4E4D4D');
  static Color whiteF5 = fromHex('#F5F5F5');
  static Color carouselImageTextColor = fromHex('#1B1C1E');
  static Color homePageBoxShadow = fromHex('#00000040');
  static Color whatsappTextColor = fromHex('#25D366');
  static Color unSelectedIconColorBottom = fromHex('#B3B9C4');
  static Color bookingConformationTextColor = fromHex('#4BB543');
  static Color bookingConformationErrorTitle = fromHex('#E11924');
  static Color homeScreenBackground =Color(0xffddeaf0);








  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
