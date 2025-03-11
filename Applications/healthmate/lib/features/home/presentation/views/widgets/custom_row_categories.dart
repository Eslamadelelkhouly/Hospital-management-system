import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/router_screens.dart';
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
            onTap: () {
              GoRouter.of(context).push(Routing.klabtestscreen);
            },
            text: 'Lab test',
            image: labtesticon,
          ),
          CardCategories(
            onTap: (){},
            text: 'Emergency',
            image: emergencyicon,
          ),
          CardCategories(
            onTap: (){},
            text: 'Pharmacy',
            image: pharmacyicon,
          ),
        ],
      ),
    );
  }
}
