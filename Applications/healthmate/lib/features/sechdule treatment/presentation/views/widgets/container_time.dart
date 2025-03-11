import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerTime extends StatefulWidget {
  const ContainerTime({super.key});

  @override
  State<ContainerTime> createState() => _ContainerTimeState();
}

Color backgroundcolor = ColorSystem.kPrimaryColorLight;
Color textColor = Colors.black;

class _ContainerTimeState extends State<ContainerTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: GestureDetector(
        onTap: () {
          if (backgroundcolor == ColorSystem.kPrimaryColorLight) {
            setState(() {
              backgroundcolor = ColorSystem.kPrimaryColor;
              textColor = Colors.white;
            });
          } else {
            setState(() {
              backgroundcolor = ColorSystem.kPrimaryColorLight;
              textColor = Colors.black;
            });
          }
        },
        child: Container(
          width: 78.r,
          height: 31.r,
          decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              '08:00',
              style: StylingSystem.textStyle14Medium.copyWith(
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
