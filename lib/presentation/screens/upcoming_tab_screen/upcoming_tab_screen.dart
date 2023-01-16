import 'package:edriver/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/upcoming_tab_container.dart';
import 'controller/upcoming_booking_controller.dart';

class UpComingTabScreen extends StatelessWidget {
  UpComingTabScreen({Key? key}) : super(key: key);
  var upComingBookingController = Get.put(UpcomingBookingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 30),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstant.transparent,
        child: Obx(
          () =>(upComingBookingController.isLoading.value == true)?Center (child: CircularProgressIndicator(strokeWidth: 2,color: ColorConstant.buttonBlue,),):(upComingBookingController.upcomingBookingList.length == 0 || upComingBookingController.isLoadingSuccess.value == false)
              ? Center(
                  child: Text(
                    'Nothing to show here',
                    style: Textstyles.nothingToShowTextStyle,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      upComingBookingController.upcomingBookingList.length,
                      (index) => UpcomingTabContainer(
                        id: upComingBookingController.upcomingBookingList[index].id,
                          dateAndTime:
                              '${upComingBookingController.upcomingBookingList[index].pickupDate}',
                          droppingPoint:
                              '${upComingBookingController.upcomingBookingList[index].dropLocation}',
                          pickingPoint:
                              '${upComingBookingController.upcomingBookingList[index].pickupLocation}',
                          pickingTime:
                              '${upComingBookingController.upcomingBookingList[index].pickupTime}'),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
