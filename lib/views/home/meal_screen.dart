import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/constant/color_constants.dart';
import 'package:food_app/utils/custom_text.dart';
import 'package:food_app/utils/extensions.dart';

import '../../common/common_widget.dart';
import '../product_detail_screen.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(
                text: "What would you like to order",
                size: 28,
                isBold: true,
                overflow: TextOverflow.visible)
            .padOnly(b: 25, l: 20, r: 20),
        const TodaysMenu(title: "Today's Menu").padOnly(b: 10),
        const TodaysMenu(title: "Non-veg Menu"),
      ],
    ).padSymm(vertical: 15);
  }
}

class TodaysMenu extends StatelessWidget {
  const TodaysMenu({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(
          text: title,
          size: 18,
          isBold: true,
        ).padSymm(horizontal: 20),
        SizedBox(
          height: 272,
          child: ListView.separated(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const FoodItemCard();
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 20.h,
            ),
          ),
        ),
      ],
    );
  }
}

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonWidget.pushTo(context, ProductDetailScreen()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        width: 266.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/dummy_meal_image.png",
              height: 136,
              width: 266.h,
              fit: BoxFit.cover,
            ).clipROnly(topLeft: 15, topRight: 15),
            CustomText.title(text: "Veg Meal", isBold: true, size: 15)
                .padOnly(t: 10, l: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/ic_delivery_bike.png",
                  height: 16,
                  width: 16,
                  color: ColorConstant.primaryColor,
                ).padOnly(r: 6),
                CustomText.title(
                    text: "Free Delivery",
                    color: ColorConstant.grayTextColor,
                    size: 12),
                Image.asset(
                  "assets/icons/ic_clock.png",
                  height: 16,
                  width: 16,
                  color: ColorConstant.primaryColor,
                ).padOnly(r: 6, l: 10),
                CustomText.title(
                    text: "10-15 min",
                    color: ColorConstant.grayTextColor,
                    size: 12)
              ],
            ).padOnly(l: 10, t: 5),
            Row(
              children: [
                SizedBox(
                  height: 24.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.h),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.h, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: ColorConstant.grayTextColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: CustomText.title(
                            text: "PANEER",
                            size: 12,
                            color: ColorConstant.grayTextColor),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 10.h),
                  ),
                ).padSymm(vertical: 10.h),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(8.h),
                  margin: EdgeInsets.only(right: 8.h, bottom: 3.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorConstant.primaryColor,
                      border: Border.all(color: ColorConstant.primaryColor)),
                  child: Image.asset(
                    "assets/icons/ic_add_cart.png",
                    color: ColorConstant.bgWhite,
                    height: 25.h,
                    width: 25.h,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
