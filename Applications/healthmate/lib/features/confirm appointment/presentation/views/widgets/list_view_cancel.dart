import 'package:flutter/material.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';

class ListViewCancel extends StatelessWidget {
  const ListViewCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 32,
        ),
        padding: const EdgeInsets.all(0),
        itemCount: 10,
        itemBuilder: (context, index) => CardConfirm(
          statecontainer: 'Canceled',
          appointmentDetails: AppointmentDetails(
            appointmentId: 1,
            doctorName: 'Dr. ahmed',
            appointmentDate: '2023-10-01',
            appointmentTime: '15:00:00',
            specialization: 'Specialization example',
            doctorImage: 'dsa',
          ),
          showbutton: false,
        ),
      ),
    );
  }
}
