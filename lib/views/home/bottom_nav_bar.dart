import 'package:flutter/material.dart';
import 'package:food_app/providers/home_controller.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Obx(() => NavigationBar(
          elevation: 5,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          indicatorColor: Theme.of(context).colorScheme.primary,
          selectedIndex: homeController.navIndex.value,
          onDestinationSelected: (v) {
            homeController.navIndex.value = v;
          },
          destinations: [
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/ic_meal.png',
                height: 26,
              ),
              selectedIcon: Image.asset('assets/icons/ic_meal.png',
                  height: 26, color: Colors.white),
              label: 'Meal',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/ic_special_meal.png',
                height: 26,
              ),
              selectedIcon: Image.asset('assets/icons/ic_special_meal.png',
                  height: 26, color: Colors.white),
              label: 'Special',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/ic_snack.png',
                height: 26,
              ),
              selectedIcon: Image.asset('assets/icons/ic_snack.png',
                  height: 26, color: Colors.white),
              label: 'Snacks',
            ),
          ],
        ));
  }
}
