import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/service/networking/api_requests.dart';
import 'package:food_app/service/networking/api_service.dart';
import 'package:food_app/utils/constant/end_point.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final mobileTFController = TextEditingController();
  final otpTFController = TextEditingController();
  var isLoading = false.obs;

  Future<bool> sendOTP() async {
    try {
      isLoading.value = true;
      final request = APIRequest(body: {}, apiPath: EndPoint.sendOTP);
      var res = await ApiService.instance.postRequest(request);
      isLoading.value = false;
      return res["message"] == 'Success';
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }

  Future<bool> verifyOTP() async {
    try {
      isLoading.value = true;

      final request =
          APIRequest(body: {"otp": "string"}, apiPath: EndPoint.verifydOTP);
      var res = await ApiService.instance.postRequest(request);
      return res["message"] == 'Success';
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }
}
