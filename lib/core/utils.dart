//ignore_for_file:file_names
import 'dart:convert';
import 'dart:ui';
import 'package:edriver/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Utils {

  ///use to print any data for testing and later will be useful to remove the print inside this
  printError(data){
    print('============Error===============');
    print(data);
    print('============Error===============');
  }
  printData(data){
    print('============Data===============');
    print(data);
    print('============Data===============');
  }

  tapWithNetworkCheckn(Function() function)  {
    if( true){
      function();
    }
  }



  Future<Map> getSharedPrefMap() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final map=jsonDecode(sharedPreferences.get('appData1') as String);
    return map;
  }
  ///to log data for debugging
  static Logger logger = Logger();
  ///Used to create an exit dialog with app exit function. Used in Appbar and Home Screen(back button)
  static Future<bool> onWillPopFunction(context) async {
    await showDialog(
        context: context!,
        useRootNavigator: false,
        barrierColor: Theme.of(context).primaryColor.withOpacity(0.1),
        builder: (_) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 2*DynamicSize(Get.context!).width10, vertical: 0),
              // contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              actionsPadding: EdgeInsets.only(bottom: 0, top: 0),
              contentPadding: EdgeInsets.only(left: 2*DynamicSize(Get.context!).width10, top: 3*DynamicSize(Get.context!).height10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.5*DynamicSize(Get.context!).width10),
                  side: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor)),
              content: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                    'Are you sure want to exit?',
                    textScaleFactor: MediaQuery.of(context).size.width/375,
                    style:AppStyle.txtPlusJakartaSansMedium16.copyWith(fontSize:15)
                ),
              ),
              actions: [
/*
 Visibility(
                  visible: isTeacher!?true:false,
                  child: TextButton(
                      onPressed: () {
                        pushNewScreen(context,
                            screen: BottomBarAnimatedScreen(
                                menuScreenContext: context));
                      },
                      child: Container(
                        height:
                        ScreenSizeInfo(context).blockSizeHorizontal * 10,
                        width: ScreenSizeInfo(context).blockSizeHorizontal * 30,
                        decoration: BoxDecoration(
                            color: color1CounselingCard,
                            borderRadius: BorderRadius.circular(
                                ScreenSizeInfo(context).blockSizeHorizontal *
                                    10)),
                        child: Center(
                          child: Text(
                            ' To Teacher',
                            textScaleFactor: ScreenSizeInfo(context).width /
                                ScreenSizeInfo(context).uiWidth,
                            style: GoogleFonts.nunito(
                                fontSize: 17, color: Colors.white),
                          ),
                        ),
                      )),
                ),
*/

                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                      // _sharedPreferences.remove(Constance.sharedAccess);
                      // _sharedPreferences.remove(Constance.sharedStudId);
                      // _sharedPreferences.remove(Constance.sharedStudName);
                      // Navigator.popAndPushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                        'Yes',
                        textScaleFactor: MediaQuery.of(context).size.width/375,
                        style: AppStyle.txtPlusJakartaSansMedium16.copyWith(color: Colors.black,fontSize:14 )
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                        'No',
                        textScaleFactor: MediaQuery.of(context).size.width/375,
                        style: AppStyle.txtPlusJakartaSansMedium16.copyWith(color: Colors.black,fontSize: 14)
                    )),
              ],
            )));
    return false;
  }

  // static NumberFormat formatter = NumberFormat('#,##,000');
  static snackBar(String? message,
      {int time = 2, Color? bgColor, TextStyle? textStyle,BuildContext? context,bool showOnTop=false,}) {
    // ScaffoldMessenger.of(Get.context!).clearSnackBars();///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context??Get.context!)
        .showSnackBar(
      SnackBar(
        behavior:SnackBarBehavior.floating ,
        backgroundColor: bgColor ?? Colors.blue,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin:showOnTop? EdgeInsets.only(
            bottom: MediaQuery.of(context??Get.context!).size.height - 100,right: 20,
            left: 20):null,
        ),
    );
  }

  static  tapWithNetworkCheck(Function() function) async {
         if(await Utils.isOnline()){
          function;
    }
  }


  static oneTimeSnackBar(String? message,
      {int time = 2, Color? bgColor, TextStyle? textStyle,BuildContext? context,bool showOnTop=false,}) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context??Get.context!)
        .showSnackBar(
      SnackBar(
 /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior:showOnTop?SnackBarBehavior.floating :null,
        backgroundColor: bgColor ?? Colors.blue,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin:showOnTop? EdgeInsets.only(
            bottom: MediaQuery.of(context??Get.context!).size.height - 100,right: 20,
            left: 20):null,
      ),

    );
  }
  static oneTimeSnackBarAction(String? message,
      {int time = 2, Color? bgColor, TextStyle? textStyle,BuildContext? context,bool showOnTop=false,Function()? action}) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context??Get.context!)
        .showSnackBar(
      SnackBar(
        action:SnackBarAction(
          textColor: Colors.black,
            label: "Click here to allow",
        onPressed:action??(){}
        ) ,
        behavior:showOnTop?SnackBarBehavior.floating :null,
        backgroundColor: bgColor ?? Color(0xff9EBF6D),
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin:showOnTop? EdgeInsets.only(
            bottom: MediaQuery.of(context??Get.context!).size.height - 100,right: 20,
            left: 20):null,
      ),

    );
  }

  static bool validationOfEmail(String emailPassed) {
    var email = emailPassed;
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  ///Used to check internet connectivity with package => internet_connection_checker: ^0.0.1+3
  ///user this on every btn / or can be implemented on service before API call
  static Future<bool> isOnline()async{
    bool isOnline=await InternetConnectionChecker().hasConnection;
    if(isOnline){
      return true;
    }else{
      oneTimeSnackBar('No network connection!');
      return false;
    }
  }
  ///requires in_app_update package to work.
  static Future<void> checkForUpdate() async {
    try{
      AppUpdateInfo? _updateInfo;
      InAppUpdate.checkForUpdate().then((info) {
        _updateInfo = info;
        if(UpdateAvailability.updateAvailable==2){
          print('update available');
          InAppUpdate.performImmediateUpdate().catchError((e){
            Utils().printError('performImmediateUpdate()');
            Utils().printError(e);
          });
        }
      });
      //this means update is available

    }catch(e){
      print("error checkForUpdate(");
      print(e);
    }

  }
  ///Dotted line
  static Widget  generateDottedLine({Color? dashColor}){
    return Row(
      children: List.generate(
          1000 ~/ 10,
              (index) => Expanded(
            child: Container(
              color: index % 2 == 0
                  ? Colors.transparent
                  : dashColor?? Colors.black,
              height: 0.5,
            ),
          )),
    );
  }

  static  Future<String> getAccessKey() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final access=jsonDecode(sharedPreferences.get('appData1') as String)['access'];
    return access;
  }

  ///date format
  static String dateFormatterDMY(DateTime date){
        return DateFormat('dd/MM/yyyy').format(date);
  }
  static String dateFormatterDMonthY(DateTime date){
        return DateFormat('dd MMM yyyy').format(date);
  }
  static String dateFormatterDMonthYHHmmAM(DateTime date){
        return DateFormat('dd  MMM yyyy hh:mm a').format(date);
  }


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
  double uiWidth=414;
  double uiHeight=414;
  double textScaleFactor=0;
  double ratioWidth1=0;
  double ratioHeight1=0;
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
    // print("ratioWidth10: $ratioWidth1");
    // print("ratioHeight10: $ratioHeight1");
  }
}

///used to capitalize the strings
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
///to format the money / amount seperated with commas 1,20,000
final amountFormatter = new NumberFormat("#,##,##0", "en_IN",);
