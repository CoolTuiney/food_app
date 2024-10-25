import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/constant/color_constants.dart';
import 'package:food_app/utils/extensions.dart';
import 'package:food_app/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      CommonWidget.replaceWith(context, const LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Center(
          child: Stack(
        children: [
          Image.asset(
            "assets/icons/splash_screen_icon.png",
            width: 182.h,
            height: 163.h,
          ),
          Image.asset(
            "assets/icons/splash_screen_icon.png",
            width: 182.h,
            height: 163.h,
          ).shimmer(),
        ],
      )),
    );
  }
}
