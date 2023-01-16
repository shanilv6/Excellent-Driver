import 'package:edriver/core/app_export.dart';
import 'package:edriver/widgets/country_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/button_container.dart';
import 'language_controller/language_controller.dart';

class LanguageScreen extends StatefulWidget {
  final onPressed;

   LanguageScreen({super.key,required this.onPressed});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var languageController = Get.put(LanguageController());
  // bool arabicSelection = false;
  //
  // bool englishSelection = false;
  //
  // bool japaneseSelection = false;
  //
  // bool chineseSelection = false;

  bool arabicSelectionFalse = false;

  bool englishSelectionFalse = false;

  bool japaneseSelectionFalse = false;

  bool chineseSelectionFalse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
                //absalute position
                padding: getPadding(
                  top: 60,
                ),
                child: Text(
                  'Choose Language',
                  style: Textstyles.titleStyle,
                ),
          ),
        ),
        SizedBox(
          height: getVerticalSize(8),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
                'Please enter your details.',
                style: Textstyles.subTitleStyle,
          ),
        ),
        SizedBox(
          height: getVerticalSize(62),
        ),
        //Languages
        Column(
          children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(()=>
                    GestureDetector(
                          onTap: () {
                            setState(() {
                              languageController.arabicSelection.value = !languageController.arabicSelection.value;
                              languageController.englishSelection.value = false;
                              languageController.japaneseSelection.value = false;
                              languageController.chineseSelection.value = false;
                              languageController.languageSetup(true, false, false, false);
                            });

                          },
                          child: CountryContainer(
                            countryImage: ImageConstant.arabCountryImage,
                            countryName: 'Arabi',
                            selectionColor: (languageController.arabicSelection.value == false)
                                ? Colors.transparent
                                : ColorConstant.buttonBlue,
                          )),
                    ),
                    Obx(()=>
                     GestureDetector(
                          onTap: () {
                            setState(() {
                              languageController.englishSelection.value = !languageController.englishSelection.value;
                              languageController.japaneseSelection.value = false;
                              languageController.chineseSelection.value = false;
                              languageController.arabicSelection.value = false;
                              languageController.languageSetup(false, false, false, true);
                            });
                          },
                          child: CountryContainer(
                            countryImage: ImageConstant.englishCountryImage,
                            countryName: 'English',
                            selectionColor: (languageController.englishSelection.value == false)
                                ? Colors.transparent
                                : ColorConstant.buttonBlue,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(()=>
                     GestureDetector(
                          onTap: () {
                            setState(() {
                              languageController.japaneseSelection.value = !languageController.japaneseSelection.value;
                              languageController.chineseSelection.value = false;
                              languageController.arabicSelection.value = false;
                              languageController.englishSelection.value = false;
                              languageController.languageSetup(false, false, true, false);
                            });
                          },
                          child: CountryContainer(
                            countryImage:ImageConstant.japaneseCountryImage,
                            countryName: 'Japanese',
                            selectionColor: (languageController.japaneseSelection.value == false)
                                ? Colors.transparent
                                : ColorConstant.buttonBlue,
                          )),
                    ),
                    Obx(()=>
                    GestureDetector(
                          onTap: () {
                            setState(() {
                              languageController.chineseSelection.value = !languageController.chineseSelection.value;
                              languageController.arabicSelection.value = false;
                              languageController.englishSelection.value = false;
                              languageController.japaneseSelection.value = false;
                              languageController.languageSetup(false, true, false, false);
                            });
                          },
                          child: CountryContainer(
                            countryImage:ImageConstant.chineseCountryImage,
                            countryName: 'Chinese',
                            selectionColor: (languageController.chineseSelection.value == false)
                                ? Colors.transparent
                                : ColorConstant.buttonBlue,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(24),
                ),
                GestureDetector(
                  onTap: widget.onPressed,
                  child: ButtonContainer(
                    borderRadius: 20,
                    buttonTextStyle: Textstyles.buttonStyle,
                    buttonColor: ColorConstant.buttonBlue,
                    buttonName: 'Select Language',buttonWidth: 300.17,buttonHeight: 45,)
                ),
          ],
        ),
      ],
    ),
              ],
            ))
                );
  }
}

// Future<void>languageButtonAction()async{
//   final _language = await SharedPreferences.getInstance();
//   final _languageSetup = _language.getBool(AppConfig.LANGUAGE);
// if(_languageSetup == false){
//   Get.toNamed('/SignupScreen')?.then((value) => languageSetup());
// }else if(_languageSetup == true){
//   Get.back();
// }
//
// }
// Get.toNamed('/SignupScreen');
// languageSetup();