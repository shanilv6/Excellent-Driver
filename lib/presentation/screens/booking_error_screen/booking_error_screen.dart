import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/style.dart';
import '../../../widgets/button_container.dart';

class BookingErrorScreen extends StatelessWidget {
  const BookingErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getVerticalSize(63)),
        child: Container(
          color: ColorConstant.buttonBlue,
          height: getVerticalSize(114),

        ),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:getPadding(
                  left: 110,
                  right: 110,
                  top: 90,
                ),
                child: Container(
                    height: getVerticalSize(24),
                    width: getHorizontalSize(127),
                    decoration: BoxDecoration(color: ColorConstant.transparent,),
                    child:Text('Whoops s....',style: Textstyles.bookingConformationErrorTitle,)
                ),
              ),

              Padding(
                padding: getPadding(
                  left: 30,
                  right: 17,
                  top: 54,
                ),
                child: Container(
                  height: getVerticalSize(99),
                  width: getHorizontalSize(328),
                  decoration: BoxDecoration(color: ColorConstant.transparent,image:  DecorationImage(image: AssetImage(ImageConstant.bookingConformationError))),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 78,
                  right: 63,
                  left: 63,
                ),
                child: Container(

                    child: Text('Something Went Wrong',style: Textstyles.bookingConformationSubTitle,)),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed('/BookNowScreen');
                },
                child: Padding(
                  padding: getPadding(
                    right: 39,
                    left: 39,
                    top: 80,
                  ),
                  child: ButtonContainer(
                    borderRadius: 20,
                      buttonTextStyle: Textstyles.buttonStyle,
                      buttonColor: ColorConstant.buttonBlue,
                      buttonName: 'Try Again', buttonHeight: 39.57, buttonWidth: 297),
                ),
              ),
            ],
          )),
    );
  }
}
