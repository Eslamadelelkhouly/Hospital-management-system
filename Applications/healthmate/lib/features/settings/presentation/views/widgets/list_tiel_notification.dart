import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ListTielNotification extends StatefulWidget {
  const ListTielNotification({super.key});

  @override
  State<ListTielNotification> createState() => _ListTielNotificationState();
}

class _ListTielNotificationState extends State<ListTielNotification> {
  bool switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorHighLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        leading: const ImageIcon(
          AssetImage(notificationicon),
          color: Colors.black,
        ),
        title: Text(
          'Notification',
          style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
            color: Color(0xff83818E),
          ),
        ),
        trailing: CupertinoSwitch(
          activeColor: ColorSystem.kPrimaryColor,
          value: switchvalue,
          onChanged: (value) {
            setState(() {
              this.switchvalue = value;
            });
          },
        ),
      ),
    );
    ;
  }
}
