import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/card_information.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_list_tiel_doctor.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_card_information.dart';

class DoctorScreenBody extends StatelessWidget {
  const DoctorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(title: ''),
          SizedBox(
            height: 24,
          ),
          CustomCardDoctor(),
          SizedBox(
            height: 25,
          ),
          RowCardInformation(),
          SizedBox(
            height: 21,
          ),
        ],
      ),
    );
  }
}
