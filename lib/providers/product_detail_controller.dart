import 'dart:convert';

import 'package:food_app/models/food_listing_model.dart';
import 'package:food_app/providers/home_controller.dart';
import 'package:food_app/service/shared_pref.dart';
import 'package:get/get.dart';

enum Cart { add, remove, update }

class ProductDetailController extends GetxController {
  var quantity = 1;
}
