import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/features/home/presentation/views/widgets/container_doctor.dart';

class ContainerListViewFavourite extends StatelessWidget {
  const ContainerListViewFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          // child: ContainerDoctor(
          // ),
        );
      },
    );
  }
}