import 'dart:async';

import 'package:edriver/app_config.dart';
import 'package:edriver/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () => checkUserLogin());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child:Container(
        width: getHorizontalSize(302),
        height:getVerticalSize(302),
        decoration: BoxDecoration(color: Colors.transparent,image: DecorationImage(image: AssetImage(ImageConstant.splashScreenImage),fit: BoxFit.cover)),
      ))),
    );
  }
}
Future<void>checkUserLogin()async{
  final _language = await SharedPreferences.getInstance();
  final _languageSetup = _language.getBool(AppConfig.LANGUAGESELECTION);


  final _loginData = await SharedPreferences.getInstance();
  final _userLoggedin = _loginData.getBool(AppConfig.USERLOGIN);
  if(_languageSetup == false || _languageSetup==null){
    Get.toNamed('/LanguageScreen');

  }else
  if(_userLoggedin == null || _userLoggedin == false){
    Get.toNamed('/LoginScreen');
  }else{
    Get.toNamed('/BottomNavigationBar');
  }
}
Future<void> loginSetup()async{
  final _loginData = await SharedPreferences.getInstance();
  _loginData.setBool(AppConfig.USERLOGIN, true);
}
Future<void> logOutSetup()async{
  final _loginData = await SharedPreferences.getInstance();
  final success = await _loginData.remove(AppConfig.USERLOGIN);

}
Future<void> languageSetup()async{
  final _language = await SharedPreferences.getInstance();
  _language.setBool(AppConfig.LANGUAGESELECTION, true);
}

