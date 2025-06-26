import 'package:flutter/material.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const EditProfileViewBody(),
    );
  }
}