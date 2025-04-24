import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCelender extends StatefulWidget {
  const CustomCelender({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;
  @override
  State<CustomCelender> createState() => _CustomCelenderState();
}

class _CustomCelenderState extends State<CustomCelender> {
  DateTime datatimenow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void _onSelectedDat(DateTime day, DateTime focusedDay) {
      setState(() {
        datatimenow = day;
      });
      final formattedDate = DateFormat('yyyy-MM-dd').format(day);
      setState(() {
        widget.onChanged(formattedDate);
      });
      log(formattedDate);
    }

    return Container(
      width: ScreenUtil().screenWidth * 0.8,
      decoration: BoxDecoration(
        color: ColorSystem.kbtnColorWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TableCalendar(
        locale: 'en_US',
        focusedDay: datatimenow,
        availableGestures: AvailableGestures.all,
        calendarStyle: CalendarStyle(
          tablePadding: const EdgeInsets.all(0),
          defaultDecoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
          ),
          selectedDecoration: BoxDecoration(
            color: ColorSystem.kPrimaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          selectedTextStyle: GoogleFonts.inter(
            fontSize: 15.sp,
            color: ColorSystem.kbtnColorWhite,
          ),
          todayDecoration: BoxDecoration(
            color: ColorSystem.kPrimaryColorLight,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          todayTextStyle: GoogleFonts.inter(
            fontSize: 15.sp,
            color: ColorSystem.kbtnColorWhite,
          ),
        ),
        selectedDayPredicate: (day) => isSameDay(day, datatimenow),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: GoogleFonts.inter(
            fontSize: 15.sp,
          ),
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        calendarFormat: CalendarFormat.month,
        onDaySelected: _onSelectedDat,
        enabledDayPredicate: (day) {
          final now = DateTime.now();
          return !day.isBefore(DateTime(now.year, now.month, now.day));
        },
      ),
    );
  }
}
