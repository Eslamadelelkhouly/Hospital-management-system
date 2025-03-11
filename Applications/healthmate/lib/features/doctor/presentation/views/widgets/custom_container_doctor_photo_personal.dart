import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';

class CustomContainerDoctorPhotoPersonal extends StatelessWidget {
  const CustomContainerDoctorPhotoPersonal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 132.r,
        height: 132.r,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(66).r,
          child: Image.asset(
            doctorphoto1,
            fit: BoxFit.cover,
          ),
        ));
  }
}
