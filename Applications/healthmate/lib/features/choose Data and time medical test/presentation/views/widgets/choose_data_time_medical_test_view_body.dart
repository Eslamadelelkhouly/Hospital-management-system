import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/manager/cubit/get_medical_info_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';

class ChooseDataTimeMedicalTestViewBody extends StatelessWidget {
  const ChooseDataTimeMedicalTestViewBody({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: true,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop(context);
                  context.read<GetMedicalInfoCubit>().getMedicalinfo(id: id);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Choose Date and Time',
                  style: StylingSystem.textStyle24bold,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        CustomCelender(onChanged: (String) {}),
      ],
    );
  }
}
