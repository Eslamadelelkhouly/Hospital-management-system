import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/home/presentation/manager/get_doctor_cubit/gettopdoctor_cubit.dart';
import 'package:healthmate/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeScreenBlocConsumer extends StatelessWidget {
  const HomeScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GettopdoctorCubit, GettopdoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is GettopdoctorLoading,
          child: HomeScreenBody(),
        );
      },
    );
  }
}
