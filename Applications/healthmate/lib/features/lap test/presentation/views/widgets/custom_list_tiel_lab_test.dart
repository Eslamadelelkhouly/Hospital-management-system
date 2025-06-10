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
            style: StylingSystem.textStyleSign12,
          ),
          trailing: Text(
            '${price}',
            style: StylingSystem.textStyleSign12,
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
