import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils.dart';
import '../../../../services/api_services/api_helper.dart';
import '../../../../services/api_services/api_response.dart';
import '../model/booking_history_model.dart';

class BookingHistoryController extends GetxController {
  var isLoading = false.obs;
  var bookingHistoryList = <BoookingHistoryModel>[].obs;
  var isBookingsuccess = false.obs;


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

  Future<void> bookingHistory() async {
    try {
      isLoading.value = true;
      final APIResponse response = await APIHelper.getData(
          endPoint: '/core/app/booking/history/?offset=0',
          header: APIHelper.getApiHeader(access: await getAccessKey()));

      if (response.error != true) {
        isLoading.value = false;
        isBookingsuccess.value = true;
        bookingHistoryList.clear();
        final historyList = response.data["data"]["results"];

        historyList.forEach((element) {
          bookingHistoryList.add(BoookingHistoryModel(
            status: element["status"],
            id: element["id"],
            pickupDate: element["pickup_date"],
            pickupTime: element["pickup_time"],
            pickupLocation: element["pickup_location"],
            dropLocation: element["drop_location"],
          ));
        });
        update();
      } else {
        isBookingsuccess.value = false;
        isLoading.value = false;
      }
    } catch (e) {
      isBookingsuccess.value = false;
      Utils.oneTimeSnackBar("Couldn't fetch data");
      isLoading.value = false;
      rethrow;
    }
  }
}