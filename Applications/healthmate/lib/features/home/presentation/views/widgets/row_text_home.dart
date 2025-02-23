import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class RowTextHome extends StatelessWidget {
  const RowTextHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top doctors',
            style: StylingSystem.textStyle20semibold,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See more',
              style: StylingSystem.textStyle14Medium.copyWith(
                color: ColorSystem.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
