
import 'package:edriver/presentation/screens/login_screen/model/login_model.dart';
import 'package:edriver/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config.dart';
import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';

class LoginController extends GetxController {

  TextEditingController loginMobileNumberTextfieldController =
      TextEditingController();
  TextEditingController loginPasswordTextfieldController =
      TextEditingController();
  var isLoginSuccess = false.obs;
  var isLoading = false.obs;
  late final sharedPreferences;
  initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void onReady() {
    initSharedPref();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    //accesstoken removel
    // final storeDeatils = await SharedPreferences.getInstance();
    // final success = await storeDeatils.remove('accesstoken');

    LoginModel body = LoginModel(
        username: loginMobileNumberTextfieldController.text,
        password: loginPasswordTextfieldController.text);

    try {
      isLoading.value = true;

      final APIResponse response = await APIHelper.postData(
          endPoint: '/auth/login/',
          header: APIHelper.getApiHeader(),
          body: body.toJson());
      if (response.error != true) {
        sharedPreferences.setString(
            AppConfig.ACCESS, response.data["data"]["token"]["access"] ?? '');
        isLoginSuccess.value = true;
        loginSetup();
        isLoading.value = false;
        update();

      } else {
        isLoading.value = false;
        update();
      }
    } catch (e) {
      isLoading.value = false;
      update();
      Utils.oneTimeSnackBar("Something wrong");

      rethrow;
    }
  }
}
