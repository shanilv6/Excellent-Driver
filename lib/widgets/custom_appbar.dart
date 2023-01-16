import 'package:edriver/presentation/screens/profile_screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class CustomAppBar extends StatelessWidget {
  final double titleRightPadding;
  final double titleLeftPadding;
  final double titleTopPadding;
  final double titleBottomPadding;
  final double titleContainerHeight;
  final double titleContainerWidth;

  const CustomAppBar({Key? key,required this.titleBottomPadding,required this.titleContainerHeight,required this.titleContainerWidth,required this.titleLeftPadding,required this.titleRightPadding,required this.titleTopPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.buttonBlue,
      height: getVerticalSize(114),
      child: Padding(
        padding: getPadding(
          right:titleRightPadding,
          left: titleLeftPadding,
          top: titleTopPadding,
          bottom: titleBottomPadding,
        ),
        child: Container(
            height: getVerticalSize(titleContainerHeight),
            width: getHorizontalSize(titleContainerWidth),
            color: ColorConstant.transparent,
            child: Text('Excellent Driver Dubai',style: Textstyles.appbarTitleStyle,)),
      ),
    );
  }
}

class CustomAppbarWithicon extends StatefulWidget {
final double rowLeftPadding;
final double rowRightPadding;
final double arrowTopPadding;
final double arrowBottomPadding;
final double titleTopPadding;
final double titleBottomPadding;
final double gap;
final double titleContainerHeight;
final double titleContainerWidth;
final String titleName;
final arrowOnTap;


  const CustomAppbarWithicon({Key? key,required this.arrowBottomPadding,required this.arrowOnTap,required this.titleName,required this.arrowTopPadding, required this.titleContainerHeight, required this.titleContainerWidth,required this.gap, required this.rowLeftPadding, required this.rowRightPadding,required this.titleBottomPadding, required this.titleTopPadding }) : super(key: key);

  @override
  State<CustomAppbarWithicon> createState() => _CustomAppbarWithiconState();
}

class _CustomAppbarWithiconState extends State<CustomAppbarWithicon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.buttonBlue,
      height: getVerticalSize(114),
      child: Padding(
        padding: getPadding(
          left: widget.rowLeftPadding,
          right: widget.rowRightPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap:widget.arrowOnTap,
              child: Padding(
                padding: getPadding(
                  top: widget.arrowTopPadding,
                  bottom: widget.arrowBottomPadding,
                ),
                child: Container(
                  height: getVerticalSize(17.73),
                  width: getHorizontalSize(20),
                  decoration: BoxDecoration(
                      color: ColorConstant.transparent,
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/img_backwardarrow_white.png'))),
                ),
              ),
            ),
            // SizedBox(
            //   width: getHorizontalSize(gap),
            // ),
            Padding(
              padding: getPadding(
                // right:121,
left: widget.gap,
                top: widget.titleTopPadding,
                bottom: widget.titleBottomPadding,
              ),
              child: Container(

                  height: getVerticalSize(widget.titleContainerHeight),
                  width: getHorizontalSize(widget.titleContainerWidth),
                  color: ColorConstant.transparent,
                  child: Center(
                    child: Text(
                      widget.titleName,
                      style: Textstyles.appbarTitleStyle,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
