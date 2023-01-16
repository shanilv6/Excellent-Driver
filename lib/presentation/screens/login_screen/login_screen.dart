import 'package:edriver/core/app_export.dart';
import 'package:edriver/widgets/already_account_button.dart';
import 'package:edriver/widgets/button_container.dart';
import 'package:edriver/widgets/google_signup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/signup_textfield.dart';
import '../../../widgets/title_texts.dart';
import '../profile_screen/controller/profile_controller.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginController = Get.put(LoginController());

  bool visibility = false;

  bool obscureTextValue = true;
  final loginMobileNumberFormkey = GlobalKey<FormState>();
  final loginPasswordFormkey = GlobalKey<FormState>();
  var profileDataController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              const TitleTexts(
                mainTitle: 'Welcome Back',
                subTitle: 'Please enter the details.',
              ),
              SizedBox(
                height: getVerticalSize(24),
              ),
              SignupTextfield(
                textfieldHeight: 50,
                textfieldWidth: 297,
                hintText: 'Mobile Number',
                obscureTextValues: false,
                textFieldController:
                    loginController.loginMobileNumberTextfieldController,
                textFieldKeyboardType: TextInputType.number,
                formKey: loginMobileNumberFormkey,
                textFieldValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the Mobile number";
                  } else if (value.length < 10) {
                    return 'Invalid Mobile number';
                  }
                  return null;
                },
              ),
              constantHeightForTextfields,
              SignupTextfield(
                textfieldHeight: 50,
                textfieldWidth: 297,
                hintText: 'Password',
                obscureTextValues: obscureTextValue,
                textFieldController:
                    loginController.loginPasswordTextfieldController,
                formKey: loginPasswordFormkey,
                textFieldKeyboardType: TextInputType.text,
                suffixIcons: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextValue = !obscureTextValue;
                        visibility = !visibility;
                      });
                    },
                    icon: (visibility == false)
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                textFieldValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the Password";
                  } else if (value.length < 8) {
                    return 'Minimum length 8 required';
                  }
                  return null;
                },
              ),
              constantHeightForTextfields,
              Padding(
                padding: getPadding(right: 157),
                child: TextButton(
                    onPressed: () {
                      Get.toNamed('/ForgotPasswordScreen');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: Textstyles.termsStyleNew,
                    )),
              ),
              constantHeightForTextfields,
              Obx(
                () => GestureDetector(
                    onTap: () {
                      if (loginMobileNumberFormkey.currentState!.validate()) {
                        if (loginPasswordFormkey.currentState!.validate()) {
                          loginController.login().then((value) =>
                              (loginController.isLoginSuccess.value == true)
                                  ? Get.toNamed('/BottomNavigationBar')
                                  : null);
                        }
                      }
                    },
                    child: ButtonContainer(
                      borderRadius: 20,
                      buttonTextStyle: Textstyles.buttonStyle,
                      buttonColor: ColorConstant.buttonBlue,
                      isLoadingVariable: loginController.isLoading.value,
                      buttonName: 'Log in',
                      buttonWidth: 297,
                      buttonHeight: 45,
                    )),
              ),
              constantHeightForTextfields,
              Text(
                'Or',
                style: Textstyles.orConditionStyle,
              ),
              constantHeightForTextfields,
              const GoogleSignupContainer(boxText: 'Log in with Google'),
              constantHeightForTextfields,
              AlreadyAccountButton(
                texts: 'Dont have a account?',
                buttonText: 'Sign up',
                onPressed: () {
                  Get.toNamed('/SignupScreen');
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}
