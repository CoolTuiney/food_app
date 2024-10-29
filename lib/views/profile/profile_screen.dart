import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_appbar.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/constant/color_constants.dart';
import 'package:food_app/utils/extensions.dart';

import '../../utils/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [Image.asset("assets/icons/profile_bg.png"), body()],
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    const contentPadding =
        EdgeInsets.symmetric(vertical: 20, horizontal: 15);
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const CommonAppbar(
        title: "",
        bgColor: Colors.transparent,
      ),
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.shade700.withOpacity(0.1),
                    spreadRadius: 8,
                    blurRadius: 7,
                    offset: const Offset(-3, 10),
                  ),
                ]),
            child: CircleAvatar(
              radius: 45.r,
              backgroundColor: Colors.yellow.shade700,
              backgroundImage:
                  const AssetImage("assets/icons/img_profile_dummy.png"),
            ),
          ),
          CustomText.title(text: "Farion Wick", isBold: true, size: 20)
              .padOnly(b: 4, t: 4, l: 20, r: 20),
          GestureDetector(
            child: CustomText.title(
                    text: "Edit Profile", color: ColorConstant.grayTextColor)
                .padOnly(b: 30, l: 20, r: 20),
          ),
          CommonWidget.customTextFieldWithLabel("Full Name", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h),
          CommonWidget.customTextFieldWithLabel("Email", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h),
          CommonWidget.customTextFieldWithLabel("Phone No.", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h)
        ],
      ).padOnly(t: 70.h, l: 15.h, r: 15.h),
    ]);
  }
}
