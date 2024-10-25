import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/extensions.dart';

import '../utils/custom_text.dart';

class CommonAppbar extends StatelessWidget implements PreferredSize {
  const CommonAppbar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(12.h),
                  decoration: CommonWidget.containerDecoration(radius: 10),
                  child: Image.asset(
                    "assets/icons/arrow_back_black.png",
                  ),
                ),
              ).padSymm(horizontal: 10, vertical: 10),
              Expanded(
                  child: Center(
                      child: CustomText.title(
                          text: title, size: 20, isBold: true))),
              const SizedBox(
                height: 40,
                width: 40,
              ).padSymm(horizontal: 10, vertical: 10)
            ],
          )),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}
