import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomListTielLabTest extends StatelessWidget {
  const CustomListTielLabTest({
    super.key,
    required this.text,
    required this.price,
  });

  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            '${text}',
            style: ResponsiveStylingSystem.textStyleSign12(context),
          ),
          trailing: Text(
            '${price}',
            style: ResponsiveStylingSystem.textStyleSign12(context),
          ),
        ),
        Divider(
          indent: 15,
          endIndent: 20,
        ),
      ],
    );
  }
}
