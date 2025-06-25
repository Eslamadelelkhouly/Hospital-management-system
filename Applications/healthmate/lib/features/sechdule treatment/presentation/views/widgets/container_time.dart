import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerTime extends StatefulWidget {
  final bool isSelected; 
  final VoidCallback onTap;
  final String time; 

  const ContainerTime({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.time,
  });

  @override
  State<ContainerTime> createState() => _ContainerTimeState();
}

class _ContainerTimeState extends State<ContainerTime> {
  Color backgroundcolor = ColorSystem.kPrimaryColorLight;
  Color textColor = Colors.black;

  @override
  void didUpdateWidget(covariant ContainerTime oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected) {
      backgroundcolor = ColorSystem.kPrimaryColor;
      textColor = Colors.white;
    } else {
      backgroundcolor = ColorSystem.kPrimaryColorLight;
      textColor = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: GestureDetector(
        onTap:
            widget.onTap, // عند الضغط، يتم تنفيذ الـ onTap الذي مررته من خارج
        child: Container(
          width: 78.r,
          height: 31.r,
          decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              widget.time,
              style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
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
