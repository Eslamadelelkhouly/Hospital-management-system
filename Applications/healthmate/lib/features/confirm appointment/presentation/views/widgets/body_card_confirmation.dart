import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/DeleteAppointmentCubit/delete_appointment_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/manager/UpcomingCubit/upcoming_cubit.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_button_confirmation.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_list_tiel_confirm_card.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/date_and_time_row_card_confirm.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BodyCardConfirmation extends StatefulWidget {
  const BodyCardConfirmation({
    super.key,
    required this.showbutton,
    required this.appointmentDetails,
  });

  final bool showbutton;
  final AppointmentDetails appointmentDetails;

  @override
  State<BodyCardConfirmation> createState() => _BodyCardConfirmationState();
}

class _BodyCardConfirmationState extends State<BodyCardConfirmation> {
  String get formattedDate {
    DateTime dateTime =
        DateTime.parse(widget.appointmentDetails.appointmentDate);
    String formated = DateFormat('dd MMM, yyyy').format(dateTime);
    return formated;
  }

  void _showSuccessDialog(BuildContext context, String text, bool isError) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Image.asset(isError ? failureimage : sucessimage, scale: 1.5),
              SizedBox(height: 16),
              Text(text, style: StylingSystem.textStyle17semibold),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorHighLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: BlocConsumer<DeleteAppointmentCubit, DeleteAppointmentState>(
        listener: (context, state) {
          if (state is DeleteAppointmentSuccess) {
            _showSuccessDialog(context, state.message, false);
            Navigator.pop(context);
          } else if (state is DeleteAppointmentFailure) {
            _showSuccessDialog(context, state.error, true);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is DeleteAppointmentLoading,
            progressIndicator: const CircularProgressIndicator(
              color: ColorSystem.kPrimaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomListTielConfirmCard(
                  imgUrl: widget.appointmentDetails.doctorImage,
                  name: widget.appointmentDetails.doctorName,
                  special: widget.appointmentDetails.specialization,
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorSystem.kPrimaryColorLight,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DateAndTimeRowCardConfirm(
                      date: formattedDate,
                      time: widget.appointmentDetails.appointmentTime,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (widget.showbutton)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonConfirmation(
                          onPressed: () {
                            context
                                .read<DeleteAppointmentCubit>()
                                .deleteAppointment(
                                  apointmentId: widget
                                      .appointmentDetails.appointmentId
                                      .toString(),
                                );
                            context
                                .read<UpcomingCubit>()
                                .getUpcomingappointment();
                            
                          },
                          text: 'Cancel',
                          background: ColorSystem.kPrimaryColorHighLight,
                          textColor: ColorSystem.kPrimaryColor,
                          borderColor: ColorSystem.kPrimaryColor,
                        ),
                        CustomButtonConfirmation(
                          onPressed: () {},
                          text: 'Payement',
                          background: ColorSystem.kPrimaryColor,
                          textColor: Colors.white,
                          borderColor: ColorSystem.kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
