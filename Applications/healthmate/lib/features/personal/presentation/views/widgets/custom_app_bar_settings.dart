import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class AppBarSetting extends StatelessWidget {
  const AppBarSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        Text(
          'My profile',
          style: StylingSystem.textStyle24bold,
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
          icon: ImageIcon(
            AssetImage(settingicon),
            color: ColorSystem.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
