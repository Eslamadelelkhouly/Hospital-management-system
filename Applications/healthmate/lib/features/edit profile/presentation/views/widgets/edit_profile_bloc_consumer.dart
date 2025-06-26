import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/edit%20profile/presentation/manager/edit%20profile%20cubit/edit_profile_cubit.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileBlocConsumer extends StatelessWidget {
  const EditProfileBlocConsumer({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditProfileLoading ? true : false,
          child: EditProfileViewBody(
            id: id,
          ),
        );
      },
    );
  }
}
