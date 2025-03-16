import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/service/locatioin_service.dart';
import 'package:food_app/utils/constant/color_constants.dart';
import 'package:food_app/utils/custom_text.dart';
import 'package:food_app/utils/extensions.dart';
import 'package:food_app/views/cart_screen.dart';
import 'package:food_app/views/home/bottom_nav_bar.dart';
import 'package:food_app/providers/home_controller.dart';
import 'package:food_app/views/home/meal_screen.dart';
import 'package:food_app/views/home/snack_screen.dart';
import 'package:food_app/views/home/special_food_screen.dart';
import 'package:food_app/views/product_detail_screen.dart';
import 'package:get/get.dart';

import 'home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    const bodyList = [MealScreen(), SpecialFoodScreen(), SnackScreen()];
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      drawer: const HomeDrawer(),
      body: Obx(() => (homeController.isHomeScreenLoading.value)
          ? Center(child: const CircularProgressIndicator())
          : SingleChildScrollView(
              child: bodyList[homeController.navIndex.value])),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class HomeScreenAppBar extends StatelessWidget implements PreferredSize {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return SafeArea(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
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
                    "assets/icons/hamburger_menu.png",
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    homeController.currLocation.value =
                        await LocationService().getUserLocation();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText.title(
                            text: "Deliver to ",
                            color: ColorConstant.grayTextColor,
                          ),
                          Image.asset(
                            "assets/icons/arrow_back_black.png",
                            width: 10,
                            height: 10,
                            color: ColorConstant.grayTextColor,
                          ).rotate(270).padOnly(t: 3, l: 5)
                        ],
                      ),
                      Obx(
                        () => CustomText.title(
                                text: homeController.currLocation.value,
                                isBold: true)
                            .padOnly(t: 2, l: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => SizedBox(
                  height: 40,
                  width: 35,
                  child: GestureDetector(
                    onTap: () {
                      CommonWidget.pushTo(context, const CartScreen());
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/icons/ic_add_cart.png",
                            height: 25,
                            width: 25,
                            color: ColorConstant.primaryColor,
                          ),
                        ),
                        Positioned(
                          right: 0, // Positioning the badge
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: ColorConstant.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${homeController.cartList.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ).visible(
                            isVisible: homeController.cartList.isNotEmpty),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}
