import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';

class SechduleScreenBody extends StatelessWidget {
  const SechduleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.verticalSpace,
        CustomAppBar(title: 'Choose a date'),
        CustomCelender(),
      ],
    );
  }
}
