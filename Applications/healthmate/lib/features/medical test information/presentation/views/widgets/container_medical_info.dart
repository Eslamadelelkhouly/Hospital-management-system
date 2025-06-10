
import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class ContainerMedicalInfo extends StatelessWidget {
  const ContainerMedicalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Blood test',
            style: StylingSystem.textStyle30semibold,
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              textAlign: TextAlign.center,
              'A comprehensive test to analyze blood components',
              style: StylingSystem.textStyle14Medium.copyWith(
                fontWeight: FontWeight.w700,
                color: Color(0xff83818E),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cost:',
                style: StylingSystem.textStyle16Medium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2259CB),
                ),
              ),
              Text(
                ' 100.00EG',
                style: StylingSystem.textStyle16Medium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff83818E),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          CustomButton(
            onPressed: () {},
            text: 'Make Appointment',
            width: MediaQuery.of(context).size.width * 0.9,
            height: 45,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
