import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/common_appbar.dart';
import 'package:food_app/common/common_widget.dart';
import 'package:food_app/utils/extensions.dart';

import '../utils/constant/color_constants.dart';
import '../utils/constant/string_constants.dart';
import '../utils/custom_text.dart';
import 'cart_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppbar(title: "My Orders"),
      body: OrderTabBar(),
    );
  }
}

class OrderTabBar extends StatefulWidget {
  const OrderTabBar({super.key});

  @override
  State<OrderTabBar> createState() => _OrderTabBarState();
}

class _OrderTabBarState extends State<OrderTabBar>
    with TickerProviderStateMixin {
  late TabController tabControllr;

  @override
  void initState() {
    tabControllr = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              border: Border.all(
                  width: 2,
                  color: ColorConstant.grayTextColor.withOpacity(0.1))),
          child: TabBar(
              dividerColor: Colors.transparent,
              splashBorderRadius: BorderRadius.circular(50),
              controller: tabControllr,
              unselectedLabelColor: ColorConstant.primaryColor,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorConstant.primaryColor),
              tabs: const [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Upcoming"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("History"),
                  ),
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(controller: tabControllr, children: [
            upcomingPage(),
            historyPage(),
          ]).padSymm(horizontal: 15),
        )
      ],
    );
  }

  Widget upcomingPage() => ListView.separated(
        itemCount: 2,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemBuilder: (context, i) {
          return const OrderItemWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 15.h,
          );
        },
      );
  Widget historyPage() => ListView.separated(
        itemCount: 2,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemBuilder: (context, i) {
          return const OrderItemWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 15.h,
          );
        },
      );
}

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: CommonWidget.containerDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: CommonWidget.containerDecoration(radius: 10),
            child: Image.asset(
              "assets/icons/dummy_meal_image.png",
              height: 90.h,
              width: 90.h,
              fit: BoxFit.cover,
            ).clipR(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.title(
                        text: "#264100",
                        color: ColorConstant.primaryColor,
                        isBold: true,
                        size: 14)
                    .align(Alignment.topRight),
                CustomText.title(
                    text: "20 Jun, 10:30   ${StringConstant.bullet} 3 items",
                    size: 14,
                    color: ColorConstant.grayTextColor),
                CustomText.title(text: "Veg Meal", isBold: true, size: 18)
                    .padSymm(vertical: 5),
                CustomText.title(
                    text: "${StringConstant.rupee}70",
                    size: 18,
                    isBold: true,
                    color: ColorConstant.primaryColor),
              ],
            ).padOnly(l: 20),
          ),
        ],
      ),
    );
  }
}
