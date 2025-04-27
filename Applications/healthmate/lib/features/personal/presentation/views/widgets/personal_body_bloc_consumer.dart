import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/personal/presentation/manager/cubit/getpersonalinfo_cubit.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/personal_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalBodyBlocConsumer extends StatelessWidget {
  const PersonalBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetpersonalinfoCubit, GetpersonalinfoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is GetpersonalinfoLoading,
          child: PersonalScreenBody(),
        );
      },
    );
  }
}
