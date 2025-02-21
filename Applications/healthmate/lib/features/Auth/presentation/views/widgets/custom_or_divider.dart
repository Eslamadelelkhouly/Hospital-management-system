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
          Expanded(
            child: Divider(),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'or',
            style: StylingSystem.textStyle14Medium,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
