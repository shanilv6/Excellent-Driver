import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';
import '../model/booking_model.dart';

class BookingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController pickingTimeController = TextEditingController();
  TextEditingController pickUpPointController = TextEditingController();
  TextEditingController pickOutPointController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  var isBookingLoading = false.obs;
  var isBookingSuccess = false.obs;
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

  Future<void> bookingRide(
      {required String name,
      required String mobile,
      required String date,
      required String pickingTime,
      required String pickupPoint,
      required String pickOutpoint}) async {
    BookingModel body = BookingModel(
        name: name,
        mobile: mobile,
        pickupDate: date,
        pickupTime: pickingTime,
        pickupLocation: pickupPoint,
        dropLocation: pickOutpoint);
    try {
      isBookingLoading.value = true;

      final APIResponse response = await APIHelper.postData(
          endPoint: '/core/app/booking/create/',
          header: APIHelper.getApiHeader(access: await getAccessKey()),
          body: body.toJson());
      if (response.error != true) {
        isBookingSuccess.value = true;
        isBookingLoading.value = false;
        update();
      } else {
        isBookingSuccess.value = false;
        isBookingLoading.value = false;
        update();
      }
    } catch (e) {
      isBookingLoading.value = false;
      update();
      Utils.oneTimeSnackBar("Something wrong");

      rethrow;
    }
  }
}
