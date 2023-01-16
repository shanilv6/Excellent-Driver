import 'package:edriver/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../core/utils/size_utils.dart';

class CountryContainer extends StatefulWidget {
  final countryName;
  final countryImage;
  final selectionColor;


  const CountryContainer({Key? key,required this.countryImage,required this.countryName,required this.selectionColor}) : super(key: key);

  @override
  State<CountryContainer> createState() => _CountryContainerState();
}

class _CountryContainerState extends State<CountryContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Container(
                height: getVerticalSize(150),
                width: getHorizontalSize(150),
                decoration: BoxDecoration(color: ColorConstant.transparent,image: DecorationImage(image: AssetImage(widget.countryImage),)),
                child: Container(
                  height: getVerticalSize(150),
                  width: getHorizontalSize(150),
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.transparent,border: Border.all(color:  widget.selectionColor,width: 5)),
                )
              ),

            SizedBox(height: getVerticalSize(12),),

            Padding(
              padding: getPadding(
            right: 5,
            ),
              child: Row(
                children: [
                 Container(
                   height: getVerticalSize(22),
                   width: getHorizontalSize(22),
                   decoration: BoxDecoration(color:widget.selectionColor,shape: BoxShape.circle),
                   child: Center(
                     child: Icon(Icons.done,color: ColorConstant.constantWhite,
                       size: getFontSize(16),
                 ),
                   ),
                 ),
                  SizedBox(width: getHorizontalSize(6),),
                  Text(widget.countryName,style:Textstyles.countryNameStyle),
                ],
              ),
            )
          ],
        );


  }
}
