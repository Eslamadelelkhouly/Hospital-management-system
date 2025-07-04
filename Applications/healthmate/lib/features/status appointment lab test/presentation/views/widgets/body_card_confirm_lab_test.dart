import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_button_confirmation.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/date_and_time_row_card_confirm.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/cancel_medical_test_cubit/cancel_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/upcoming_medical_test_cubit/upcoming_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/custom_lis_tiel_confirm_card_lab_test.dart';

class BodyCardConfirmLabTest extends StatefulWidget {
  const BodyCardConfirmLabTest(
      {super.key,
      required this.showbutton,
      required this.title,
      required this.time,
      required this.date,
      required this.id});

  final bool showbutton;
  final String title;
  final String time;
  final String date;
  final String id;
  @override
  State<BodyCardConfirmLabTest> createState() => _BodyCardConfirmLabTestState();
}

class _BodyCardConfirmLabTestState extends State<BodyCardConfirmLabTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorHighLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomLisTielConfirmCardLabTest(
            name: '${widget.title}',
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
                date: '${widget.date}',
                time: '${widget.time}',
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
                          .read<CancelMedicalTestCubit>()
                          .cancelMedicalTest(appointmentId: widget.id);
                      context
                          .read<UpcomingMedicalTestCubit>()
                          .getUpcomingMedicalTest();
                    },
                    text: 'Cancel',
                    background: ColorSystem.kPrimaryColorHighLight,
                    textColor: ColorSystem.kPrimaryColor,
                    borderColor: ColorSystem.kPrimaryColor,
                  ),
                  CustomButtonConfirmation(
                    onPressed: () {},
                    text: 'Checkout',
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
  }
}
