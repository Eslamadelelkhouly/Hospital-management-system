import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_view_container_doctor.dart';

class FavouritsScreen extends StatelessWidget {
  const FavouritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: const Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomAppBar(
              title: 'My favorite list',
              stateicon: false,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: CustomListViewContainerDoctor(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
