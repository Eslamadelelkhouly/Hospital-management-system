import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:intl/intl.dart';

class TitleCardConfirm extends StatefulWidget {
  const TitleCardConfirm({super.key, required this.date});
  final String date;

  @override
  State<TitleCardConfirm> createState() => _TitleCardConfirmState();
}

class _TitleCardConfirmState extends State<TitleCardConfirm> {
  String get formattedDate {
    DateTime dateTime = DateTime.parse(widget.date);
    String formated = DateFormat('dd MMM, yyyy').format(dateTime);
    return formated; 
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today’s Appointments',
          style: StylingSystem.textStyle18semibold,
        ),
        Text(
          '$formattedDate',
          style: StylingSystem.textStyleSign12
              .copyWith(color: ColorSystem.kPrimaryColor),
        ),
      ],
    );
  }
}
