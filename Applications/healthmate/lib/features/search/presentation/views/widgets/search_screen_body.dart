import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_search.dart';
import 'package:healthmate/features/search/presentation/views/widgets/custom_grid_view_card_search.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(title: 'All doctors'),
            SizedBox(
              height: 24,
            ),
            CustomSearchTextField(),
            SizedBox(
              height: 24,
            ),
            Expanded(child: CustomGridViewCardSearch())
          ],
        ),
      ),
    );
  }
}
