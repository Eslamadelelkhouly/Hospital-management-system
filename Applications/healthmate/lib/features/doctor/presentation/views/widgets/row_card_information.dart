import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/card_information.dart';

class RowCardInformation extends StatelessWidget {
  const RowCardInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CardInformation(
          text: 'Patients',
          imageUrl: people,
          subtext: '500',
        ),
        SizedBox(
          width: 5,
        ),
        CardInformation(
          text: 'Experience',
          imageUrl: people,
          subtext: '4 years',
        ),
        SizedBox(
          width: 5,
        ),
        CardInformation(
          text: 'Rating',
          imageUrl: stargoldicon,
          subtext: '4.5',
        ),
      ],
    );
  }
}
