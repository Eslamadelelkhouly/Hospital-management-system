import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 273,
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'or',
            style: ResponsiveStylingSystem.textStyle14bold(context),
          ),
          const SizedBox(
            width: 8,
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
