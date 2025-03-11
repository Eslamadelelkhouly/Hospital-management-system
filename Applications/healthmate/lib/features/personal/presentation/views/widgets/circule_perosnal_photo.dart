import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CirculePersonalPhoto extends StatelessWidget {
  const CirculePersonalPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.r,
      height: 132.r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(70).r,
        child: Image.asset(
          'assets/images/personal.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
