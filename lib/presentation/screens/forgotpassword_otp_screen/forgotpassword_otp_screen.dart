import 'package:edriver/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';



import '../../../widgets/button_container.dart';
import '../../../widgets/forgotpassword_image_section.dart';
import '../../../widgets/forgotpassword_title_text.dart';
import '../forgotpassword_screen/controller/forgotpassword_controller.dart';
import 'controller/forgotpassword_otpcontroller.dart';



class ForgotPasswordOtpScreen extends StatelessWidget {
  ForgotPasswordOtpScreen({Key? key}) : super(key: key);

  OtpFieldController otpController = OtpFieldController();
  var forgotPasswordController = Get.put(ForgotPasswordController());
  final forgotPasswordOTPFormKey = GlobalKey<FormState>();
  var forgotPasswordOtpController = Get.put(ForgotPasswordOtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
               ForgotPasswordImageSection(
                  imagePath: ImageConstant.forgotPasswordimage2,
                  imageContainerHeight: 292,
                  imageContainerwidth: 300,
                  gap: 23.27,
                  arrowLeftPadding: 26,
                  arrowTopPadding: 43,
                  containerLeftPadding: 32,
                  containerRightPadding: 43),
              SizedBox(
                height: getVerticalSize(12),
              ),
              const ForgotPasswordTitleText(
                  containerRightPadding: 183,
                  containerLeftPadding: 37,
                  containerWidth: 133,
                  firstText: 'OTP',
                  secondText: 'Verification'),
              constantHeightForTextfields,
              Padding(
                padding: getPadding(left: 39, right: 33),
                child: Container(
                  width: getHorizontalSize(292),
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text(
                        'Enter the OTP sent to',
                        style: Textstyles.otpSendEmailTextStyle,
                      ),
                      Text(
                        ' ${forgotPasswordController.forgotPasswordEmailTextController.text}',
                        overflow: TextOverflow.ellipsis,
                        style: Textstyles.emailTextStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              constantHeightForTextfields,
              Padding(
                padding: getPadding(
                  left: 43,
                  right: 35,
                ),
                child: Form(
                  key: forgotPasswordOTPFormKey,
                  child:
                  Pinput(
                    length: 4,

                    keyboardType: TextInputType.number,
                    defaultPinTheme: PinTheme(
                      margin: getPadding(
                        right: 20,
                      ),
                      width: getHorizontalSize(56),
                      height: getVerticalSize(56),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(bottom: BorderSide(color: ColorConstant.constantBlack)))
                    ),
                    controller: forgotPasswordOtpController.forgotPasswordOtpTextController,
                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return 'OTP is incomplete';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              constantHeightForTextfields,
              // Don’t receive code ? Re-send
              Padding(
                padding: getPadding(left: 77, right: 77),
                child: Container(
                  width: getHorizontalSize(185),
                  height: getVerticalSize(18),
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text(
                        'Don’t receive code ?',
                        style: Textstyles.otpSendEmailTextStyle,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(

                          child: Text(
                            ' Re-send',
                            style: Textstyles.emailTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getVerticalSize(24),),
              GestureDetector(
                onTap: (){
                  if (forgotPasswordOTPFormKey.currentState!.validate()) {
                    Get.toNamed('/ForgotPasswordSetPasswordScreen');
                  }



                },
                child: Padding(
                  padding: getPadding(
                    left: 37,
                    right: 37.83,
                  ),
                  child:  ButtonContainer(
                    borderRadius: 20,
                      buttonTextStyle: Textstyles.buttonStyle,
                      buttonColor: ColorConstant.buttonBlue,
                      buttonName: 'Submit', buttonHeight: 45, buttonWidth: 300.17),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
