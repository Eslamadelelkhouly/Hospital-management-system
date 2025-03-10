import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/container_time.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';

class SechduleScreenBody extends StatelessWidget {
  const SechduleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.verticalSpace,
          CustomAppBar(title: 'Choose a date'),
          30.verticalSpace,
          CustomCelender(),
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
          ContainerTime(),
        ],
      ),
    );
  }
}
