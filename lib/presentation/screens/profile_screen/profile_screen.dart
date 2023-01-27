import 'dart:io';

import 'package:edriver/widgets/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/style.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/button_container.dart';
import '../../../widgets/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';

import '../edit_profile_screen/edit_profile_screen.dart';
import '../edit_profile_screen/image_config/image_configration.dart';
import '../language_screen/language_controller/language_controller.dart';
import '../login_screen/controller/login_controller.dart';
import '../splash_screen/splash_screen.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profileDataController = Get.put(ProfileController());
  var imageController = Get.put(ImageConfigration());
  var loginController = Get.put(LoginController());
  var languageController = Get.put(LanguageController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.homeScreenBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getVerticalSize(63)),
          child: CustomAppbarWithicon(
              arrowOnTap: () {
                Get.offAllNamed('/BottomNavigationBar');
              },
              titleName: 'Profile',
              arrowBottomPadding: 20,
              arrowTopPadding: 64,
              titleContainerHeight: 24,
              titleContainerWidth: 140,
              gap: 56,
              rowLeftPadding: 24,
              rowRightPadding: 100,
              titleBottomPadding: 20,
              titleTopPadding: 60),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 68,
                        right: 24,
                        left: 24,
                      ),
                      child: Container(
                        width: getHorizontalSize(327),
                        height: getVerticalSize(274),
                        decoration: BoxDecoration(
                            color: ColorConstant.constantWhite,
                            borderRadius: BorderRadiusStyles.roundedBorder20,
                            boxShadow: const [
                              BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  color: Colors.grey,
                                  blurRadius: 4)
                            ]),
                        child: Padding(
                          padding: getPadding(
                            left: 25,
                            top: 125,
                            bottom: 32,
                          ),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Full name email and phone number

                                ProfileContainer(
                                    title: (profileDataController.isLoading ==
                                            true)
                                        ? 'Updating...'
                                        : (profileDataController
                                                    .isDataSuccess ==
                                                true)
                                            ? profileDataController
                                                .profileDatas.name
                                            : '!',
                                    imagePath: ImageConstant.contactIcon),

                                SizedBox(
                                  height: getVerticalSize(32),
                                ),

                                ProfileContainer(
                                    title: (profileDataController.isLoading ==
                                            true)
                                        ? 'Updating...'
                                        : (profileDataController
                                                    .isDataSuccess ==
                                                true)
                                            ? profileDataController
                                                .profileDatas.email
                                            : '!',
                                    imagePath: ImageConstant.emailIcon),

                                SizedBox(
                                  height: getVerticalSize(32),
                                ),

                                ProfileContainer(
                                    title: (profileDataController.isLoading ==
                                            true)
                                        ? 'Updating...'
                                        : (profileDataController
                                                    .isDataSuccess ==
                                                true)
                                            ? profileDataController
                                                .profileDatas.mobile
                                            : '!',
                                    imagePath: ImageConstant.phoneIcon),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 96.5, right: 96.5, top: 28),
                      child:

                      Obx(()=>
                      Container(
                          width: getHorizontalSize(135),
                          height: getHorizontalSize(135),
                          decoration: BoxDecoration(
                            color: ColorConstant.constantWhite,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorConstant.buttonBlue,
                              width: 5,
                            ),
                          ),
                          child: (imageController.isloading.value==true)?Center(child: CircularProgressIndicator(strokeWidth: 2,color: ColorConstant.buttonBlue,),):(imageController.cammeraImage == true)?  Padding(
                            padding: getPadding(

                            ),
                            child: ClipOval(
                              child: Image.file(
                                File(imageValue!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ):(imageController.galleryImage == true)?    Padding(
                            padding: getPadding(

                            ),
                            child: ClipOval(

                              child: Image.file(
                                File(imageValue!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )  :(imageController.isDeleted == true) ?ClipOval(
                            child: Image.asset(
                              ImageConstant.mainProfileIcon,
                            ),
                          ) :(imageController.isDeleted == true) ?ClipOval(
                            child: Image.asset(
                              ImageConstant.mainProfileIcon,
                            ),
                          ):ClipOval(
                            child: Image.asset(
                              ImageConstant.mainProfileIcon,
                            ),
                        ),
                      ),
                    ))
                  ],
                ),
                Padding(
                  padding: getPadding(
                    left: 36,
                    right: 36,
                    top: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {

                            Get.toNamed('/EditProfleScreen');
                          },
                          child: ButtonContainer(
                              buttonTextStyle: Textstyles.buttonStyle,
                              borderRadius: 20,
                              buttonName: 'Edit Profile',
                              buttonColor: ColorConstant.buttonBlue,
                              buttonHeight: 45,
                              buttonWidth: 300.17)),
                      SizedBox(
                        height: getVerticalSize(16),
                      ),
                      // Select language button
                      InkWell(
                        onTap: () {
languageController.languageGetter();
                          Get.toNamed('/SelectLanguageScreen');

                        },
                        child: ButtonContainer(
                            buttonTextStyle: Textstyles.buttonStyle,
                            borderRadius: 20,
                            buttonName: 'Select Languague',
                            buttonColor: ColorConstant.buttonBlue,
                            buttonHeight: 45,
                            buttonWidth: 300.17),
                      ),
                      SizedBox(
                        height: getVerticalSize(16),
                      ),
                      //  Logout button
                      Obx(
                        () => InkWell(
                          onTap: () {
                            profileDataController.logOut().then((value) =>
                                (profileDataController.isLogoutSuccess.value ==
                                        true)
                                    ? Get.toNamed('/LoginScreen')
                                    : null);
                          },
                          child: ButtonContainer(
                              buttonTextStyle: Textstyles.buttonStyle,
                              borderRadius: 20,
                              isLoadingVariable:
                                  profileDataController.isLogoutLoading.value,
                              buttonName: 'Log Out',
                              buttonColor: ColorConstant.red800,
                              buttonHeight: 45,
                              buttonWidth: 300.17),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget bottomSheet(cameraFunction, galleryFunction) {
  var isDeleted = false;
  var imagecontroller = Get.put(ImageConfigration());
  return
     Obx(()=>
      Container(
        height: getVerticalSize(100),
        width: double.infinity,
        margin: getMargin(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: (imagecontroller.isDeleted.value == false) ?Column(
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
             imagecontroller.deleteButton(),
             ],
           ),
          Column(children: [
            Text(
              'Choose Profile photo',
              style: Textstyles.upcomingBookingTitleStyle,
            ),
            SizedBox(
              height: getVerticalSize(25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: cameraFunction,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                          color: ColorConstant.constantBlack,
                        ),
                        SizedBox(
                          width: getHorizontalSize(5),
                        ),
                        Text(
                          'Camera',
                          style: Textstyles.hintStyle,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: galleryFunction,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo,
                          color: ColorConstant.constantBlack,
                        ),
                        SizedBox(
                          width: getHorizontalSize(5),
                        ),
                        Text(
                          'Gallery',
                          style: Textstyles.hintStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],)
          ],
        ):

             AlertDialogues(buttonName2: 'Remove', buttonName1: 'Cancel', title: 'Remove profile photo?', firstButtonOnpressed:  () {

           Get.back();
            }, secondButtonOnpressed:      () {
              imagecontroller.deleteImage();
              imagecontroller.imageConfig();
              Get.offAllNamed('/EditProfleScreen');
              (imagecontroller.galleryImage.value == true || imagecontroller.cammeraImage.value == true)?

              Utils.oneTimeSnackBar("Deleted , Profile picture deleted",
                  bgColor: Colors.green, time: 3):  Utils.oneTimeSnackBar("Deleted failed , No image",
              bgColor: Colors.red, time: 3);
            },),
          ),



     );
}
