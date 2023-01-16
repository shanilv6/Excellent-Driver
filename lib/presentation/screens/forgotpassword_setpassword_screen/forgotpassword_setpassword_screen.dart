import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/style.dart';
import '../../../widgets/button_container.dart';
import '../../../widgets/forgotpassword_image_section.dart';
import '../../../widgets/forgotpassword_title_text.dart';
import '../../../widgets/signup_textfield.dart';
import 'controller/setpassword_controller.dart';

class ForgotPasswordSetPasswordScreen extends StatefulWidget {
   ForgotPasswordSetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSetPasswordScreen> createState() => _ForgotPasswordSetPasswordScreenState();
}

class _ForgotPasswordSetPasswordScreenState extends State<ForgotPasswordSetPasswordScreen> {
  final newPasswordFormKey = GlobalKey<FormState>();
  final confirmPasswordFormKey = GlobalKey<FormState>();

var setPasswordController = Get.put(SetPasswordController());

   bool visibility = false;

   bool obscureTextValue = true;
  bool visibilityForConfirmPassword = false;

  bool obscureTextValueForConfirmPassword = true;

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
                    imagePath:ImageConstant.forgotPasswordimage3,
                    arrowTopPadding: 43,
                    arrowLeftPadding: 26,
                    containerLeftPadding: 59,
                    containerRightPadding: 58,
                    gap: 8.27,
                    imageContainerHeight: 295,
                    imageContainerwidth: 258,
                  ),

                  constantHeightForTextfields,




                  const ForgotPasswordTitleText(
                      containerRightPadding: 195,
                      containerLeftPadding: 35,
                      containerWidth: 114,
                      firstText: 'Set new',
                      secondText: 'Password'),
                  constantHeightForTextfields,

                  Padding(
                    padding: getPadding(
                      left: 37,
                      right: 86,
                    ),
                    child: Container(
                      width: getHorizontalSize(252),
                      height: getVerticalSize(20),
                      color: Colors.transparent,
                      child: Text(
                        'Enter your new password below .',
                        style: Textstyles.newPasswordEnterIndicationStyle,
                      ),
                    ),
                  ),
                  constantHeightForTextfields,
                  //Password Textfield
                  Padding(
                    padding: getPadding(
                      left: 38,
                      right: 40,
                    ),
                    child: SignupTextfield(
                        textFieldController:setPasswordController.newPasswordController ,
                        formKey:newPasswordFormKey ,
                        textFieldValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter the Password";
                          } else if (value.length < 8) {
                            return 'Minimum length 8 required';
                          }
                          return null;
                        },
                        hintText: 'Password',
                        textfieldHeight: 50,
                        textfieldWidth: 297,
                        obscureTextValues: obscureTextValue,
                      prefixicons: ImageIcon(
                        AssetImage(ImageConstant.passwordIcon),
                        color: ColorConstant.buttonBlue,
                      ),
                      suffixIcons: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextValue = !obscureTextValue;
                              visibility = !visibility;
                            });
                          },
                          icon: (visibility == true)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                    ),
                  constantHeightForTextfields,
                  //Confirm Password Textfield

                  Padding(
                    padding: getPadding(
                      left: 38,
                      right: 40,
                    ),
                    child: SignupTextfield(
                      textFieldController:setPasswordController.confirmPasswordController ,
                      formKey:confirmPasswordFormKey ,
                      textFieldValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Confirm the password';
                        }else if (value!= setPasswordController.newPasswordController.text){
                        return 'Password is not matching';
                        }
                        return null;
                      },
                      hintText: 'Confirm Password',
                      textfieldHeight: 50,
                      textfieldWidth: 297,
                      obscureTextValues: obscureTextValueForConfirmPassword,
                      prefixicons: ImageIcon(
                        AssetImage(ImageConstant.passwordIcon),
                        color: ColorConstant.buttonBlue,
                      ),
                      suffixIcons: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextValueForConfirmPassword = !obscureTextValueForConfirmPassword;
                              visibilityForConfirmPassword = !visibilityForConfirmPassword;
                            });
                          },
                          icon: (visibilityForConfirmPassword == true)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(22),
                  ),
                  GestureDetector(
                    onTap: () {


                      if (newPasswordFormKey.currentState!.validate()) {
                        if (confirmPasswordFormKey.currentState!.validate()) {
                          Get.toNamed('/LoginScreen');
                        }
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
                          buttonName: 'Submit & Return to Login screen',
                          buttonHeight: 45,
                          buttonWidth: 300.17),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
