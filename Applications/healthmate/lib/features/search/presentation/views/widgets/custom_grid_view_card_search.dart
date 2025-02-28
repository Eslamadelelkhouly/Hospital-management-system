import 'package:flutter/material.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_search.dart';

class CustomGridViewCardSearch extends StatelessWidget {
  const CustomGridViewCardSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ContainerSearch();
      },
    );
  }
}
