import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomListTielLabTest extends StatelessWidget {
  const CustomListTielLabTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            'Complete Blood Count (CBC)',
            style: StylingSystem.textStyleSign12,
          ),
          trailing: Text(
            '200EG',
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
