import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          children: [
            30.verticalSpace,
            CustomAppBar(title: 'All doctors'),
            24.verticalSpace,
            CustomSearchTextField(),
            24.verticalSpace,
            Expanded(child: CustomGridViewCardSearch())
          ],
        ),
      ),
    );
  }
}
