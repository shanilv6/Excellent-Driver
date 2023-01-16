import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/style.dart';
import '../../../widgets/button_container.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/signup_textfield.dart';
import '../profile_screen/controller/profile_controller.dart';
import '../profile_screen/profile_screen.dart';
import 'controller/edit_profile_controller.dart';
import 'package:image_cropper/image_cropper.dart';

import 'image_config/image_configration.dart';

String imagePath = '';
final picker = ImagePicker();


class EditProfleScreen extends StatefulWidget {
  EditProfleScreen({Key? key}) : super(key: key);

  @override
  State<EditProfleScreen> createState() => _EditProfleScreenState();
}

class _EditProfleScreenState extends State<EditProfleScreen> {
  bool value = false;

  bool visibility = false;

  bool obscureTextValue = true;

  final fullNameFormKey = GlobalKey<FormState>();

  final emailFormKey = GlobalKey<FormState>();

  final mobileNumberFormKey = GlobalKey<FormState>();

  final passwordFormKey = GlobalKey<FormState>();

  var editProfileController = Get.put(EditProfileController());
  var profileDataController = Get.put(ProfileController());

  var imageController = Get.put(ImageConfigration());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.homeScreenBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getVerticalSize(70)),
          child: CustomAppbarWithicon(
              arrowOnTap: () {
                Get.back();
              },
              titleName: 'Edit Profile',
              arrowBottomPadding: 20,
              arrowTopPadding: 52,
              titleContainerHeight: 24,
              titleContainerWidth: 140,
              gap: 56,
              rowLeftPadding: 24,
              rowRightPadding: 100,
              titleBottomPadding: 20,
              titleTopPadding: 50),
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
                        height: getVerticalSize(380),
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
                            left: 15,
                            top: 122,
                            right: 15,
                            bottom: 15,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Fullname textfield
                              SignupTextfield(
                                textfieldHeight: 50,
                                textfieldWidth: 297,
                                textFieldValidator: (value) {
                                  if (value == null || value.length < 1) {
                                    return 'Name is incomplete';
                                  }
                                  return null;
                                },
                                textFieldController: editProfileController
                                    .fullNameTextfieldController,
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
                                textFieldValidator: (value){
                                  if (value == null || value.isEmpty) {
                                    return "Enter the Email";
                                  } else if (!value.contains('@gmail') || !value.contains('.com')) {
                                    return 'Invaild Email';
                                  }
                                  return null;
                                },
                                textFieldController: editProfileController
                                    .emailTextfieldController,
                                textFieldKeyboardType:
                                    TextInputType.emailAddress,
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
                                  textFieldValidator:  (value) {
                              if (value == null || value.isEmpty) {
                              return "Enter the Mobile number";
                              } else if (value.length < 10) {
                              return 'Invalid Mobile number';
                              }
                              return null;
                              },
                                  textFieldController: editProfileController
                                      .mobileNumberTextfieldController,
                                  textFieldKeyboardType: TextInputType.phone,
                                  formKey: mobileNumberFormKey,
                                  obscureTextValues: false,
                                  hintText: 'Mobile Number',
                                  prefixicons: ImageIcon(
                                    AssetImage(ImageConstant.phoneIcon),
                                    color: ColorConstant.buttonBlue,
                                  )),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),

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
                                textFieldController: editProfileController
                                    .passwordTextfieldController,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: getPadding(left: 96.5, right: 96.5, top: 28),
                        child: GestureDetector(
                          onTap: () {
                            imageController.isDeleted.value = false;
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet(
                                      () async {
                                        final pickedFile =
                                            await picker.pickImage(
                                                source: ImageSource.camera);
                                        if (pickedFile != null) {
                                          CroppedFile? croppedFile =
                                              await ImageCropper().cropImage(
                                            sourcePath: pickedFile.path,
                                            aspectRatioPresets: [
                                              CropAspectRatioPreset.square,
                                              CropAspectRatioPreset.ratio3x2,
                                              CropAspectRatioPreset.original,
                                              CropAspectRatioPreset.ratio4x3,
                                              CropAspectRatioPreset.ratio16x9
                                            ],
                                            uiSettings: [
                                              AndroidUiSettings(
                                                  toolbarTitle: 'Cropper',
                                                  toolbarColor:
                                                      Colors.deepOrange,
                                                  toolbarWidgetColor:
                                                      Colors.white,
                                                  initAspectRatio:
                                                      CropAspectRatioPreset
                                                          .original,
                                                  lockAspectRatio: false),
                                              IOSUiSettings(
                                                title: 'Cropper',
                                              ),
                                              WebUiSettings(
                                                context: context,
                                              ),
                                            ],
                                          );

                                          if (croppedFile != null) {
                                            setState(() {
                                              imageController
                                                  .setImage(croppedFile.path);

                                            Get.back();

                                            });
                                          }
                                        }
                                      },
                                      () async {
                                        final pickedFile =
                                            await picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (pickedFile != null) {
                                          CroppedFile? croppedFile =
                                              await ImageCropper().cropImage(
                                            sourcePath: pickedFile.path,
                                            aspectRatioPresets: [
                                              CropAspectRatioPreset.square,
                                              CropAspectRatioPreset.ratio3x2,
                                              CropAspectRatioPreset.original,
                                              CropAspectRatioPreset.ratio4x3,
                                              CropAspectRatioPreset.ratio16x9
                                            ],
                                            uiSettings: [
                                              AndroidUiSettings(
                                                  toolbarTitle: 'Cropper',
                                                  toolbarColor:
                                                      Colors.deepOrange,
                                                  toolbarWidgetColor:
                                                      Colors.white,
                                                  initAspectRatio:
                                                      CropAspectRatioPreset
                                                          .original,
                                                  lockAspectRatio: false),
                                              IOSUiSettings(
                                                title: 'Cropper',
                                              ),
                                              WebUiSettings(
                                                context: context,
                                              ),
                                            ],
                                          );
                                          if (croppedFile != null) {
                                            setState(() {
                                              imageController.setGalleryImage(
                                                  croppedFile.path);
                                              Get.back();
                                            });
                                          }
                                        }
                                      },
                                    )));

                          },
                          child: Obx(
                            () => Container(
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
                              child: (imageController.isloading.value == true)
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: ColorConstant.buttonBlue,
                                      ),
                                    )
                                  : (imageController.cammeraImage == true)
                                      ? Padding(
                                          padding: getPadding(

                                          ),
                                          child: ClipOval(
                                            child: Image.file(
                                              File(imageValue!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : (imageController.galleryImage.value == true)
                                          ? Padding(
                                              padding: getPadding(

                                              ),
                                              child: ClipOval(
                                                child: Image.file(
                                                  File(imageValue!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          :(imageController.isDeleted == true) ?ClipOval(
                                              child: Image.asset(
                                                ImageConstant.mainProfileIcon,
                                              ),
                                            ):ClipOval(
                                child: Image.asset(
                                  ImageConstant.mainProfileIcon,
                                ),
                            ),
                          ),
                        )),
                    )],
                ),
                Padding(
                  padding: getPadding(
                    left: 37,
                    right: 37,
                    top: 24,
                  ),
                  child: Obx(
                    () => InkWell(
                        onTap: () {
                          if (fullNameFormKey.currentState!.validate()) {
                            if (emailFormKey.currentState!.validate()) {
                              if (mobileNumberFormKey.currentState!
                                  .validate()) {
                                if (passwordFormKey.currentState!.validate()) {
                                  editProfileController
                                      .profileUpdate(
                                          editProfileController
                                              .fullNameTextfieldController.text,
                                          editProfileController
                                              .emailTextfieldController.text,
                                          editProfileController
                                              .mobileNumberTextfieldController
                                              .text,
                                          editProfileController
                                              .passwordTextfieldController.text)
                                      .then((value) => (editProfileController
                                                  .isProfileUpdateSuccess
                                                  .value ==
                                              true)
                                          ? Get.back()
                                          : null)
                                      .then((value) => (editProfileController
                                                  .isProfileUpdateSuccess
                                                  .value ==
                                              true)
                                          ? profileDataController
                                              .profileDataFetching()
                                          : null);
                                }
                              }
                            }
                          }
                        },
                        child: ButtonContainer(
                            borderRadius: 20,
                            buttonTextStyle: Textstyles.buttonStyle,
                            isLoadingVariable:
                                editProfileController.isLoading.value,
                            buttonName: 'Update',
                            buttonColor: ColorConstant.buttonBlue,
                            buttonHeight: 45,
                            buttonWidth: 300.17)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
