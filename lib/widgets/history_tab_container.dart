import 'package:edriver/widgets/upcoming_tab_container.dart';
import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';
import 'booking_status_button.dart';

class HistoryTabContainer extends StatelessWidget {
  final String name;
  final String dateAndTime;
  final String pickingPoint;
  final String droppingPoint;
  final String pickingTime;
  final String status;
  const HistoryTabContainer({Key? key,required this.pickingTime,required this.status,required this.droppingPoint,required this.pickingPoint,required this.dateAndTime, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                  height: getVerticalSize(248),
                  decoration: BoxDecoration(
                      color: ColorConstant.constantWhite,
                      borderRadius: BorderRadiusStyles.roundedBorder8,
                      boxShadow: [
                        BoxShadow(
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
                          left: 25,
                          right: 24,
                          top: 24,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Textstyles.upcomingBookingTitleStyle,
                            ),
                            SizedBox(
                              height: getVerticalSize(5),
                            ),
                            Text(
                              'Booking On : ${dateAndTime}',
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
                                  pickingPoint,
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
                                  droppingPoint,
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
                                  pickingTime,
                                  style: Textstyles.upcomingBookingSubTitle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Button

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        (status == "Completed") ?
        BookingStatusButton(borderColor: ColorConstant.buttonBlue, title: 'Completed', textStyle: Textstyles.bookingCompletedTextStyle) :

        (status == "Cancelled") ?
        BookingStatusButton(borderColor: ColorConstant.red800, title: 'Cancelled', textStyle: Textstyles.bookingCancelledTextStyle):
        BookingStatusButton(borderColor: ColorConstant.buttonBlue, title: 'In Review', textStyle: Textstyles.bookingCompletedTextStyle) ,

      ],
    );
  }
}
