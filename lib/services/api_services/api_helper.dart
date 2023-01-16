import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_config.dart';
import '../../core/utils.dart';
import '../../routes.dart';
import 'api_response.dart';

class APIHelper {
  static bool Catch(
    int statusCode,
    String message,
  ) {
    Utils.oneTimeSnackBar("${statusCode} , ${message}.",
        bgColor: Colors.red, time: 3);

    // /todo : need to handle in other way
    // return statusCode >= 200 && statusCode < 401||statusCode==500;
    return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  }

  // static bool isRequestHandler(
  //   int statusCode,
  //   String pagePath,
  //   String messageTitle,
  //   String messageSubTitle,
  // ) {
  //   if (statusCode == 200 || statusCode == 201) {
  //     // Utils.oneTimeSnackBar("${messageTitle} , ${messageSubTitle}.",
  //     //     bgColor: Colors.green, time: 3);
  //
  //     Get.offAllNamed(pagePath);
  //   } else if (statusCode == 400) {
  //     Utils.oneTimeSnackBar("${messageTitle} , ${messageSubTitle}.",
  //         bgColor: Colors.red, time: 3);
  //   }
  //
  //   // /todo : need to handle in other way
  //   // return statusCode >= 200 && statusCode < 401||statusCode==500;
  //   return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  // }

  static bool isRequestSucceeded(int statusCode) {
    if (statusCode == 401) {
      Utils.oneTimeSnackBar("Login session Expired! , Login again to continue.",
          bgColor: Colors.red, time: 3);
      // Routes.router.navigator!.context.replace('/LoginScreen');
      // Get.toNamed("/LogInScreen");
      Get.offAllNamed("/LoginScreen");
    }
    // /todo : need to handle in other way
    // return statusCode >= 200 && statusCode < 401||statusCode==500;
    return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  }

  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  ///try catch inside get was removed later since 500 is added in status code now it may required! //todo:
  ///for get methode
  ///if final url is null then only other urls applied
  static getData(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    if (await Utils.isOnline()) {
      final uri = Uri.parse(finalUrl ?? (AppConfig.finalUrl + endPoint));
      Utils.logger.i(uri);
      final res = await http.get(uri, headers: header);
      Utils().printData('getData res ${utf8.decode(res.bodyBytes)}');
      print('Statuscode ${res.statusCode}');
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        if (resBody['status'] == 'ok') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody['message'] ?? 'Something went wrong!');
        }
      } else {
        return APIResponse(
            data: '', error: true, errorMessage: 'Something went wrong!');
      }
    }
  }

  //for post

  static Future<APIResponse> postData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    Utils().printData('$body');
    Utils().printData('postData');
    Utils().printData('header $header');
    if (await Utils.isOnline()) {
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      Utils.logger.i(uri);
      // print(header);
      final res = await http.post(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == 'ok') {
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
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }

    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  //patch
  static Future<APIResponse> patchData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    if (await Utils.isOnline()) {
      Utils().printData('$body');
      Utils().printData('patch body above');
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      Utils.logger.i(uri);
      // print(header);
      final res =
          await http.patch(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == 'ok') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          Utils.oneTimeSnackBar(resBody['message'] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody['message'] ?? 'Something went wrong!');
        }
      } else {
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   Utils().printError('patchData() in api helper $e');
      //   rethrow;
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }

    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  //for put

  static Future<APIResponse> putData(
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
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == 'ok') {
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
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }

    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  /*static Future<APIResponse> postData({required String endPoint,required Map<String,String> header,required Map<String,String> body})async{

    try{
      final uri=Uri.parse(AppConfig.finalUrl+endPoint);
      Utils.logger.i(uri);
      print(header);
      final res=await http.post(uri,headers:header,body:jsonEncode(body) );
      if(isRequestSucceeded(res.statusCode)){
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        if (resBody['status'] == 'ok') {
          return APIResponse(
              data: res.body, error: false, errorMessage: '');
        }else{
          return APIResponse(
              data: res.body, error: true, errorMessage: resBody['message']??'Something went wrong!');
        }
      }else{
        return APIResponse(
            data: '', error: true, errorMessage: 'Something went wrong!');
      }
    }catch(e){
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }

  }*/

//       ///data stores to temp start
//       file.writeAsStringSync(utf8.decode(res.bodyBytes), flush: true, mode: FileMode.write);
//       ///data stores to temp end
//
//       return APIResponse(
//           data: res.body, error: false, errorMessage: '');
//     } else {
//       return APIResponse(data:"", error: true, errorMessage: 'error');
//     }

}
