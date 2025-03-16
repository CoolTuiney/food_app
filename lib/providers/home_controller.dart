import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/food_listing_model.dart';
import 'package:get/get.dart';

import '../service/locatioin_service.dart';
import '../service/networking/api_requests.dart';
import '../service/networking/api_service.dart';
import '../service/shared_pref.dart';
import '../utils/constant/end_point.dart';
import 'product_detail_controller.dart';

class HomeController extends GetxController {
  var navIndex = 0.obs;
  var isHomeScreenLoading = false.obs;
  FoodListingModel? foodListingModel;
  RxList<FoodItem> cartList = <FoodItem>[].obs;

  RxString currLocation = ''.obs;

  var subTotal = 0.obs;
  var total = 0.obs;
  var tax = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    currLocation.value = await LocationService().getUserLocation();
    await getCart();
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

  addRemoveCart(FoodItem food, Cart cart) async {
    switch (cart) {
      case Cart.add:
        cartList.add(food);
        break;
      case Cart.remove:
        cartList.removeWhere((element) => element.fiId == food.fiId);
        break;
      default:
    }
    final stringify = jsonEncode(cartList);
    SharedPref.set(SharedPref.cartKey, stringify);
    await getCart();
  }

  updateAmount() {
    var val = 0;
    for (var food in cartList) {
      int price = food.fiPrice?.toInt() ?? 0;
      val += (food.quantity ?? 0) * price;
    }
    subTotal.value = val;
    total.value = val + tax.value;
  }

  getCart() async {
    final cartString = await SharedPref.getString(SharedPref.cartKey) ?? "";
    if (cartString.isEmpty) return;
    final foodList = (jsonDecode(cartString) as List)
        .map((item) => FoodItem.fromJson(item))
        .toList();

    cartList.value = foodList;
    updateAmount();
  }

  bool isContainsInCart(int? fiId) {
    for (var cart in cartList) {
      if (cart.fiId == fiId) {
        return true;
      }
    }
    return false;
  }
}
