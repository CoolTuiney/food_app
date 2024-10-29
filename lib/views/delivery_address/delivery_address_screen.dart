import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_appbar.dart';
import 'package:food_app/utils/extensions.dart';

import '../../common/common_widget.dart';

class DeliveryAddressScreen extends StatelessWidget {
  const DeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const contentPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 15);
    return Scaffold(
      appBar: CommonAppbar(title: "Add new address"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CommonWidget.customTextFieldWithLabel("Full Name", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h),
          CommonWidget.customTextFieldWithLabel("Mobile No.", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h),
          CommonWidget.customTextFieldWithLabel("Address", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h),
          CommonWidget.customTextFieldWithLabel("Pincode", "Eg. Farion Wick",
                  controller: TextEditingController(),
                  contentPadding: contentPadding)
              .padOnly(b: 20.h),
          CommonWidget.roundedButton(
                  borderRadius: 50,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 80.w),
                  context: context,
                  title: "Save",
                  onTap: () {})
              .padSymm(vertical: 15.h)
        ],
      ).padSymm(horizontal: 15.h, vertical: 15.h)),
    );
  }
}
