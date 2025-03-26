import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_container_doctor_photo_personal.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_socialcard_doctor_personal.dart';

class CustomCardDoctor extends StatelessWidget {
  const CustomCardDoctor(
      {super.key,
      required this.name,
      required this.city,
      required this.specification,
      required this.phone});
  final String name, city, specification, phone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomContainerDoctorPhotoPersonal(),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. ' + name,
                  style: StylingSystem.textStyle17semibold,
                ),
                Text(
                  specification,
                  style: StylingSystem.textStyle16Medium,
                ),
                8.verticalSpace,
                RowSocialCardDoctorPersonal(
                  text: city,
                  imageurl: locationicon,
                ),
                8.verticalSpace,
                RowSocialCardDoctorPersonal(
                  text: phone,
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
