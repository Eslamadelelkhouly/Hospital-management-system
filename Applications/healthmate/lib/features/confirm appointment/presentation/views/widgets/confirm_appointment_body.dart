import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/custom_app_bar_settings.dart';

class ConfirmAppointmentBody extends StatelessWidget {
  const ConfirmAppointmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Confirm Appointment',
            stateicon: true,
          ),
          SizedBox(
            height: 32,
          ),
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          CardConfirm(),
        ],
      ),
    );
  }
}
