import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_button_confirmation.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_list_tiel_confirm_card.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/date_and_time_row_card_confirm.dart';
import 'package:intl/intl.dart';

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
    DateTime dateTime = DateTime.parse(widget.appointmentDetails.appointmentDate);
    String formated = DateFormat('dd MMM, yyyy').format(dateTime);
    return formated; 
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
            child:  Padding(
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
                    onPressed: () {},
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
  }
}
