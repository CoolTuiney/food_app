import 'package:flutter/material.dart';
import 'package:food_app/utils/extensions.dart';
import 'package:food_app/views/home/meal_screen.dart';

import '../../utils/custom_text.dart';

class SpecialFoodScreen extends StatelessWidget {
  const SpecialFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.title(
                text: "Discover Our Special Dishes",
                size: 28,
                isBold: true,
                overflow: TextOverflow.visible)
            .padOnly(b: 25, l: 20, r: 20),
        const TodaysMenu(title: " Maharashtrian").padOnly(b: 10),
        const TodaysMenu(title: "Gujarati"),
      ],
    ).padSymm(vertical: 15);
  }
}
