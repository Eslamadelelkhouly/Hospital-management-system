import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/settings/presentation/manager/Logout%20cubit/logout_cubit.dart';
import 'package:healthmate/features/settings/presentation/views/widgets/setting_screen_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SettingScreenBody(),
      ),
    );
  }
}
