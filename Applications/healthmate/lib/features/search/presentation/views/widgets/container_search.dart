import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          Routing.kdoctorscreen,
          extra: doctor,
        );
      },
      child: Container(
        width: 175.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: ColorSystem.kPrimaryColorHighLight,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  12.verticalSpace,
                  SizedBox(
                    width: 58.r,
                    height: 58.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50).r,
                      child: Image.network(
                        'https://drive.google.com/uc?export=view&id=18qZBlJNS2vUjaO-x-XfTqSFoxHk6HslR',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Dr. ${doctor.firstName}',
                    style: StylingSystem.textStyle16Medium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  6.verticalSpace,
                  SizedBox(
                    width: 141.r,
                    height: 60.r,
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      doctor.information.about,
                      style: StylingSystem.textStyle11.copyWith(
                        color: ColorSystem.kGrayColor2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 13.5.r,
              top: 16.r,
              child: Row(
                children: [
                  Image.asset(stargoldicon),
                  2.horizontalSpace,
                  Text(
                    '4.7',
                    style: StylingSystem.textStyleSign12.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorSystem.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
