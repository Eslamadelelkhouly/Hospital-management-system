import 'package:flutter/material.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_search.dart';

class CustomGridCardResultSearch extends StatelessWidget {
  const CustomGridCardResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container();
        });
  }
}
