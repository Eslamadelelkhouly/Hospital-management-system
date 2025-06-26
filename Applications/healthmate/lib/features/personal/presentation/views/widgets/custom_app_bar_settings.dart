import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';

class AppBarSetting extends StatelessWidget {
  const AppBarSetting({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).go(Routing.khomescreen);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        Text(
          'My profile',
          style: ResponsiveStylingSystem.textStyle24bold(context),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              Routing.ksetting,
              extra: id,
            );
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
