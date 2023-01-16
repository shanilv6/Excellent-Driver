import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';
import '../presentation/screens/edit_profile_screen/image_config/image_configration.dart';

class AlertDialogues extends StatelessWidget {
  final String title;
  final String buttonName1;
  final String buttonName2;
  final firstButtonOnpressed;

  final secondButtonOnpressed;



  const AlertDialogues({Key? key,required this.buttonName2,required this.buttonName1,required this.title,required this.firstButtonOnpressed,required this.secondButtonOnpressed}) : super(key: key);

  get imagecontroller => null;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(100),
      width: double.infinity,
      margin: getMargin(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Text(
           title,
            style: Textstyles.upcomingBookingTitleStyle,
          ),
          SizedBox(
            height: getVerticalSize(25),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: firstButtonOnpressed,

                child: Text(
                 buttonName1,
                  style: Textstyles.profilePicDeleteStyle,
                ),
              ),

                InkWell(
                  onTap: secondButtonOnpressed,

                  child: Text(
                   buttonName2,
                    style: Textstyles.profilePicDeleteStyle,
                  ),
                ),

            ],
          )
        ],
      ),
    );
  }
}
