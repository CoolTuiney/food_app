import 'package:flutter/material.dart';
import 'package:food_app/models/food_listing_model.dart';
import 'package:get/get.dart';

import '../service/networking/api_requests.dart';
import '../service/networking/api_service.dart';
import '../utils/constant/end_point.dart';

class HomeController extends GetxController {
  var navIndex = 0.obs;
  var isHomeScreenLoading = false.obs;
  FoodListingModel? foodListingModel;

   @override
  Future<void> onInit() async {
    super.onInit();
    await getFoodListing();
  }


  Future<void> getFoodListing() async {
    try {
      isHomeScreenLoading.value = true;
      final request = APIRequest(body: {}, apiPath: EndPoint.foodListing);
      var res = await ApiService.instance.getRequest(request);
      foodListingModel = FoodListingModel.fromJson(res);
      isHomeScreenLoading.value = false;
      if (res["message"] == 'Success') {}
    } catch (e) {
      isHomeScreenLoading.value = false;
    }
  }
}
