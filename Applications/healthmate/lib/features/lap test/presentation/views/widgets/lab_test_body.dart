import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/list_view_card_lab_test.dart';

class LabTestBody extends StatelessWidget {
  const LabTestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            CustomAppBar(title: 'Lab Test'),
            30.verticalSpace,
            CustomSearchTextField(),
            16.verticalSpace,
            Row(
              children: [
                13.horizontalSpace,
                Text(
                  'Book Lab Tests',
                  style: StylingSystem.textStyle20semibold,
                ),
              ],
            ),
            8.verticalSpace,
            ListViewCardLabTest(),
            40.verticalSpace,
            CustomButton(
              onPressed: () {},
              text: 'Make Appointment',
              width: 362.r,
              height: 48,
              textColor: ColorSystem.kbtnColorWhite,
              backgrounColor: ColorSystem.kPrimaryColor,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
