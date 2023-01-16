
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:edriver/core/app_export.dart';
import 'package:edriver/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:edriver/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../edit_profile_screen/image_config/image_configration.dart';
import '../history_screen/history_screen.dart';
import '../history_tab_screen/controller/booking_history_controller.dart';
import '../profile_screen/controller/profile_controller.dart';
import '../profile_screen/profile_screen.dart';
import '../upcoming_tab_screen/controller/upcoming_booking_controller.dart';

class BottomNavigationBar extends StatefulWidget {
   BottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
   int _page = 0;

   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

final List pages =[
  HomeScreen(),
  HistoryScreen(),
  ProfileScreen(),
];

   var upComingBookingController = Get.put(UpcomingBookingController());
   var bookingsHistoryController = Get.put(BookingHistoryController());
   var profileDataController = Get.put(ProfileController());

   var imageController = Get.put(ImageConfigration());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.fastLinearToSlowEaseIn,
        buttonBackgroundColor: ColorConstant.constantWhite,
        backgroundColor: Color(0xffddeaf0),
        key: _bottomNavigationKey,
        items:[
          CurvedNavigationBarItem(
            child: ImageIcon(AssetImage(ImageConstant.homeIconBottom),color: (_page == 0)? ColorConstant.buttonBlue : ColorConstant.unSelectedIconColorBottom,),
            label: 'Home',
            labelStyle:(_page == 0) ? Textstyles.selectedLabelStyleBottom : Textstyles.unSelectedLabelStyleBottom,
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(AssetImage(ImageConstant.historyIconBottom),color: (_page == 1)? ColorConstant.buttonBlue : ColorConstant.unSelectedIconColorBottom,),
            label: 'History',
            labelStyle: (_page == 1) ? Textstyles.selectedLabelStyleBottom : Textstyles.unSelectedLabelStyleBottom,
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(AssetImage(ImageConstant.profileIconBottom),color: (_page == 2)? ColorConstant.buttonBlue : ColorConstant.unSelectedIconColorBottom,),
            label: 'Profile',
            labelStyle: (_page == 2) ? Textstyles.selectedLabelStyleBottom : Textstyles.unSelectedLabelStyleBottom,

          ),

        ],
        onTap: (index) {
          setState(() {
            _page = index;
        if(_page == 1){
          upComingBookingController.upcomingBooking();
          bookingsHistoryController.bookingHistory();

        }else     if(_page == 2){
       profileDataController.profileDataFetching();
       imageController.imageConfig();

        }

          });
        },
      ),
      body:pages[_page],


    );
  }
}
