import 'dart:async';

import 'package:edriver/core/app_export.dart';
import 'package:edriver/presentation/screens/upcoming_tab_screen/model/upcoming_booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../presentation/screens/upcoming_tab_screen/controller/upcoming_booking_controller.dart';
import '../presentation/screens/upcoming_tab_screen/model/upcoming_booking_model.dart';
import 'button_container.dart';
import 'package:intl/intl.dart';

var bookingsid;

class UpcomingTabContainer extends StatefulWidget {
  final String dateAndTime;
  final String pickingPoint;
  final String droppingPoint;
  final String pickingTime;
  final int id;

  const UpcomingTabContainer(
      {Key? key,
      required this.dateAndTime,
      required this.droppingPoint,
      required this.pickingPoint,
      required this.id,
      required this.pickingTime})
      : super(key: key);

  @override
  State<UpcomingTabContainer> createState() => _UpcomingTabContainerState();
}

class _UpcomingTabContainerState extends State<UpcomingTabContainer> {
  var upComingBookingController = Get.put(UpcomingBookingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              left: 24,
              right: 24,
              bottom: 16,
              top: 4,
            ),
            child: Container(
              width: getHorizontalSize(327),
              height: getVerticalSize(309),
              decoration: BoxDecoration(
                  color: ColorConstant.constantWhite,
                  borderRadius: BorderRadiusStyles.roundedBorder8,
                  boxShadow: [
                    const BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: Colors.grey,
                        blurRadius: 4)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 19,
                      right: 30,
                      top: 17,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Name',
                          style: Textstyles.upcomingBookingTitleStyle,
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        Text(
                          // dateAndTime,
                          'Booking On : ${widget.dateAndTime}',
                          style: Textstyles.upcomingBookingDateStyle,
                        ),
                        SizedBox(
                          height: getVerticalSize(33),
                        ),
                        //Pickup Point
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Picking Point',
                              style: Textstyles.upcomingBookingElementStyle,
                            ),
                            Text(
                              widget.pickingPoint,
                              style: Textstyles.upcomingBookingSubTitle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(36),
                        ),
                        // Dropping Point
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dropping Point',
                              style: Textstyles.upcomingBookingElementStyle,
                            ),
                            Text(
                              widget.droppingPoint,
                              style: Textstyles.upcomingBookingSubTitle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(33),
                        ),
                        //Pickup Time
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Picking Time',
                              style: Textstyles.upcomingBookingElementStyle,
                            ),
                            Text(
                              widget.pickingTime,
                              style: Textstyles.upcomingBookingSubTitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Button

                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CancelPopup(context),
                      );
                      setState(() {
                        bookingsid = widget.id.toString();
                        upComingBookingController.isCancelBookingSuccess.value =
                            false;
                      });
                    },
                    child: Padding(
                      padding:
                          getPadding(top: 24, left: 14, right: 13, bottom: 23),
                      child: ButtonContainer(
                          buttonTextStyle: Textstyles.buttonStyle,
                          borderRadius: 20,
                          buttonName: 'Cancel Booking',
                          buttonColor: ColorConstant.red800,
                          buttonHeight: 45,
                          buttonWidth: 300.17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget CancelPopup(BuildContext context) {
  var upComingBookingController = Get.put(UpcomingBookingController());

  return AlertDialog(
    insetPadding: const EdgeInsets.only(
      left: 24,
      right: 24,
    ),
    contentPadding: EdgeInsets.zero,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    content: Builder(
      builder: (context) {
        return Obx(
          () => Container(
              height: getVerticalSize(270),
              width: getHorizontalSize(327),
              decoration: BoxDecoration(
                color: ColorConstant.constantWhite,
                borderRadius: BorderRadiusStyles.roundedBorder8,
              ),
              child: (upComingBookingController.isCancelBookingSuccess.value ==
                      false)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 92,
                            right: 92,
                            top: 20,
                          ),
                          child: Container(
                            width: getHorizontalSize(128),
                            height: getVerticalSize(128),
                            decoration: BoxDecoration(
                                color: ColorConstant.transparent,
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/img_cancelpopup_tickmark.png'))),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 15,
                            left: 30,
                            right: 18,
                          ),
                          child: Text(
                            'Do you want to cancel this booking ?',
                            style: Textstyles.PopupTitleTextStyle,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 25,
                            bottom: 12,
                            right: 16,
                            left: 125,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: getHorizontalSize(43),
                                  height: getVerticalSize(33),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.constantWhite,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1,
                                          color: ColorConstant.buttonBlue)),
                                  child: Center(
                                    child: Text(
                                      'NO',
                                      style: Textstyles.PopupTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: getHorizontalSize(10),
                              ),
                              Obx(
                                () => InkWell(
                                  onTap: () {
                                    upComingBookingController
                                        .cancelBookings(bookingsid)
                                        .then((value) =>
                                            (upComingBookingController
                                                        .isCancelBookingLoading
                                                        .value ==
                                                    false)
                                                ? Timer(Duration(seconds: 1),
                                                    () {
                                                    return Get.back();
                                                  })
                                                : null)
                                        .then((value) =>
                                            upComingBookingController
                                                .upcomingBooking());
                                  },
                                  child: ButtonContainer(
                                      isLoadingVariableForPopup:
                                          upComingBookingController
                                              .isCancelBookingLoading.value,
                                      buttonName: 'Yes, Sure',
                                      borderRadius: 5,
                                      buttonTextStyle: Textstyles.buttonStyle,
                                      buttonColor: ColorConstant.buttonBlue,
                                      buttonHeight: 33,
                                      buttonWidth: 101),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(
                      height: getVerticalSize(265),
                      width: getHorizontalSize(327),
                      decoration: BoxDecoration(
                        color: ColorConstant.constantWhite,
                        borderRadius: BorderRadiusStyles.roundedBorder8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 92,
                              right: 92,
                              top: 20,
                            ),
                            child: Container(
                              width: getHorizontalSize(128),
                              height: getVerticalSize(128),
                              decoration: BoxDecoration(
                                  color: ColorConstant.transparent,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/img_cancelpopup_tickmark.png'))),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 5,
                            ),
                            child: Text(
                              'Cancelled',
                              style: Textstyles.PopupTitleTextStyle,
                            ),
                          ),
                        ],
                      ),
                    )),
        );
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusStyles.roundedBorder8,
    ),
  );
}
