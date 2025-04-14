import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_list_tiel_doctor.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_card_information.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class DoctorScreenBody extends StatelessWidget {
  const DoctorScreenBody({super.key, required this.doctor});
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          CustomAppBar(title: ''),
          5.verticalSpace,
          CustomCardDoctor(
            doctor: doctor,
          ),
          20.verticalSpace,
          RowCardInformation(
            patient: doctor.information.numberOfPatients.toString(),
            experience: doctor.information.experience.toString(),
            rating: doctor.rating.toString(),
          ),
          21.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text(
              'About',
              style: StylingSystem.textStyle20semibold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: SizedBox(
              width: 362.r,
              height: 96.r,
              child: Text(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                doctor.information.about,
                style: StylingSystem.textStyle16Medium.copyWith(
                  color: ColorSystem.kGrayColor2,
                ),
              ),
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text(
              'Working hours',
              style: StylingSystem.textStyle20semibold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
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
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
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
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text(
              'consulatiion fee',
              style: StylingSystem.textStyle20semibold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text(
              '1500 EGP',
              style: StylingSystem.textStyle16Medium.copyWith(
                color: ColorSystem.kGrayColor2,
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            onPressed: () {
              GoRouter.of(context).push(Routing.kschedulescreen);
            },
            text: 'Make Appointment',
            width: 362.r,
            height: 48.r,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
