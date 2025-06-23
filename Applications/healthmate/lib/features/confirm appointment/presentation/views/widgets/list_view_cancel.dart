import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/get_cancel_cubit/cancel_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';

class ListViewCancel extends StatefulWidget {
  const ListViewCancel({super.key});

  @override
  State<ListViewCancel> createState() => _ListViewCancelState();
}

class _ListViewCancelState extends State<ListViewCancel> {
  UpcomingAppointment upcomingAppointment = UpcomingAppointment(
    appointmentDetails: [],
    message: '',
    status: 0,
  );
  String error = '';

  @override
  void initState() {
    super.initState();
    context.read<CancelCubit>().getCancelAppointment();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<CancelCubit, CancelState>(
        listener: (context, state) {
          if (state is CancelFailure) {
            error = state.error;
          } else if (state is CancelSuccess) {
            upcomingAppointment = state.upcomingAppointment;
          }
        },
        builder: (context, state) {
          if (state is CancelLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorSystem.kPrimaryColor,
              ),
            );
          } else if (state is CancelFailure) {
            return Center(
              child: Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (upcomingAppointment.appointmentDetails.isEmpty) {
            return const Center(
              child: Text(
                'No cancelled appointments found.',
                style: TextStyle(fontSize: 16),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              padding: const EdgeInsets.all(0),
              itemCount: upcomingAppointment.appointmentDetails.length,
              itemBuilder: (context, index) => CardConfirm(
                statecontainer: 'Canceled',
                appointmentDetails:
                    upcomingAppointment.appointmentDetails[index],
                showbutton: false,
              ),
            );
          }
        },
      ),
    );
  }
}
