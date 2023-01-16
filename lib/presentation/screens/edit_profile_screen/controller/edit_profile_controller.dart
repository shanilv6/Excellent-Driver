import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';
import '../../profile_screen/controller/profile_controller.dart';
import '../model/edit_profile_model.dart';

class EditProfileController extends GetxController {
  static var profileDataController = Get.put(ProfileController());
  TextEditingController fullNameTextfieldController = TextEditingController(
      text: ((profileDataController.isDataSuccess == true)
          ? profileDataController.profileDatas.name
          : '!'));
  TextEditingController emailTextfieldController = TextEditingController(
      text: ((profileDataController.isDataSuccess == true)
          ? profileDataController.profileDatas.email
          : '!'));
  TextEditingController mobileNumberTextfieldController = TextEditingController(
    text: (profileDataController.isDataSuccess == true)
            ? profileDataController.profileDatas.mobile
            : '!',
  );
  TextEditingController passwordTextfieldController = TextEditingController();
  var isProfileUpdateSuccess = false.obs;
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

  Future<void> profileUpdate(
      String name, String email, String mobile, String password) async {
    EditProfileModel body = EditProfileModel(
        name: name, email: email, mobile: mobile, password: password);
    try {
      isLoading.value = true;
      final APIResponse response = await APIHelper.patchData(
          endPoint: '/auth/profile/',
          header: APIHelper.getApiHeader(access: await getAccessKey()),
          body: body.toJson());
      if (response.error != true) {
        isProfileUpdateSuccess.value = true;

        isLoading.value = false;
      } else {
        isLoading.value = false;
        isProfileUpdateSuccess.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      Utils.oneTimeSnackBar("Couldn't update Profile");

      rethrow;
    }
  }
}
