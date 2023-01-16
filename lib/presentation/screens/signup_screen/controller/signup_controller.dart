import 'dart:convert';

import 'package:edriver/presentation/screens/signup_screen/model/signup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../app_config.dart';
import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';

class SignupController extends GetxController {
  TextEditingController fullNameTextfieldController = TextEditingController();
  TextEditingController emailTextfieldController = TextEditingController();
  TextEditingController mobileNumberTextfieldController =
      TextEditingController();
  TextEditingController passwordTextfieldController = TextEditingController();
  var isSignupSuccess=false.obs;
  var isLoading=false.obs;

  Future<void> signup() async {
 SignupModel    body = SignupModel(
        name: fullNameTextfieldController.value.text,
        email: emailTextfieldController.value.text,
        mobile: mobileNumberTextfieldController.value.text,
        password: passwordTextfieldController.value.text);
    try{
      isLoading.value=true;
      final APIResponse response = await APIHelper.postData(
          endPoint: '/auth/registration/', header: APIHelper.getApiHeader(), body:body.toJson());
      if(response.error!=true){
        isSignupSuccess.value=true;

        isLoading.value=false;
      }else{
        isLoading.value=false;
        isSignupSuccess.value=false;
      }
    }catch(e){
      isLoading.value=false;
      Utils.oneTimeSnackBar("Couldn't complete registration");

      rethrow;
    }

  }
}
