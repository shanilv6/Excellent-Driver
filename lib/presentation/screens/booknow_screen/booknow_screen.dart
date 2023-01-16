import 'dart:async';

import 'package:edriver/widgets/custom_appbar.dart';
import 'package:edriver/widgets/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/style.dart';
import '../../../widgets/bookings_button.dart';
import 'package:intl/intl.dart';

import 'controller/booking_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class BookNowScreen extends StatefulWidget {
  BookNowScreen({Key? key}) : super(key: key);

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  DateTime selectedDate = DateTime.now();
  var bookinController = Get.put(BookingController());

  Future<void> DateSelection(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final nameFormkey = GlobalKey<FormState>();
  final mobileNumberFormKey = GlobalKey<FormState>();
  final pickingTimeFormKey = GlobalKey<FormState>();
  final pickUpPointFormkey = GlobalKey<FormState>();
  final pickOutPointFormkey = GlobalKey<FormState>();
  final dateFormKey = GlobalKey<FormState>();
  bool isAnimating = true;
  final Uri phoneNumber = Uri.parse('tel:8870351602');
  final Uri whatsApp = Uri.parse('https://wa.me/8870351602');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getVerticalSize(63)),
        child: CustomAppbarWithicon(
            arrowOnTap: (){
              Get.toNamed('/BottomNavigationBar');
            },
          titleName: 'Book Your Ride Here',
            arrowBottomPadding: 20,
            arrowTopPadding: 64,
            titleContainerHeight: 24,
            titleContainerWidth: 160,
            gap: 12,
            rowLeftPadding: 24,
            rowRightPadding: 110,
            titleBottomPadding: 20,
            titleTopPadding: 60),
      ),
      body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: getPadding(
              left: 39,
              right: 42,
              top: 24,
            ),
            child: Column(
              children: [
                //Name
                SignupTextfield(
                  hintText: 'Name',
                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  obscureTextValues: false,
                  bottompadding: 10,
                  textFieldValidator: (value) {
                    if (value == null || value.length < 1) {
                      return 'Name incomplete';
                    }
                    return null;
                  },
                  textFieldController: bookinController.nameController,
                  textFieldKeyboardType: TextInputType.text,
                  formKey: nameFormkey,
                ),

                //Mobile number
                SignupTextfield(
                  hintText: 'Mobile Number',
                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  obscureTextValues: false,
                  bottompadding: 10,
                  textFieldValidator: (value) {
                    if (value == null || value.length < 10) {
                      return 'Mobile number incomplete';
                    }
                    return null;
                  },
                  textFieldController: bookinController.mobileNumberController,
                  textFieldKeyboardType: TextInputType.number,
                  formKey: mobileNumberFormKey,
                ),

                //Date
                SignupTextfield(
                  textFieldValidator: (value) {
                    if (value == null || value.length > 1) {
                      return 'Use date picker';
                    }
                    return null;
                  },
                  formKey: dateFormKey,
                  hintText: DateFormat('dd-MM-yyyy').format(selectedDate),
                  textfieldHeight: 50,
                  textFieldController: bookinController.dateController,
                  textFieldKeyboardType: TextInputType.text,
                  textfieldWidth: 297,
                  obscureTextValues: false,
                  bottompadding: 10,
                  suffixIcons: GestureDetector(
                      onTap: () {
                        DateSelection(context);
                        setState(() {
                          bookinController.dateController.clear();
                        });
                      },
                      child: ImageIcon(
                        const AssetImage(
                          'assets/img_calender.png',
                        ),
                        color: ColorConstant.grey400,
                      )),
                ),

                //Picking time
                SignupTextfield(
                  hintText: 'Picking Time',
                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  obscureTextValues: false,
                  bottompadding: 10,
                  textFieldValidator: (value) {
                    if (value == null || value.length < 5 || value.length > 5) {
                      return 'Picking time incorrect(HH:MM)';
                    }
                    return null;
                  },
                  textFieldController: bookinController.pickingTimeController,
                  textFieldKeyboardType: TextInputType.text,
                  formKey: pickingTimeFormKey,
                ),

                //Pickup point
                SignupTextfield(
                  hintText: 'Pickup Point',
                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  obscureTextValues: false,
                  bottompadding: 10,
                  textFieldValidator: (value) {
                    if (value == null || value.length < 1) {
                      return 'Pickup point incomplete';
                    }
                    return null;
                  },
                  textFieldController: bookinController.pickUpPointController,
                  textFieldKeyboardType: TextInputType.text,
                  formKey: pickUpPointFormkey,
                ),

                //Pickout point
                SignupTextfield(
                  hintText: 'Pickout Point',
                  textfieldHeight: 50,
                  textfieldWidth: 297,
                  obscureTextValues: false,
                  bottompadding: 10,
                  textFieldValidator: (value) {
                    if (value == null || value.length < 1) {
                      return 'Pickout point incomplete';
                    }
                    return null;
                  },
                  textFieldController: bookinController.pickOutPointController,
                  textFieldKeyboardType: TextInputType.text,
                  formKey: pickOutPointFormkey,
                ),

                Obx(()=>
                 GestureDetector(
                    onTap: () {
                      if (nameFormkey.currentState!.validate()) {
                        if (mobileNumberFormKey.currentState!.validate()) {
                          if (dateFormKey.currentState!.validate()) {
                            if (pickingTimeFormKey.currentState!.validate()) {
                              if (pickUpPointFormkey.currentState!.validate()) {
                                if (pickOutPointFormkey.currentState!
                                    .validate()) {
                                  bookinController
                                      .bookingRide(
                                          name: bookinController
                                              .nameController.text,
                                          mobile: bookinController
                                              .mobileNumberController.text,
                                          date: DateFormat('yyyy-MM-dd')
                                              .format(selectedDate),
                                          pickingTime: bookinController
                                              .pickingTimeController.text,
                                          pickupPoint: bookinController
                                              .pickUpPointController.text,
                                          pickOutpoint: bookinController
                                              .pickOutPointController.text)
                                      .then((value) {
                                    (bookinController.isBookingSuccess.value ==
                                            true)
                                        ? Get.toNamed(
                                            '/BookingConformationScreen')
                                        : Get.toNamed('/BookingErrorScreen');
                                  });
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child:
                      BookingsButton(
                          isLoadingVariable: bookinController.isBookingLoading.value,
                          buttonHeight: 45,
                          buttonWidth: 297,
                          topPadding: 14,
                          borderColor: ColorConstant.buttonBlue,
                          buttonColor: ColorConstant.buttonBlue,
                          buttonText: 'Confirm Booking',
                          iconPath: ImageConstant.bookingCalenderIcon,
                          textStyles: Textstyles.bookNowButtonStyle),
                    ),
                ),

                SizedBox(
                  height: getVerticalSize(24),
                ),
                Text(
                  'Or',
                  style: Textstyles.orConditionStyle,
                ),

                InkWell(
                  onTap: (){
                    launchUrl(phoneNumber);

                  },
                  child: BookingsButton(
                      buttonHeight: 45,
                      buttonWidth: 297,
                      topPadding: 24,
                      borderColor: ColorConstant.buttonBlue,
                      buttonColor: ColorConstant.constantWhite,
                      buttonText: 'Call Us',
                      iconPath: ImageConstant.bookingCallIcon,
                      textStyles: Textstyles.callUsButtonStyle),
                ),

                InkWell(
                  onTap: (){
                    launchUrl(whatsApp);

                  },
                  child: BookingsButton(
                      buttonHeight: 45,
                      buttonWidth: 297,
                      topPadding: 12,
                      borderColor: ColorConstant.buttonBlue,
                      buttonColor: ColorConstant.constantWhite,
                      buttonText: 'Whatsapp',
                      iconPath: ImageConstant.bookingWhatsappIcon,
                      textStyles: Textstyles.whatsappButtonStyle),
                ),
              ],
            ),
          ),
        )),

    );
  }
}
