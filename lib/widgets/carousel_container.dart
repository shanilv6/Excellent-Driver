import 'package:flutter/cupertino.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class CarouselContainer extends StatelessWidget {
  final String imagePath;
  final String imageText;
  const CarouselContainer(
      {Key? key, required this.imagePath, required this.imageText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        bottom: 13,
      ),
      child: Container(
        width: double.infinity,
        //228
        height: getVerticalSize(228),
        decoration: BoxDecoration(
            color: ColorConstant.transparent,
            image:
                DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
        child: Padding(
          padding: getPadding(
            left: 24,
            top: 163,

          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorConstant.constantWhite,
                child: Text(
                  imageText,
                  style: Textstyles.carouselImageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
