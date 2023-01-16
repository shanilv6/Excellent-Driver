import 'package:edriver/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils.dart';
import '../../../widgets/already_account_button.dart';
import '../../../widgets/button_container.dart';
import '../../../widgets/google_signup_container.dart';
import '../../../widgets/signup_textfield.dart';
import '../../../widgets/title_texts.dart';
import 'controller/signup_controller.dart';

bool checkBoxValue = false;
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  bool visibility = false;
  bool obscureTextValue = true;
  final fullNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final mobileNumberFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  var signupcontrollers = Get.put(SignupController());

   void printMessege(){
     Utils.oneTimeSnackBar("User accepted the agreement");
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                // Title text
                const TitleTexts(
                  mainTitle: 'Welcome',
                  subTitle: 'Please enter your details.',
                ),
                SizedBox(
                  height: getVerticalSize(24),
                ),
                //Signup textfields
                //Fullname textfield
                SignupTextfield(

                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  textFieldValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the name";
                    } else if (value.length < 3) {
                      return 'Too short';
                    }
                    return null;
                  },
                  textFieldController:
                      signupcontrollers.fullNameTextfieldController,
                  textFieldKeyboardType: TextInputType.text,
                  formKey: fullNameFormKey,
                  obscureTextValues: false,
                  hintText: 'Full Name',
                  prefixicons: ImageIcon(
                    AssetImage(ImageConstant.contactIcon),
                    color: ColorConstant.buttonBlue,
                  ),
                ),
                constantHeightForTextfields,

                //Email textfield
                SignupTextfield(

                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  textFieldValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the Email";
                    } else if (!value.contains('@gmail') || !value.contains('.com')) {
                      return 'Invaild Email';
                    }
                    return null;
                  },
                  textFieldController: signupcontrollers.emailTextfieldController,
                  textFieldKeyboardType: TextInputType.emailAddress,
                  formKey: emailFormKey,
                  obscureTextValues: false,
                  hintText: 'Email Address',
                  prefixicons: ImageIcon(
                    AssetImage(ImageConstant.emailIcon),
                    color: ColorConstant.buttonBlue,
                  ),
                ),
                constantHeightForTextfields,

                //Mobile number textfield
                SignupTextfield(

                    textfieldHeight: 50,
                    textfieldWidth: 297,
                    textFieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Mobile number";
                      } else if (value.length < 10) {
                        return 'Invalid Mobile number';
                      }
                      return null;
                    },
                    textFieldController:
                        signupcontrollers.mobileNumberTextfieldController,
                    textFieldKeyboardType: TextInputType.phone,
                    formKey: mobileNumberFormKey,
                    obscureTextValues: false,
                    hintText: 'Mobile Number',
                    prefixicons: ImageIcon(
                      AssetImage(ImageConstant.phoneIcon),
                      color: ColorConstant.buttonBlue,
                    )),
                constantHeightForTextfields,

                //Password textfield
                SignupTextfield(

                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  textFieldValidator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please Enter the Password";
                    } else if (value.length < 8) {
                      return 'Minimum length 8 required';
                    }
                    return null;
                  },
                  textFieldController:
                      signupcontrollers.passwordTextfieldController,
                  textFieldKeyboardType: TextInputType.text,
                  formKey: passwordFormKey,
                  obscureTextValues: obscureTextValue,
                  hintText: 'Password',
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
                constantHeightForTextfields,

                Padding(
                  padding: getPadding(
                    left: 17,
                  ),
                  child: Row(
                    children: [
                      Checkbox(

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          side: BorderSide(
                            color: ColorConstant.buttonBlue,
                          ),
                          value: isChecked,

                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                              checkBoxValue = value;
                            });
                          }),
                      Row(
                        children: [
                          Text(
                            'I agree with',
                            style: Textstyles.termsStyle,
                          ),
                          Text(
                            ' Terms',
                            style: Textstyles.termsStyleNew,
                          ),
                          Text(
                            ' and',
                            style: Textstyles.termsStyle,
                          ),
                          Text(
                            ' Privacy',
                            style: Textstyles.termsStyleNew,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                constantHeightForTextfields,
                Obx(()=>
                  GestureDetector(
                      onTap: () {
                        if (fullNameFormKey.currentState!.validate()) {
                          if (emailFormKey.currentState!.validate()) {
                            if (mobileNumberFormKey.currentState!.validate()) {
                              if (passwordFormKey.currentState!.validate()) {
                                (checkBoxValue == true)?
                                signupcontrollers.signup().then((value) => (signupcontrollers.isSignupSuccess.value == true) ? Get.toNamed('/LoginScreen') : null):
                                Utils.oneTimeSnackBar("Accept terms and conditions",
                                    bgColor: Colors.red, time: 3);
                              }
                            }
                          }
                        }
                      },
                      child:  ButtonContainer(
                        borderRadius: 20,
                        buttonTextStyle: Textstyles.buttonStyle,
                        buttonColor: ColorConstant.buttonBlue,
                        isLoadingVariable:signupcontrollers.isLoading.value ,
                        buttonHeight: 45,
                        buttonName: 'Sign Up',
                        buttonWidth: 297,
                      )),
                ),
                constantHeightForTextfields,
                Text(
                  'Or',
                  style: Textstyles.orConditionStyle,
                ),
                constantHeightForTextfields,
                //Google signup container
                const GoogleSignupContainer(
                  boxText: 'Sign Up with Google',
                ),
                constantHeightForTextfields,
                //Already account button
                AlreadyAccountButton(

                    texts: 'Already have an account?',
                    buttonText: 'Log In',
                    onPressed: (){Get.toNamed('/LoginScreen');}),
              ],
            ),
          ],
        )),

    );
  }
}
