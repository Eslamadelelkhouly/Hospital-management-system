import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';

class RowTextHome extends StatelessWidget {
  const RowTextHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top doctors',
            style:ResponsiveStylingSystem.textStyle20semibold(context),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(Routing.ksearchscreen);
            },
            child: Text(
              'See more',
              style:ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
                color: ColorSystem.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
