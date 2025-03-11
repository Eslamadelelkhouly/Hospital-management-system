import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/container_time.dart';

class RowContainerTime extends StatelessWidget {
  const RowContainerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        25.horizontalSpace,
        ContainerTime(),
        ContainerTime(),
        ContainerTime(),
        ContainerTime(),
      ],
    );
  }
}
