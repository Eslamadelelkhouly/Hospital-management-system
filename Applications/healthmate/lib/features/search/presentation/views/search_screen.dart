import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/search/manager/Show%20Doctor%20Cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/search/manager/cubit/get_doctor_by_name_cubit.dart';
import 'package:healthmate/features/search/presentation/views/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowDoctorCubit(),
        ),
        BlocProvider(
          create: (context) => GetDoctorByNameCubit(),
        ),
      ],
      child: Scaffold(
        body: SearchScreenBody(),
      ),
    );
  }
}
