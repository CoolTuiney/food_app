import 'package:flutter/material.dart';
import 'package:food_app/views/home/home_controller.dart';
import 'package:provider/provider.dart';

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
    return Consumer<HomeController>(
      builder: (BuildContext context, homeController, Widget? child) {
        return NavigationBar(
          elevation: 5,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          indicatorColor: Theme.of(context).colorScheme.primary,
          selectedIndex: homeController.navIndex,
          onDestinationSelected: (v) {
            homeController.setNavIndex(v);
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
        );
      },
    );
  }
}
