import 'dart:async';
import 'dart:convert';

import 'package:edriver/app_config.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';
import '../model/upcoming_booking_model.dart';
import 'package:http/http.dart' as http;

class UpcomingBookingController extends GetxController {
  var isLoading = false.obs;
  var upcomingBookingList = <UpcomingBookingModel>[].obs;
  var isCancelBookingLoading = false.obs;
  var isCancelBookingSuccess = false.obs;

  var isLoadingSuccess = false.obs;
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

  Future<void> upcomingBooking() async {
    try {
      isLoading.value = true;
      final APIResponse response = await APIHelper.getData(
          endPoint: '/core/app/booking/upcoming/?offset=0',
          header: APIHelper.getApiHeader(access: await getAccessKey()));

      if (response.error != true) {
        isLoadingSuccess.value = true;
        isLoading.value = false;
        upcomingBookingList.clear();
        final upComingList = response.data["data"]["results"];

        upComingList.forEach((element) {
          upcomingBookingList.add(UpcomingBookingModel(
            id: element["id"],
            pickupDate: element["pickup_date"],
            pickupTime: element["pickup_time"],
            pickupLocation: element["pickup_location"],
            dropLocation: element["drop_location"],
          ));
        });
        update();
      } else {
        isLoadingSuccess.value = false;
        isLoading.value = false;
      }
    } catch (e) {
      Utils.oneTimeSnackBar("Couldn't fetch data");
      isLoading.value = false;
      isLoadingSuccess.value = false;
      rethrow;
    }
  }

//Cancel Bookings
  Future<void> cancelBookings(String id) async {
    try {
      isCancelBookingLoading.value = true;
      final APIResponse response = await putDataForBookingsDelete(
          endPoint: '/core/app/booking_cancel/$id/',
          header: APIHelper.getApiHeader(access: await getAccessKey()),
          body: {});

      if (response.error != true) {
        isCancelBookingSuccess.value = true;

        isCancelBookingLoading.value = false;
        update();
      } else {
        isCancelBookingLoading.value = false;

      }
    } catch (e) {
      Utils.oneTimeSnackBar("Couldn't delete data");
      isCancelBookingLoading.value = false;

      rethrow;
    }
  }

  static Future<APIResponse> putDataForBookingsDelete(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    Utils().printData('$body');
    Utils().printData('putData');
    Utils().printData('header $header');
    if (await Utils.isOnline()) {
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      Utils.logger.i(uri);
      // print(header);
      final res = await http.put(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      print('Statuscode ${res.statusCode}');
      if (APIHelper.isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (res.statusCode == 200) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          Utils.oneTimeSnackBar(resBody['message'] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody['message'] ?? 'Something went wrong!');
        }
      } else {
        Utils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }
}
