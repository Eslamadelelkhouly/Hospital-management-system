import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:intl/intl.dart';

class DateAndTimeRowCardConfirm extends StatefulWidget {
  const DateAndTimeRowCardConfirm({
    super.key,
    required this.date,
    required this.time,
  });
  final String date, time;

  @override
  State<DateAndTimeRowCardConfirm> createState() =>
      _DateAndTimeRowCardConfirmState();
}

class _DateAndTimeRowCardConfirmState extends State<DateAndTimeRowCardConfirm> {
  String get formattedTime {
    DateTime dateTime = DateFormat("HH:mm:ss").parse(widget.time);
    String formattedTime = DateFormat("hh:mm a").format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          celendericon,
          color: ColorSystem.kPrimaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          '${widget.date}',
          style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
            color: ColorSystem.kPrimaryColor,
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 20,
          color: Colors.white,
        ),
        const Spacer(),
        Image.asset(
          clock,
          color: ColorSystem.kPrimaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          '${formattedTime}',
          style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
            color: ColorSystem.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
