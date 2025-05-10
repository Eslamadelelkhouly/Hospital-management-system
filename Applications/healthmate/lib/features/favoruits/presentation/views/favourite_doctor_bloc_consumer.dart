import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/favoruits/presentation/views/manager/get_favourite_doctor_cubit/getfavouritedoctor_cubit.dart';
import 'package:healthmate/features/favoruits/presentation/views/widgets/favourite_body_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FavouriteDoctorBlocConsumer extends StatelessWidget {
  const FavouriteDoctorBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetfavouritedoctorCubit, GetfavouritedoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is GetfavouritedoctorLoading,
          child: FavouriteBodyScreen(),
        );
      },
    );
  }
}
