import 'package:flutter/material.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_tiel.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomListTiel(),
          ],
        ),
      ),
    );
  }
}
