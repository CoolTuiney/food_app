// To parse this JSON data, do
//
//     final foodListingModel = foodListingModelFromJson(jsonString);

import 'dart:convert';

FoodListingModel foodListingModelFromJson(String str) => FoodListingModel.fromJson(json.decode(str));

String foodListingModelToJson(FoodListingModel data) => json.encode(data.toJson());

class FoodListingModel {
    int? code;
    List<Datum>? data;
    String? message;
    int? statusCode;

    FoodListingModel({
        this.code,
        this.data,
        this.message,
        this.statusCode,
    });

    factory FoodListingModel.fromJson(Map<String, dynamic> json) => FoodListingModel(
        code: json["code"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "statusCode": statusCode,
    };
}

class Datum {
    int? fiId;
    String? fiName;
    String? fiCode;
    String? fiIngredients;
    String? fiCalories;
    String? fiCurrency;
    int? fiPrice;
    String? fiImage;
    String? fiState;

    Datum({
        this.fiId,
        this.fiName,
        this.fiCode,
        this.fiIngredients,
        this.fiCalories,
        this.fiCurrency,
        this.fiPrice,
        this.fiImage,
        this.fiState,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fiId: json["fiId"],
        fiName: json["fiName"],
        fiCode: json["fiCode"],
        fiIngredients: json["fiIngredients"],
        fiCalories: json["fiCalories"],
        fiCurrency: json["fiCurrency"],
        fiPrice: json["fiPrice"],
        fiImage: json["fiImage"],
        fiState: json["fiState"],
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
    };
}
