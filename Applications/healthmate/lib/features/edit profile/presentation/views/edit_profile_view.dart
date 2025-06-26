import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/features/edit%20profile/presentation/manager/edit%20profile%20cubit/edit_profile_cubit.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/edit_profile_bloc_consumer.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    String id = GoRouterState.of(context).extra as String;
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: EditProfileBlocConsumer(
          id: id,
        ),
      ),
    );
  }
}
