import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/sechdule%20treatment/data/manager/cubit/showavailabletime_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/sechdule_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ShecduleScreenBodyConsumer extends StatelessWidget {
  const ShecduleScreenBodyConsumer({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowavailabletimeCubit, ShowavailabletimeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ShowavailabletimeLoading ? true : false,
          child: SechduleScreenBody(
            doctor: doctor,
          ),
        );
      },
    );
  }
}
