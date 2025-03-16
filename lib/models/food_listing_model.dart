// To parse this JSON data, do
//
//     final foodListingModel = foodListingModelFromJson(jsonString);

import 'dart:convert';

FoodListingModel foodListingModelFromJson(String str) =>
    FoodListingModel.fromJson(json.decode(str));

String foodListingModelToJson(FoodListingModel data) =>
    json.encode(data.toJson());

class FoodListingModel {
  int? code;
  List<FoodItem>? data;
  String? message;
  int? statusCode;

  FoodListingModel({
    this.code,
    this.data,
    this.message,
    this.statusCode,
  });

  factory FoodListingModel.fromJson(Map<String, dynamic> json) =>
      FoodListingModel(
        code: json["code"],
        data: json["data"] == null
            ? []
            : List<FoodItem>.from(
                json["data"]!.map((x) => FoodItem.fromJson(x))),
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "statusCode": statusCode,
      };
}

class FoodItem {
  int? fiId;
  int? quantity;
  String? fiName;
  String? fiCode;
  String? fiIngredients;
  String? fiCalories;
  String? fiCurrency;
  double? fiPrice;
  String? fiImage;
  String? fiState;

  FoodItem(
      {this.fiId,
      this.fiName,
      this.fiCode,
      this.fiIngredients,
      this.fiCalories,
      this.fiCurrency,
      this.fiPrice,
      this.fiImage,
      this.fiState,
      this.quantity});

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        fiId: json["fiId"],
        fiName: json["fiName"],
        fiCode: json["fiCode"],
        fiIngredients: json["fiIngredients"],
        fiCalories: json["fiCalories"],
        fiCurrency: json["fiCurrency"],
        fiPrice: json["fiPrice"],
        fiImage: json["fiImage"],
        fiState: json["fiState"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "fiId": fiId,
        "fiName": fiName,
        "fiCode": fiCode,
        "fiIngredients": fiIngredients,
        "fiCalories": fiCalories,
        "fiCurrency": fiCurrency,
        "fiPrice": fiPrice,
        "fiImage": fiImage,
        "fiState": fiState,
        "quantity": quantity
      };
}
