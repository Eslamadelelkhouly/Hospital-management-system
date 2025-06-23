import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/UpcomingCubit/upcoming_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';

class ListViewUpComing extends StatefulWidget {
  const ListViewUpComing({super.key});

  @override
  State<ListViewUpComing> createState() => _ListViewUpComingState();
}

class _ListViewUpComingState extends State<ListViewUpComing> {
  @override
  void initState() {
    super.initState();
    context.read<UpcomingCubit>().getUpcomingappointment();
  }

  AppointmentDetails message = AppointmentDetails(
    appointmentId: 1,
    doctorName: 'Dr. Smith',
    appointmentDate: '2023-10-01',
    appointmentTime: '10:00 AM',
    specialization: '',
    doctorImage: '',
  );

  UpcomingAppointment upcomingAppointment = UpcomingAppointment(
    appointmentDetails: [],
    message: '',
    status: 0,
  );

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<UpcomingCubit, UpcomingState>(
        listener: (context, state) {
          if (state is UpcomingError) {
            error = state.error;
          } else if (state is UpcomingSuccess) {
            upcomingAppointment = state.upcomingAppointment;
          }
        },
        builder: (context, state) {
          if (state is UpcomingLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorSystem.kPrimaryColor,
              ),
            );
          } else if (state is UpcomingError) {
            return Center(
              child: Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (upcomingAppointment.appointmentDetails.isEmpty) {
            return const Center(
              child: Text(
                'No upcoming appointments found.',
                style: TextStyle(fontSize: 16),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              padding: const EdgeInsets.all(0),
              itemCount: upcomingAppointment.appointmentDetails.length,
              itemBuilder: (context, index) => CardConfirm(
                statecontainer: 'Upcoming',
                appointmentDetails:
                    upcomingAppointment.appointmentDetails[index],
                showbutton: true,
              ),
            );
          }
        },
      ),
    );
  }
}
