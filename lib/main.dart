import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/app_theme.dart';
import 'package:food_app/views/home/home_controller.dart';
import 'package:food_app/views/home/home_screen.dart';
import 'package:food_app/views/profile/profile_screen.dart';
import 'package:food_app/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => HomeController())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeClass.lightTheme,
            home: const HomeScreen()),
      ),
    );
  }
}
