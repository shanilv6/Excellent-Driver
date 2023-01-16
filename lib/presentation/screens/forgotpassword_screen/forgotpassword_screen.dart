import 'package:edriver/core/app_export.dart';
import 'package:edriver/presentation/screens/forgotpassword_otp_screen/forgotpassword_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/size_utils.dart';
import '../../../widgets/button_container.dart';
import '../../../widgets/forgotpassword_image_section.dart';
import '../../../widgets/forgotpassword_title_text.dart';
import '../../../widgets/signup_textfield.dart';
import 'controller/forgotpassword_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);
  final forgotPasswordEmailFormKey = GlobalKey<FormState>();
   var forgotPasswordController = Get.put(ForgotPasswordController());
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
              //Image section

               ForgotPasswordImageSection(
                imagePath: ImageConstant.forgotPasswordimage1,
                arrowTopPadding: 43,
                arrowLeftPadding: 26,
                containerLeftPadding: 39,
                containerRightPadding: 40,
                gap: 93.27,
                imageContainerHeight: 197,
                imageContainerwidth: 296,
              ),

              SizedBox(
                height: getVerticalSize(48),
              ),
              //Forgotpassword Title text
              const ForgotPasswordTitleText(
                  containerRightPadding: 190,
                  containerLeftPadding: 35,
                  containerWidth: 127,
                  firstText: 'Forgot',
                  secondText: 'Password?'),
              constantHeightForTextfields,

              Padding(
                padding: getPadding(
                  left: 35,
                  right: 43,
                ),
                child: Container(
                  width: getHorizontalSize(297),
                  height: getVerticalSize(38),
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Don’t worry ! It happens. Please enter the',
                        style: Textstyles.otpSendEmailTextStyle,
                      ),
                      Text(
                        'Email ID we will send an OTP to the Email.',
                        style: Textstyles.otpSendEmailTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              constantHeightForTextfields,
              // Email Textfield
              Padding(
                padding: getPadding(
                  left: 35,
                  right: 43,
                ),
                child: SignupTextfield(
                  textFieldKeyboardType: TextInputType.emailAddress,
                  textFieldController:forgotPasswordController.forgotPasswordEmailTextController ,
                  formKey:forgotPasswordEmailFormKey ,
                  textFieldValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the Email";
                    } else if (!value.contains('@gmail') || !value.contains('.com')) {
                      return 'Invaild Email';
                    }
                    return null;
                  },
                    hintText: 'Email ID',
                    textfieldHeight: 39.57,
                    textfieldWidth: 297,
                    obscureTextValues: false),
              ),
              SizedBox(
                height: getVerticalSize(24),
              ),
              GestureDetector(
                onTap: () {

                    if (forgotPasswordEmailFormKey.currentState!.validate()) {

                      Get.toNamed('/ForgotPasswordOtpScreen');
                    }


                },
                child: Padding(
                  padding: getPadding(
                    left: 35,
                    right: 39.83,
                  ),
                  child:  ButtonContainer(
                    borderRadius: 20,
                    buttonTextStyle: Textstyles.buttonStyle,
                    buttonColor: ColorConstant.buttonBlue,
                      buttonName: 'Continue',
                      buttonHeight: 35.61,
                      buttonWidth: 297),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
