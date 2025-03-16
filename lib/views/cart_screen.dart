import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/models/food_listing_model.dart';
import 'package:food_app/providers/home_controller.dart';
import 'package:food_app/utils/constant/string_constants.dart';
import 'package:food_app/utils/extensions.dart';
import 'package:food_app/utils/stylish_toast.dart';
import 'package:food_app/utils/utls_methods.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../common/common_appbar.dart';
import '../providers/home_controller.dart';
import '../providers/product_detail_controller.dart';
import '../utils/constant/color_constants.dart';
import '../utils/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: const CommonAppbar(
        title: "My Cart",
      ),
      body: Obx(
        () => (homeController.cartList.isEmpty)
            ? emptyBody()
            : cartBody(homeController, context),
      ),
    );
  }

  Widget emptyBody() {
    return Center(
      child: CustomText.title(
          text: "Your cart list is empty",
          size: 16,
          color: ColorConstant.grayTextColor),
    );
  }

  Widget cartBody(HomeController homeController, BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.cartList.length,
              padding: EdgeInsetsDirectional.symmetric(vertical: 26.h),
              itemBuilder: (context, i) {
                return CartItemWidget(
                  food: homeController.cartList[i],
                  index: i,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 26.h);
              },
            ),
            SizedBox(height: 25.h),
            rowPriceWithDivider("Subtotal", "${homeController.subTotal.value}"),
            rowPriceWithDivider("Tax & Fee", "${homeController.tax.value}"),
            rowPriceWithDivider("Delivery", "0"),
            rowPriceWithDivider("Total", "${homeController.total.value}"),
            CommonWidget.roundedButton(
                borderRadius: 50,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 80.w),
                context: context,
                title: "Call Us",
                onTap: () {
                  launchUrlString("tel://9987477331");
                }).padOnly(t: 100, b: 30),
          ],
        ).padSymm(horizontal: 15),
      ),
    );
  }

  Column rowPriceWithDivider(String label, String val) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.title(text: label, size: 16, isBold: false),
            CustomText.title(
                text: "${StringConstant.rupee}$val", size: 19, isBold: true),
          ],
        ),
        Divider(
          color: ColorConstant.grayTextColor.withOpacity(0.2),
          height: 30,
        )
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.food, required this.index});
  final FoodItem food;
  final int index;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Obx(
      () => Row(
        children: [
          Container(
            // padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: ColorConstant.primaryColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ]),
            child: Image.asset(
              "assets/icons/dummy_meal_image.png",
              height: 82.h,
              width: 82.h,
              fit: BoxFit.cover,
            ).clipR(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText.title(
                          text: food.fiName, isBold: true, size: 18),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await homeController.addRemoveCart(food, Cart.remove);
                        StylishToast.show(context, "Item removed from cart");
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(5.h),
                          child: Icon(Icons.close,
                              size: 15.h, color: ColorConstant.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomText.title(
                        text: food.fiIngredients,
                        size: 14,
                        color: ColorConstant.grayTextColor)
                    .padOnly(t: 0, b: 12, r: 30),
                Row(
                  children: [
                    CustomText.title(
                        text:
                            "${StringConstant.rupee} ${(Utils.formatPrice(food.fiPrice) * (homeController.cartList[index].quantity ?? 0))}",
                        size: 18,
                        isBold: true,
                        color: ColorConstant.primaryColor),
                    const Spacer(),
                    AddRemoveItem(
                      food: food,
                      index: index,
                    )
                  ],
                ),
              ],
            ).padOnly(l: 20),
          ),
        ],
      ),
    );
  }
}

class AddRemoveItem extends StatefulWidget {
  const AddRemoveItem({super.key, required this.food, required this.index});
  final FoodItem food;
  final int index;

  @override
  State<AddRemoveItem> createState() => _AddRemoveItemState();
}

class _AddRemoveItemState extends State<AddRemoveItem> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Obx(
      () => Row(
        children: [
          GestureDetector(
            onTap: () {
              if ((widget.food.quantity ?? 0) > 1) {
                widget.food.quantity = (widget.food.quantity ?? 0) - 1;

                homeController.addRemoveCart(widget.food, Cart.update);
              }
            },
            child: Image.asset(
              "assets/icons/ic_remove_circle.png",
              height: 28.h,
              width: 28.h,
              color: ColorConstant.primaryColor,
            ),
          ),
          SizedBox(
            width: 40,
            child: CustomText.title(
                text: '${homeController.cartList[widget.index].quantity}',
                isBold: true,
                textAlign: TextAlign.center),
          ),
          // Image.asset(
          //   "assets/icons/ic_add_circle.png",
          //   height: 30.h,
          //   width: 30.h,
          //   // color: ColorConstant.primaryColor,
          // ),
          GestureDetector(
            onTap: () {
              widget.food.quantity = (widget.food.quantity ?? 0) + 1;

              homeController.addRemoveCart(widget.food, Cart.update);
            },
            child: Container(
              padding: EdgeInsets.all(6.h),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ColorConstant.primaryColor),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 15.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
