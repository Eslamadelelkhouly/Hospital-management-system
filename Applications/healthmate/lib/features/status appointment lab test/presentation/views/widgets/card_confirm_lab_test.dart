import 'package:flutter/material.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/container_state_booking.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/title_card_confirm.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/models/medical_test_state.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/body_card_confirm_lab_test.dart';

class CardConfirmLabTest extends StatelessWidget {
  const CardConfirmLabTest(
      {super.key,
      required this.statebutton,
      required this.appointmentDetail,
      required this.titleCard});
  final bool statebutton;
  final AppointmentDetail appointmentDetail;
  final String titleCard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TitleCardConfirm(
            date: '${appointmentDetail.appointmentDate}',
          ),
          SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              BodyCardConfirmLabTest(
                id: '${appointmentDetail.appointmentId}',
                date: '${appointmentDetail.appointmentDate}',
                time: '${appointmentDetail.appointmentTime}',
                title: '${appointmentDetail.testName}',
                showbutton: statebutton,
              ),
              Positioned(
                right: 12,
                top: 16,
                child: Containerstatebooking(
                  textstatecontainer: '${titleCard}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
