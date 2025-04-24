import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/container_personal_info.dart';

class RowContainerInfoPersonal extends StatelessWidget {
  const RowContainerInfoPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerPersonalInfo(
          text1: 'Height',
          text2: '160cm',
        ),
        ContainerPersonalInfo(
          text1: 'Weight',
          text2: '64kg',
        ),
        ContainerPersonalInfo(
          text1: 'Age',
          text2: '39',
        ),
      ],
    );
  }
}
