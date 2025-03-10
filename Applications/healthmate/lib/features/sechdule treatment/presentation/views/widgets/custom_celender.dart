import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCelender extends StatelessWidget {
  CustomCelender({super.key});
  DateTime datatimenow = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
            ), // changes position of shadow
          ]),
      child: TableCalendar(
        locale: 'en_US',
        focusedDay: datatimenow,
        availableGestures: AvailableGestures.all,
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
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {},
      ),
    );
  }
}
