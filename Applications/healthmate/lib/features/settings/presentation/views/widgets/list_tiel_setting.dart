import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ListTielSetting extends StatelessWidget {
  const ListTielSetting({
    super.key,
    required this.title,
    required this.img,
    this.onTap,
  });
  final String title, img;
  final void Function()? onTap;
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
        leading: ImageIcon(
          AssetImage(img),
          color: Colors.black,
        ),
        title: Text(
          title,
          style: StylingSystem.textStyle16Medium.copyWith(
            color: const Color(0xff83818E),
          ),
        ),
        trailing: IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
