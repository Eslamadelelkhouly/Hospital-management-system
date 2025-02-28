import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';

class CustomContainerDoctorPhotoPersonal extends StatelessWidget {
  const CustomContainerDoctorPhotoPersonal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 132,
        height: 132,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(66),
          child: Image.asset(
            doctorphoto1,
            fit: BoxFit.cover,
          ),
        ));
  }
}
