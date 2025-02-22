import 'package:flutter/material.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChangePasswordBody(),
    );
  }
}
