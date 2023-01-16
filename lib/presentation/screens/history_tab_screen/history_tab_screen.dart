import 'package:edriver/core/utils/color_constant.dart';
import 'package:edriver/core/utils/size_utils.dart';
import 'package:edriver/widgets/history_tab_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/style.dart';
import 'controller/booking_history_controller.dart';

class HistoryTabScreen extends StatelessWidget {
  HistoryTabScreen({Key? key}) : super(key: key);
  var bookingsHistoryController = Get.put(BookingHistoryController());

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: getPadding(bottom: 30),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorConstant.transparent,
          child: Obx(()=> (bookingsHistoryController.isLoading.value == true)?Center (child: CircularProgressIndicator(strokeWidth: 2,color: ColorConstant.buttonBlue,),):(bookingsHistoryController.isLoading.value == true)? Center(child: CircularProgressIndicator(strokeWidth: 2,color: ColorConstant.buttonBlue,),):(bookingsHistoryController.bookingHistoryList.length == 0 || bookingsHistoryController.isBookingsuccess.value == false)
              ? Center(
            child: Text(
              'Nothing to show here',
              style: Textstyles.nothingToShowTextStyle,
            ),
          )
              :
          SingleChildScrollView(
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      bookingsHistoryController.bookingHistoryList.length,
                      (index) => HistoryTabContainer(
                          pickingTime: bookingsHistoryController
                              .bookingHistoryList[index].pickupTime,
                          status: bookingsHistoryController.bookingHistoryList[index].status,
                          droppingPoint: bookingsHistoryController
                              .bookingHistoryList[index].dropLocation,
                          pickingPoint: bookingsHistoryController
                              .bookingHistoryList[index].pickupLocation,
                          dateAndTime: bookingsHistoryController
                              .bookingHistoryList[index].pickupDate)),
                ),
              ),
          ),
          ),

      );

  }
}
