import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/heartdisease/data/manager/cubit/heart_disease_cubit.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/heart_disease_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HeartDiseaseBlocConsumerBody extends StatelessWidget {
  const HeartDiseaseBlocConsumerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HeartDiseaseCubit, HeartDiseaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is HeartDiseaseLoading ? true : false,
          progressIndicator: const CircularProgressIndicator(
            color: ColorSystem.kPrimaryColor,
          ),
          child: const HeartDiseaseBody(),
        );
      },
    );
  }
}
