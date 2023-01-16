import 'dart:async';

import 'package:edriver/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/bookings_button.dart';
import '../../../widgets/custom_appbar.dart';
import '../booknow_screen/controller/booking_controller.dart';

class BookingConformationScreen extends StatelessWidget {
  BookingConformationScreen({Key? key}) : super(key: key);
  var bookinController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getVerticalSize(70)),
        child:   CustomAppbarWithicon(
            arrowOnTap: (){
              Get.back();
            },
          titleName: 'Book Your Ride Here',
            arrowBottomPadding: 20,
            arrowTopPadding: 54,
            titleContainerHeight: 24,
            titleContainerWidth: 160,
            gap: 12,
            rowLeftPadding: 24,
            rowRightPadding: 110,
            titleBottomPadding: 20,
            titleTopPadding: 52),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:getPadding(
                  left: 52,

                  top: 105,
                ),
                child: Container(
                    height: getVerticalSize(24),
                    width: getHorizontalSize(256),
                    decoration: BoxDecoration(color: ColorConstant.transparent,),
                    child:Text('Your Booking is Confirmed',style: Textstyles.bookingConformationTextStyle,)
                ),
              ),

              Padding(
                padding: getPadding(
                  left: 24,
                  right: 24,
                  top: 15,
                ),
                child: Container(
                    height: getVerticalSize(126),
                    width: getHorizontalSize(330),
                    decoration: BoxDecoration(color: ColorConstant.transparent,image:  DecorationImage(image: AssetImage(ImageConstant.bookingConformationSuccess))),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 50,
                  right: 65,
                  left: 85,
                ),
                child: Container(child: Text('Driver is on the way',style: Textstyles.bookingConformationSubTitle,)),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed('/BottomNavigationBar');
                },
                child: BookingsButton(
                  buttonWidth: 297,
                    buttonHeight: 39.57,
                    topPadding: 103,
                    leftPadding: 40,
                    rightPadding: 40,
                    borderColor: ColorConstant.buttonBlue,
                    buttonColor: ColorConstant.buttonBlue,
                    buttonText: 'Go to Home',
                    iconPath: ImageConstant.bookingConformationHome,
                    textStyles: Textstyles.bookNowButtonStyle),
              ),
            ],
      )),
    );
  }
}
