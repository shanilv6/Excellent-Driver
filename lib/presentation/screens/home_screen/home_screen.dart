import 'dart:async';

import 'package:edriver/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/color_constant.dart';
import '../../../widgets/bookings_button.dart';
import '../../../widgets/carousel_container.dart';
import '../../../widgets/custom_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../booknow_screen/controller/booking_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  final Uri phoneNumber = Uri.parse('tel:8870351602');
  final Uri whatsApp = Uri.parse('https://wa.me/8870351602');


  final _pageController = PageController();
  var bookinController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.homeScreenBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getVerticalSize(63)),
          child: const CustomAppBar(
              titleBottomPadding: 20,
              titleContainerHeight: 24,
              titleContainerWidth: 175,
              titleLeftPadding: 95,
              titleRightPadding: 86,
              titleTopPadding: 65),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            //Carousel container
            CarouselSlider(
              items: List.generate(
                  ImageConstant.carouselSliderImageList.length,
                  (index) => CarouselContainer(
                      imagePath: ImageConstant.carouselSliderImageList[index],
                      imageText: carouselSliderImageTitleList[index])),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentindex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                initialPage: _currentindex,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.99,
                autoPlayInterval: const Duration(seconds: 3),
              ),
            ),
            // SizedBox(
            //   height: getVerticalSize(3),
            // ),
            AnimatedSmoothIndicator(
              count: carouselSliderImageTitleList.length,
              effect: ExpandingDotsEffect(
                spacing: getHorizontalSize(6),
                dotHeight: getVerticalSize(7),
                dotWidth: getHorizontalSize(7),
                activeDotColor: ColorConstant.buttonBlue,
              ),
              activeIndex: _currentindex,
            ),
            // SizedBox(
            //   height: getVerticalSize(18),
            // ),
            Padding(
                padding: getPadding(
                  right: 24,
                  left: 24,
                  top: 18,
                  bottom: 20,
                ),
                child: Container(
                  width: getHorizontalSize(327),
                  height: getVerticalSize(310),
                  decoration: BoxDecoration(
                      color: ColorConstant.constantWhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey,
                            blurRadius: 4)
                      ]),
                  child: Padding(
                    padding: getPadding(
                      bottom: 24,
                      left: 24,
                      right: 24,
                      top: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Book Your Ride Here',
                          style: Textstyles.orConditionStyle,
                        ),

                        //Book now button
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/BookNowScreen');
                          },
                          child: BookingsButton(
                            buttonWidth: 279,
                            buttonHeight: 45,
                            topPadding: 10,
                              borderColor: ColorConstant.buttonBlue,
                              buttonColor: ColorConstant.buttonBlue,
                              buttonText: 'Book Now',
                              iconPath: ImageConstant.bookingCalenderIcon,
                              textStyles: Textstyles.bookNowButtonStyle),
                        ),

                        //Give us a call
                        Padding(
                          padding: getPadding(
                            top: 16,
                          ),
                          child: Text(
                            'Give us a Call',
                            style: Textstyles.orConditionStyle,
                          ),
                        ),

                        //Callus button
                        InkWell(
                          onTap: (){
launchUrl(phoneNumber);

                          },
                          child: BookingsButton(
                              buttonWidth: 279,
                              buttonHeight: 45,
                            topPadding: 10,
                              borderColor: ColorConstant.buttonBlue,
                              buttonColor: ColorConstant.constantWhite,
                              buttonText: 'Call Us',
                              iconPath: ImageConstant.bookingCallIcon,
                              textStyles: Textstyles.callUsButtonStyle),
                        ),

                        Padding(
                          padding: getPadding(
                            top: 16,
                          ),
                          child: Text(
                            'Or Message us',
                            style: Textstyles.orConditionStyle,
                          ),
                        ),

                        //Whatsapp button
                        InkWell(
onTap: (){
  launchUrl(whatsApp);

},
                          child: BookingsButton(topPadding: 10,
                              buttonWidth: 279,
                              buttonHeight: 45,
                              borderColor: ColorConstant.buttonBlue,
                              buttonColor: ColorConstant.constantWhite,
                              buttonText: 'Whatsapp',
                              iconPath: ImageConstant.bookingWhatsappIcon,
                              textStyles: Textstyles.whatsappButtonStyle),
                        ),
                      ],
                    ),
                  ),
                ))
          ]),
        ));
  }
}
