import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/favoruits/presentation/views/manager/get_favourite_doctor_cubit/getfavouritedoctor_cubit.dart';
import 'package:healthmate/features/favoruits/presentation/views/widgets/favourite_body_screen.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_view_container_doctor.dart';

class FavouritsScreen extends StatelessWidget {
  const FavouritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetfavouritedoctorCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FavouriteBodyScreen(),
      ),
    );
  }
}
