import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_container_doctor_photo_personal.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_socialcard_doctor_personal.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class CustomCardDoctor extends StatelessWidget {
  const CustomCardDoctor({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomContainerDoctorPhotoPersonal(
            image: doctor.image.imageName,
          ),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. ' + doctor.firstName + ' ' + doctor.lastName,
                  style: ResponsiveStylingSystem.textStyle17semibold(context),
                ),
                Text(
                  doctor.specialization.name,
                  style: ResponsiveStylingSystem.textStyle16Medium(context),
                ),
                8.verticalSpace,
                RowSocialCardDoctorPersonal(
                  text: doctor.city.name,
                  imageurl: locationicon,
                ),
                8.verticalSpace,
                RowSocialCardDoctorPersonal(
                  text: doctor.phoneNumber,
                  imageurl: mobileicon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
