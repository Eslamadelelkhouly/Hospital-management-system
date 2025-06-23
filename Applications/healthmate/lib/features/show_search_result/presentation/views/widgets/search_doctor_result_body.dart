import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/search/presentation/views/widgets/custom_grid_view_card_search.dart';

class SearchDoctorResultBody extends StatelessWidget {
  const SearchDoctorResultBody({super.key});

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
            const CustomAppBar(
              title: 'All doctors',
              stateicon: true,
            ),
            24.verticalSpace,
            Expanded(child: CustomGridViewCardSearch())
          ],
        ),
      ),
    );
  }
}
