import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/sechdule%20treatment/data/manager/appointment/appointment_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/data/manager/show_avliable_time/showavailabletime_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_model_request.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/row_container_time.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SechduleScreenBody extends StatefulWidget {
  const SechduleScreenBody({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<SechduleScreenBody> createState() => _SechduleScreenBodyState();
}

class _SechduleScreenBodyState extends State<SechduleScreenBody> {
  String date = '';
  String time = '';

  @override
  void initState() {
    super.initState();
    context
        .read<ShowavailabletimeCubit>()
        .showAvailableTime(doctorId: widget.doctor.id.toString());
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
    int id = widget.doctor.id;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state is appointmentSuccess) {
            _showSuccessDialog(
              context,
              state.appointmentResponse['message'],
              false,
            );
          }
          if (state is AppointmentError) {
            log('Error: in schdule ${state.errorMessage['message']}');
            _showSuccessDialog(
              context,
              state.errorMessage['message'],
              true,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AppointmentLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
                const CustomAppBar(
                  title: 'Choose a date',
                  stateicon: true,
                ),
                30.verticalSpace,
                CustomCelender(
                  onChanged: (value) {
                    log('Selected date: $value');
                    setState(() {
                      date = value;
                    });
                  },
                ),

                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    25.horizontalSpace,
                    Text('Available time',
                        style: StylingSystem.textStyle20semibold),
                  ],
                ),
                8.verticalSpace,

                /// الوقت
                RowContainerTime(
                  onChanged: (String value) {
                    log('Selected time: $value');
                    setState(() {
                      time = value;
                    });
                  },
                ),

                35.verticalSpace,
                CustomButton(
                  onPressed: () {
                    if (date.isEmpty || time.isEmpty) {
                      _showSuccessDialog(
                        context,
                        'Please choose date and time.',
                        true,
                      );
                      return;
                    }

                    final appointmentModelRequest = AppointmentModelRequest(
                      docId: id,
                      appointTime: time,
                      appointDate: date,
                    );

                    log("Date: ${appointmentModelRequest.appointDate}");
                    log("Time: ${appointmentModelRequest.appointTime}");
                    log("Doctor ID: ${appointmentModelRequest.docId}");

                    context.read<AppointmentCubit>().bookTreatment(
                          appointmentModelRequest: appointmentModelRequest,
                        );
                  },
                  text: 'Make Appointment',
                  width: ScreenUtil.defaultSize.width * 0.9,
                  height: 48.r,
                  textColor: ColorSystem.kbtnColorWhite,
                  backgrounColor: ColorSystem.kPrimaryColor,
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
