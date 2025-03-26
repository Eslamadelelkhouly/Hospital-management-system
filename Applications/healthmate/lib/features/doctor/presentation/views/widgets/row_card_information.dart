import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/card_information.dart';

class RowCardInformation extends StatelessWidget {
  const RowCardInformation({super.key, required this.patient, required this.experience, required this.rating});
  final String patient , experience , rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CardInformation(
          text: 'Patients',
          imageUrl: people,
          subtext: patient,
        ),
        SizedBox(
          width: 5,
        ),
        CardInformation(
          text: 'Experience',
          imageUrl: people,
          subtext: experience,
        ),
        SizedBox(
          width: 5,
        ),
        CardInformation(
          text: 'Rating',
          imageUrl: stargoldicon,
          subtext: rating,
        ),
      ],
    );
  }
}
