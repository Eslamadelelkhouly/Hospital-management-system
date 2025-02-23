import 'package:flutter/material.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_tiel.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_view_container_doctor.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_row_categories.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/home/presentation/views/widgets/row_text_home.dart';

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
            SizedBox(
              height: 16,
            ),
            CustomSearchTextField(),
            SizedBox(
              height: 16,
            ),
            CustomRowCategories(),
            SizedBox(
              height: 16,
            ),
            RowTextHome(),
            Expanded(child: CustomListViewContainerDoctor()),
          ],
        ),
      ),
    );
  }
}
