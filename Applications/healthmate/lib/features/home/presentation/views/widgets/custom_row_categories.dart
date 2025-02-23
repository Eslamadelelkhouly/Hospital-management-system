import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/home/presentation/views/widgets/card_categories.dart';

class CustomRowCategories extends StatelessWidget {
  const CustomRowCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 326,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardCategories(
            text: 'Lab test',
            image: labtesticon,
          ),
          CardCategories(
            text: 'Emergency',
            image: emergencyicon,
          ),
          CardCategories(
            text: 'Pharmacy',
            image: pharmacyicon,
          ),
        ],
      ),
    );
  }
}
