import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/utils/size_utils.dart';

class ForgotPasswordImageSection extends StatelessWidget {
  final String imagePath;
  final double arrowTopPadding;
  final double arrowLeftPadding;
  final double containerLeftPadding;
  final double containerRightPadding;
  final double gap;
  final double imageContainerHeight;
  final double imageContainerwidth;

  const ForgotPasswordImageSection({Key? key,required this.imagePath,required this.imageContainerHeight,required this.imageContainerwidth,required this.gap,required this.arrowLeftPadding,required this.arrowTopPadding,required this.containerLeftPadding,required this.containerRightPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //This section includes image and backward arrow in the forgotpassword screen.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: getPadding(
            top: arrowTopPadding,
            left: arrowLeftPadding,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: getHorizontalSize(20),
              height: getVerticalSize(17.73),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage('assets/img_backwardarrow.png'))),
            ),
          ),
        ),
        SizedBox(
          height: getVerticalSize(gap),
        ),
        Padding(
          padding: getPadding(
            left: containerLeftPadding,
            right: containerRightPadding,
          ),
          child: Container(
            width: getHorizontalSize(imageContainerwidth),
            height: getVerticalSize(imageContainerHeight),
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image:
                    AssetImage(imagePath))),
          ),
        ),
      ],
    );
  }
}
