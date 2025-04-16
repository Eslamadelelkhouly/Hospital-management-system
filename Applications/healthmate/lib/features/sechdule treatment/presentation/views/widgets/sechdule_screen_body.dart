import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/row_container_time.dart';

class SechduleScreenBody extends StatelessWidget {
  const SechduleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.verticalSpace,
          const CustomAppBar(title: 'Choose a date'),
          30.verticalSpace,
          const CustomCelender(),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              25.horizontalSpace,
              Text(
                'Available time',
                style: StylingSystem.textStyle20semibold,
              ),
            ],
          ),
          8.verticalSpace,
          const RowContainerTime(),
          8.verticalSpace,
          const RowContainerTime(),
          35.verticalSpace,
          CustomButton(
            onPressed: () {},
            text: 'Make Appointment',
            width: ScreenUtil.defaultSize.width * 0.9,
            height: 48.r,
            textColor: ColorSystem.kbtnColorWhite,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
