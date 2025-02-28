import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_container_doctor_photo_personal.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_socialcard_doctor_personal.dart';

class CustomCardDoctor extends StatelessWidget {
  const CustomCardDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomContainerDoctorPhotoPersonal(),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. John Doe',
                style: StylingSystem.textStyle20semibold,
              ),
              Text(
                'Internal physician',
                style: StylingSystem.textStyle16Medium,
              ),
              SizedBox(
                height: 8,
              ),
              RowSocialCardDoctorPersonal(
                text: 'Mansoura',
                imageurl: locationicon,
              ),
              SizedBox(
                height: 8,
              ),
              RowSocialCardDoctorPersonal(
                text: '+20 1046985236',
                imageurl: mobileicon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
