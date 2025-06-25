import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/settings/presentation/manager/Logout%20cubit/logout_cubit.dart';
import 'package:healthmate/features/settings/presentation/views/widgets/setting_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingBlocConsumer extends StatelessWidget {
  const SettingBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogoutLoading,
          child: SettingScreenBody(),
        );
      },
    );
  }
}
