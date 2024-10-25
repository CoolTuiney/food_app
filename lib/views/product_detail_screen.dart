import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/constant/color_constants.dart';
import 'package:food_app/utils/constant/string_constants.dart';
import 'package:food_app/utils/custom_text.dart';
import 'package:food_app/utils/extensions.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  final radioGroup = List.generate(3, (index) => "$index");
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: CustomScrollView(
          slivers: [
            const ProductDetailAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.title(text: "Veg Meal", size: 28, isBold: true)
                      .padOnly(t: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      ).padOnly(r: 5),
                      CustomText.richText(textSpans: [
                        TextSpan(
                            text: "4.5",
                            style: CustomText.textStyle(
                                size: 14,
                                color: ColorConstant.primaryTextColor)),
                        TextSpan(
                            text: "  (20+) reviews",
                            style: CustomText.textStyle(
                                size: 14, color: ColorConstant.grayTextColor)),
                      ])
                    ],
                  ),
                  SizedBox(height: 10.h),
                  priceAndAddItem(),
                  CustomText.title(
                          text:
                              "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.",
                          size: 15,
                          overflow: TextOverflow.visible)
                      .padSymm(vertical: 15),
                  choiceOfAddOn(),
                  addToCartBtn()
                ],
              ).padSymm(horizontal: 20),
            )
          ],
        )),
      ),
    );
  }

  Widget addToCartBtn() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
          margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
          decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.circular(30.r)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(12.h),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Image.asset(
                  "assets/icons/ic_cart.png",
                  height: 20,
                  width: 20,
                  color: ColorConstant.primaryColor,
                ),
              ),
              CustomText.title(text: "Add To Cart", color: Colors.white)
                  .padOnly(l: 10, r: 20)
            ],
          ),
        ),
      ),
    ).padOnly(t: 50);
  }

  Widget choiceOfAddOn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.title(text: "Choice of Add on", size: 18, isBold: true)
            .padOnly(b: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: radioGroup.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Row(
            children: [
              Image.asset(
                "assets/icons/dummy_meal_image.png",
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ).clipR(100),
              CustomText.title(text: "Mashroom").padSymm(horizontal: 10),
              const Spacer(),
              CustomText.title(text: "+ ${StringConstant.rupee}40"),
              Radio(
                activeColor: ColorConstant.primaryColor,
                groupValue: "1",
                onChanged: (value) {},
                value: radioGroup[index],
              )
            ],
          ),
        )
      ],
    ).padSymm(vertical: 10);
  }

  Row priceAndAddItem() {
    return Row(
      children: [
        CustomText.richText(textSpans: [
          TextSpan(
              text: "\u{20B9}",
              style: CustomText.textStyle(
                  size: 18, bold: true, color: ColorConstant.primaryColor)),
          TextSpan(
              text: "70",
              style: CustomText.textStyle(
                  size: 24, bold: true, color: ColorConstant.primaryColor)),
        ]),
        const Spacer(),
        Image.asset(
          "assets/icons/ic_remove_circle.png",
          height: 30.h,
          width: 30.h,
          color: ColorConstant.primaryColor,
        ),
        CustomText.title(text: "02", size: 16.h, isBold: true)
            .padSymm(horizontal: 10),
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
            size: 18.h,
          ),
        )
      ],
    );
  }
}

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      expandedHeight: 300,
      pinned: true,
      title: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Image.asset(
            "assets/icons/arrow_back_black.png",
          ),
        ),
      ).padSymm(horizontal: 10, vertical: 10),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/icons/dummy_meal_image.png",
          height: 200.h,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
