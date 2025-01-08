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
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore, color: Colors.white),
              label: 'Meal',
            ),
            NavigationDestination(
              icon: Icon(Icons.commute_outlined),
              selectedIcon: Icon(Icons.commute, color: Colors.white),
              label: 'Special',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.bookmark, color: Colors.white),
              label: 'Snacks',
            ),
          ],
        ));
  }
}
