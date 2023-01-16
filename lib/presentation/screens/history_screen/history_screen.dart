import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/custom_appbar.dart';
import '../tab_screen/tab_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstant.homeScreenBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getVerticalSize(63)),
        child:  CustomAppbarWithicon(
          arrowOnTap: (){
            Get.offAllNamed('/BottomNavigationBar');
          },
            titleName: 'Bookings',
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
      body: TabScreen(),
    );
  }
}
