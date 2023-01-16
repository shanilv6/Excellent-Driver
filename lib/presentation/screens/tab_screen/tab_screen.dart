import 'package:edriver/presentation/screens/upcoming_tab_screen/upcoming_tab_screen.dart';
import 'package:edriver/widgets/booking_status_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/style.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/history_tab_container.dart';
import '../../../widgets/upcoming_tab_container.dart';
import '../history_tab_screen/controller/booking_history_controller.dart';
import '../history_tab_screen/history_tab_screen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedindex = 0;
  var bookingsHistoryController = Get.put(BookingHistoryController());


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ColorConstant.homeScreenBackground,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(getVerticalSize(82)),
            child: Container(
                color: ColorConstant.transparent,
                child: TabBar(

                    unselectedLabelStyle: Textstyles.unSelectedLabelStyle,
                    unselectedLabelColor: ColorConstant.buttonBlue,
                    onTap: (value) {
                      setState(() {
                        _selectedindex = value;
                        bookingsHistoryController.bookingHistory();

                      });
                    },
                    padding: getPadding(
                      top: 24,
                      left: 24,
                      bottom: 16,
                      right: 24,
                    ),
                    indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadiusStyles.roundedBorder20,
                        color: (_selectedindex == 0)
                            ? ColorConstant.buttonBlue
                            : (_selectedindex == 1)
                                ? ColorConstant.buttonBlue
                                : ColorConstant.transparent,
                        border: Border.all(
                            color: (_selectedindex == 0)
                                ? ColorConstant.buttonBlue
                                : (_selectedindex == 1)
                                    ? ColorConstant.buttonBlue
                                    : ColorConstant.buttonBlue,
                            width: 1.5)),
                    labelStyle: Textstyles.buttonStyle,
                    tabs: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyles.roundedBorder20,
                            color: ColorConstant.transparent,
                            border: Border.all(
                                width: 2,
                                color: (_selectedindex == 1)
                                    ? ColorConstant.buttonBlue
                                    : ColorConstant.transparent)),
                        child: const Tab(
                          text: 'Upcoming',
                        ),
                      ),
                      //  ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyles.roundedBorder20,
                            color: ColorConstant.transparent,
                            border: Border.all(
                                width: 2,
                                color: (_selectedindex == 0)
                                    ? ColorConstant.buttonBlue
                                    : ColorConstant.transparent)),
                        child: const Tab(
                          text: 'History',
                        ),
                      )
                    ]))),
        body:  TabBarView(children: [
UpComingTabScreen(),
          HistoryTabScreen()
          ]),
      ),
    );
  }
}
