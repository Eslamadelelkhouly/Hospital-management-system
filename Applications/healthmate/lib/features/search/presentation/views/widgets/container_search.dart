import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routing.kdoctorscreen);
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
                      child: Image.asset(
                        doctorphoto1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Dr.Ali hassan',
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
