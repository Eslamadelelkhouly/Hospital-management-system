import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/search/manager/cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/search/presentation/views/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowDoctorCubit(),
      child: Scaffold(
        body: SearchScreenBody(),
      ),
    );
  }
}
