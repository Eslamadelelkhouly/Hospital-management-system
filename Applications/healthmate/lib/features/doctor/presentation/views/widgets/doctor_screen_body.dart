import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/card_information.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_list_tiel_doctor.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_card_information.dart';

class DoctorScreenBody extends StatelessWidget {
  const DoctorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(title: ''),
          SizedBox(
            height: 24,
          ),
          CustomCardDoctor(),
          SizedBox(
            height: 25,
          ),
          RowCardInformation(),
          SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'About',
              style: StylingSystem.textStyle20semibold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 362,
              height: 96,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Sed integer am congue enim libero urna odio. In accumsan odio mauris nibh. Et elementum enim at enim montes aliquam elit pellentesque nulla.',
                style: StylingSystem.textStyle16Medium.copyWith(
                  color: ColorSystem.kGrayColor2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Working hours',
              style: StylingSystem.textStyle20semibold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Monday',
                  style: StylingSystem.textStyle16Medium.copyWith(
                    color: ColorSystem.kGrayColor2,
                  ),
                ),
                Text(
                  '05:00 - 15:00',
                  style: StylingSystem.textStyle16Medium.copyWith(
                    color: ColorSystem.kGrayColor2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Monday',
                  style: StylingSystem.textStyle16Medium.copyWith(
                    color: ColorSystem.kGrayColor2,
                  ),
                ),
                Text(
                  '05:00 - 15:00',
                  style: StylingSystem.textStyle16Medium.copyWith(
                    color: ColorSystem.kGrayColor2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'consulatiion fee',
              style: StylingSystem.textStyle20semibold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '1500 EGP',
              style: StylingSystem.textStyle16Medium.copyWith(
                color: ColorSystem.kGrayColor2,
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            onPressed: () {},
            text: 'Make Appointment',
            width: 362,
            height: 48,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
