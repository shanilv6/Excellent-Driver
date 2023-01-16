import 'package:edriver/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'color_constant.dart';

class BorderRadiusStyles {
  static final BorderRadius roundedBorder6 = BorderRadius.circular(6);
  static final BorderRadius roundedBorder20 = BorderRadius.circular(20);
  static final BorderRadius roundedBorder8 = BorderRadius.circular(8);

  static final BorderRadius roundedBorder16 = BorderRadius.circular(16);

}

class Textstyles {
  static final TextStyle hintStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(14),
    color: HexColor('#33334F'),
  );
  static final TextStyle titleStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(32),
    color: ColorConstant.titleColor,
  );
  static final TextStyle subTitleStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(16),
    color: ColorConstant.titleColor.withOpacity(0.5),
  );
  static final TextStyle buttonStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.constantWhite,
  );
  static final TextStyle countryNameStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(16),
    color: ColorConstant.constantBlack,
  );
  static final TextStyle termsStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(16),
    color: ColorConstant.termsColor.withOpacity(0.5),
  );
  static final TextStyle termsStyleNew = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(16),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle orConditionStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(16),
    color: ColorConstant.orConditionColor,
  );
  static final TextStyle signupWithGoogleStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.titleColor.withOpacity(0.5),
  );
  static final TextStyle loginIndicationStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(16),
    color: ColorConstant.termsColor.withOpacity(0.5),
  );
  static final TextStyle loginIndicationStyleNew = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(16),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle forgotPasswordStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(24),
    color: ColorConstant.constantBlack,
  );
  static final TextStyle otpSendEmailTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: ColorConstant.gray700,
  );
  static final TextStyle emailTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(14),
    color: ColorConstant.constantBlack,
  );
  static final TextStyle emailSendIndicatorTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: ColorConstant.emailSendIndicatorColor,
  );
  static final TextStyle otpTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(24),
    color: ColorConstant.constantBlack);
  static final TextStyle newPasswordEnterIndicationStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: ColorConstant.constantBlack,
  );
  static final TextStyle appbarTitleStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(16),
    color: ColorConstant.constantWhite,
  );
  static final TextStyle carouselImageTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.carouselImageTextColor,
  );
  static final TextStyle bookNowButtonStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.constantWhite,
  );
  static final TextStyle callUsButtonStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle whatsappButtonStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.whatsappTextColor,
  );
  static final TextStyle selectedLabelStyleBottom = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(10),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle unSelectedLabelStyleBottom = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(10),
    color: ColorConstant.unSelectedIconColorBottom,
  );
  static final TextStyle bookingConformationTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(20),
    color: ColorConstant.bookingConformationTextColor,
  );
  static final TextStyle bookingConformationSubTitle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(20),
    color: ColorConstant.carouselImageTextColor,
  );
  static final TextStyle bookingConformationErrorTitle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(20),
    color: ColorConstant.bookingConformationErrorTitle,
  );
  static final TextStyle unSelectedLabelStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle upcomingBookingTitleStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.titleColor,
  );
  static final TextStyle upcomingBookingSubTitle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(14),
    color: ColorConstant.titleColor,
  );
  static final TextStyle upcomingBookingElementStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(14),
    color: ColorConstant.titleColor.withOpacity(0.5),
  );
  static final TextStyle upcomingBookingDateStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(12),
    color: ColorConstant.titleColor.withOpacity(0.5),
  );
  static final TextStyle bookingCompletedTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(12),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle bookingCancelledTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(12),
    color: ColorConstant.red800,
  );
  static final TextStyle nothingToShowTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(16),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle PopupTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: ColorConstant.buttonBlue,
  );
  static final TextStyle PopupTitleTextStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(16),
    color: ColorConstant.gray901,
  );
  static final TextStyle popupoadingStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(10),
    color: ColorConstant.constantWhite,
  );
  static final TextStyle profilePicDeleteStyle = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(14),
    color:ColorConstant.buttonBlue,
  );
}
