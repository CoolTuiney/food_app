import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/extensions.dart';
import 'package:food_app/views/cart_screen.dart';
import 'package:food_app/views/delivery_address/delivery_address_screen.dart';
import 'package:food_app/views/login_screen.dart';
import 'package:food_app/views/my_orders_screen.dart';
import 'package:food_app/views/profile/profile_screen.dart';

import '../../utils/constant/color_constants.dart';
import '../../utils/custom_text.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final drawerList = [
      DrawerItem(
          title: "My Cart",
          img: "ic_my_orders.png",
          navigateTo: const CartScreen()),
      DrawerItem(
          title: "My Orders",
          img: "ic_my_orders.png",
          navigateTo: const MyOrdersScreen()),
      DrawerItem(
          title: "Profile",
          img: "ic_profile.png",
          navigateTo: const ProfileScreen()),
      DrawerItem(
          title: "Delivery Address",
          img: "ic_location.png",
          navigateTo: const DeliveryAddressScreen()),
      DrawerItem(title: "Contact Us", img: "ic_message.png"),
      DrawerItem(title: "Help & FAQs", img: "ic_help.png"),
    ];
    return SafeArea(
        child: Drawer(
      backgroundColor: ColorConstant.bgWhite,
      surfaceTintColor: ColorConstant.primaryColor,
      width: 280,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 60,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    backgroundColor: Colors.yellow.shade700,
                    backgroundImage:
                        const AssetImage("assets/icons/img_profile_dummy.png"),
                  ).padOnly(b: 10, l: 20, r: 20),
                  CustomText.title(text: "Farion Wick", isBold: true, size: 20)
                      .padOnly(b: 4, t: 4, l: 20, r: 20),
                  CustomText.title(
                          text: "farionwick@gmail.com",
                          color: ColorConstant.grayTextColor)
                      .padOnly(b: 30, l: 20, r: 20),
                  ...drawerList.map((e) => InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        CommonWidget.pushTo(context, e.navigateTo);
                      },
                      child: customTile(e.title, e.img))),
                ],
              ).padSymm(vertical: 25),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20.h,
            child: CommonWidget.roundedBtnWithIcon(
              title: "Logout",
              icon: "assets/icons/ic_logout.png",
              onTap: () =>
                  CommonWidget.replaceWith(context, const LoginScreen()),
            ),
          )
        ],
      ),
    ));
  }

  Widget customTile(String title, String img) {
    return GestureDetector(
      child: Row(
        children: [
          Image.asset(
            "assets/icons/$img",
            height: 22,
            width: 22,
          ).padOnly(r: 20),
          CustomText.title(text: title, size: 16)
        ],
      ).padSymm(vertical: 20, horizontal: 20),
    );
  }
}

class DrawerItem {
  String title;
  String img;
  Widget? navigateTo;

  DrawerItem({required this.title, required this.img, this.navigateTo});
}
