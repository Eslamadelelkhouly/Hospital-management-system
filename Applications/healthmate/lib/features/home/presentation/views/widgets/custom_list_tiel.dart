import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_sub_title_list_tiel.dart';

class CustomListTiel extends StatelessWidget {
  const CustomListTiel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(personal),
      title: Text(
        'Mohamed ahmed',
        style: StylingSystem.textStyle18semibold,
      ),
      subtitle: CustomSubtitleListTiel(),
      trailing: IconButton(
        onPressed: () {},
        icon: ImageIcon(
          AssetImage(notificationicon),
          color: ColorSystem.kPrimaryColor,
        ),
      ),
    );
  }
}
