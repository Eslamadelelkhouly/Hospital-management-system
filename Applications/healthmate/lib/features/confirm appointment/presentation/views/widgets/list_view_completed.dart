import 'package:flutter/material.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';

class ListViewCompleted extends StatelessWidget {
  const ListViewCompleted({super.key});

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
          appointmentDetails: AppointmentDetails(
            appointmentId: index + 1,
            doctorName: 'Dr. ${index + 1}',
            appointmentDate: '2023-10-0${index + 1}',
            appointmentTime: '${10 + index}:00 AM',
            specialization: 'Specialization ${index + 1}',
            doctorImage: 'https://example.com/doctor${index + 1}.jpg',
          ),
          showbutton: false,
        ),
      ),
    );
  }
}
