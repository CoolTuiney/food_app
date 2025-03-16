import 'package:flutter/material.dart';

class ColorConstant {
  // static const Color primaryColor = Color(0xFF15320B);
  // static const Color primaryColor = Color(0xFFFE724C);
  static const Color primaryColor = Color(0xFF15320B);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgBlue = Color(0xFF191B2F);
  static Color red = Colors.red.shade700;

  // static const Color primaryTextColor = Color(0xFF111719);
  static const Color primaryTextColor = Color(0xFF323643);
  static const Color grayTextColor = Color(0xFF7E8392);

  static LinearGradient loginBgLinearGradient = const LinearGradient(
    colors: [
      Colors.transparent,
      bgBlue,
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );
}
