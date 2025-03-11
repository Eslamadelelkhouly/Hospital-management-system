import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/custom_list_tiel_lab_test.dart';

class ListViewCardLabTest extends StatelessWidget {
  const ListViewCardLabTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400.r,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomListTielLabTest();
        },
      ),
    );
  }
}
