import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/circule_perosnal_photo.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/custom_app_bar_settings.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/personal_field.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/row_container_info_personal.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            30.verticalSpace,
            AppBarSetting(),
            30.verticalSpace,
            CirculePersonalPhoto(),
            16.verticalSpace,
            Text(
              'Mohamed ahmed',
              style: StylingSystem.textStyle18semibold,
            ),
            Text(
              'Active since - Jan 2025',
              style: StylingSystem.textStyle14Medium.copyWith(
                color: ColorSystem.kGrayColor2,
                fontWeight: FontWeight.w600,
              ),
            ),
            24.verticalSpace,
            RowContainerInfoPersonal(),
            16.verticalSpace,
            Row(
              children: [
                Text(
                  'Personal Information',
                  style: StylingSystem.textStyle20semibold,
                ),
              ],
            ),
            PersonalField(),
          ],
        ),
      ),
    );
  }
}

