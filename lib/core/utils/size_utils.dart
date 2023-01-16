import 'package:edriver/main.dart';
import 'package:flutter/material.dart';



Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;
const num DESIGN_WIDTH = 375;
const num DESIGN_HEIGHT = 812;
const num DESIGN_STATUS_BAR = 44;
BuildContext context= navigatorKey.currentState!.context;

///This method is used to get device viewport width.
get width {
  return size.width;
}

///This method is used to get device viewport height.
get height {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return screenHeight;
}

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px,) {
  return DynamicSize(context).pxl1_Width*px;
  // return (px * width) / DESIGN_WIDTH;
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  return DynamicSize(context).pxl1_height*px;


  return (px * height) / (DESIGN_HEIGHT - DESIGN_STATUS_BAR);
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  return getSize(px);
}

///This method is used to set padding responsively
EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}


class DynamicSize{
  late BuildContext context;
  double screenHeight=0;
  double screenWidth=0;
  double height10=0;
  double width10=0;
  double width1=0;
  double blockSizeVertical=0;
  double blockSizeHorizontal=0;
  double uiWidth=375;
  double uiHeight=812;
  double textScaleFactor=0;
  double ratioWidth1=0;
  double ratioHeight1=0;
  double pxl1_Width=0;
  double pxl1_height=0;
  DynamicSize(this.context){

    this. screenHeight=MediaQuery.of(context).size.height<600?600:MediaQuery.of(context).size.height;
    this. screenWidth=MediaQuery.of(context).size.width;
    this. height10=screenHeight/(812/10);//use this only
    this. width10=screenWidth/(375/10);//use this only
    this. width1=screenWidth/(375/1);
    // print("width: $screenWidth");
    // print("height: $screenHeight");
    this.blockSizeVertical = MediaQuery.of(context).size.height / 100;
    this.blockSizeHorizontal = MediaQuery.of(context).size.width / 100;
    this.textScaleFactor = screenWidth / uiWidth;
    // print("blockSizeHorizontal : $blockSizeHorizontal");
    this.ratioWidth1=(1/uiWidth)*screenWidth;
    this.ratioHeight1=(1/uiHeight)*screenWidth;
    this.pxl1_Width=(1.1/uiWidth)*screenWidth;
    this.pxl1_height=(1.1/(uiHeight))*screenHeight;
    // print("ratioWidth10: $ratioWidth1");
    // print("ratioHeight10: $ratioHeight1");
  }
}
