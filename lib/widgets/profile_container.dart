import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class ProfileContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  const ProfileContainer(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: getHorizontalSize(17.5),
          height: getVerticalSize(17.5),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath))),
        ),
        SizedBox(
          width: 9.26,
        ),


             Text(
                title,
                style: Textstyles.hintStyle,
              ),



      ],
    );
  }
}


