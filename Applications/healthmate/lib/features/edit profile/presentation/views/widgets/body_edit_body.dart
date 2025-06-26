import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/circle_image_container.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/form_edit_profile.dart';

class BodyEditBody extends StatelessWidget {
  const BodyEditBody({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CustomAppBar(
            title: 'Personal information',
            stateicon: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          FormEditProfile(
            id: id,
          ),
        ],
      ),
    );
  }
}
