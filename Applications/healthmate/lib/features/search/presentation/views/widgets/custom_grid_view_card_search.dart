import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_search.dart';

class CustomGridViewCardSearch extends StatelessWidget {
  const CustomGridViewCardSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10.r,
        mainAxisExtent: 200.r,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ContainerSearch();
      },
    );
  }
}
