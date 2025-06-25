import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data = GoRouterState.of(context).extra as Map<String,dynamic>;
    return Scaffold(
      body: ChangePasswordBody(
        otp:data['otp'] ,
        email: data['email'],
      ),
    );
  }
}
