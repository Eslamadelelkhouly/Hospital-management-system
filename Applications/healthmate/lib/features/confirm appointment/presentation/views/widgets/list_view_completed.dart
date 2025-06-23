import 'package:flutter/material.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';

class ListViewCompleted extends StatelessWidget {
  ListViewCompleted({super.key});
  late UpcomingAppointment upcomingAppointment = UpcomingAppointment(
    appointmentDetails: [
      AppointmentDetails(
        appointmentId: 1,
        doctorImage:
            'https://wellingtonregional.com/wp-content/uploads/2022/05/doctors_visit.jpg',
        doctorName: 'Dr. Ahmed',
        specialization: 'Cardiology',
        appointmentDate: '2025-07-01',
        appointmentTime: '10:00:00 AM',
      ),
      AppointmentDetails(
        appointmentId: 2,
        doctorImage:
            'https://static.vecteezy.com/system/resources/previews/026/375/249/non_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
        doctorName: 'Dr. Wael',
        specialization: 'Dermatology',
        appointmentDate: '2025-07-02',
        appointmentTime: '11:30:00 AM',
      ),
      AppointmentDetails(
        appointmentId: 3,
        doctorImage:
            'https://www.costamedicalservices.com/wp-content/uploads/2023/11/portrait-attractive-male-doctor-1024x1536.jpg',
        doctorName: 'Dr. Youssef',
        specialization: 'Neurology',
        appointmentDate: '2025-07-03',
        appointmentTime: '09:00:00 AM',
      ),
    ],
    message: 'Upcoming Appointments loaded successfully.',
    status: 200,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 32,
        ),
        padding: const EdgeInsets.all(0),
        itemCount: upcomingAppointment.appointmentDetails.length,
        itemBuilder: (context, index) => CardConfirm(
          statecontainer: 'Completed',
          showbutton: false,
          appointmentDetails: upcomingAppointment.appointmentDetails[index],
        ),
      ),
    );
  }
}
