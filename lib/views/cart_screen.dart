import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/constant/string_constants.dart';
import 'package:food_app/utils/extensions.dart';

import '../common/common_appbar.dart';
import '../utils/constant/color_constants.dart';
import '../utils/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: "My Cart",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              padding: EdgeInsetsDirectional.symmetric(vertical: 26.h),
              itemBuilder: (context, i) {
                return const CartItemWidget();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 26.h);
              },
            ),
            SizedBox(height: 25.h),
            rowPriceWithDivider("Subtotal", "140"),
            rowPriceWithDivider("Tax & Fee", "40"),
            rowPriceWithDivider("Delivery", "0"),
            rowPriceWithDivider("Total", "180"),
            CommonWidget.roundedButton(
                    borderRadius: 50,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 80.w),
                    context: context,
                    title: "Checkout",
                    onTap: () {})
                .padOnly(t: 100, b: 30),
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
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        text: "Veg Meal", isBold: true, size: 18),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
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
                      text: "Rice, daal, chapati",
                      size: 14,
                      color: ColorConstant.grayTextColor)
                  .padOnly(t: 0, b: 12),
              Row(
                children: [
                  CustomText.title(
                      text: "${StringConstant.rupee}70",
                      size: 18,
                      isBold: true,
                      color: ColorConstant.primaryColor),
                  const Spacer(),
                  const AddRemoveItem()
                ],
              ),
            ],
          ).padOnly(l: 20),
        ),
      ],
    );
  }
}

class AddRemoveItem extends StatelessWidget {
  const AddRemoveItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/ic_remove_circle.png",
          height: 28.h,
          width: 28.h,
          color: ColorConstant.primaryColor,
        ),
        CustomText.title(text: "02", isBold: true).padSymm(horizontal: 5),
        // Image.asset(
        //   "assets/icons/ic_add_circle.png",
        //   height: 30.h,
        //   width: 30.h,
        //   // color: ColorConstant.primaryColor,
        // ),
        Container(
          padding: EdgeInsets.all(6.h),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: ColorConstant.primaryColor),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 15.h,
          ),
        ),
      ],
    );
  }
}
