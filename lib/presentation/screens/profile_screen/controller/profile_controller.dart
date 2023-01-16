import 'dart:convert';

import 'package:edriver/presentation/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';
import '../../login_screen/controller/login_controller.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileDatas;
  var isLogoutLoading = false.obs;
  var isDataSuccess = false.obs;
  var isLogoutSuccess = false.obs;
  late final sharedPreferences;
  // var profileDatas;

  // var profileData = <ProfileDataModel>[].obs;

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

  Future<String> getAccessKey() async {

    final sharedPreferences = await SharedPreferences.getInstance();
    late final access;
    if (sharedPreferences.get('access') != null) {
      access = sharedPreferences.get('access');
    } else {
      access = '';
    }
    return access;
  }

  Future<void> profileDataFetching() async {
    try {
      isLoading.value = true;
      final APIResponse response = await APIHelper.getData(
          endPoint: '/auth/profile/',
          header: APIHelper.getApiHeader(access: await getAccessKey()));

      if (response.error != true) {
        final data = response.data["data"];

        profileDatas = ProfileDataModel.fromJson(data);
        isLoading.value = false;
        isDataSuccess.value = true;

        update();
      } else {
        isDataSuccess.value = false;
        isLoading.value = false;
      }
    } catch (e) {
      Utils.oneTimeSnackBar("Couldn't fetch data");
      isLoading.value = false;
      isDataSuccess.value = false;
      rethrow;
    }
  }

  //Logout
  Future<void> logOut() async {
    var loginController = Get.put(LoginController());

    isLogoutLoading.value = true;
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: '/auth/logout/',
          header: APIHelper.getApiHeader(access: await getAccessKey()),
          body: {});
      if (response.error != true) {
        isLogoutSuccess.value = true;
logOutSetup();
loginController.loginMobileNumberTextfieldController.clear();
loginController.loginPasswordTextfieldController.clear();
        isLogoutLoading.value = false;

      } else {
        isLogoutLoading.value = false;
        isLogoutSuccess.value = false;
      }
    } catch (e) {
      isLogoutLoading.value = false;
      Utils.oneTimeSnackBar("Something wrong");

      rethrow;
    }
  }
}
