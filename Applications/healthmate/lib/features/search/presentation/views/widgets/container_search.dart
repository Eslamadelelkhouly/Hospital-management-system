import 'package:flutter/material.dart';
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
        width: 173,
        height: 178,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorSystem.kPrimaryColorHighLight,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 58,
                    height: 58,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        doctorphoto1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Dr.Ali hassan',
                    style: StylingSystem.textStyle16Medium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 141,
                    height: 54,
                    child: Text(
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: StylingSystem.textStyleSign12.copyWith(
                        color: ColorSystem.kGrayColor2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 12,
              child: Row(
                children: [
                  Image.asset(stargoldicon),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '4.7',
                    style: StylingSystem.textStyle14Medium.copyWith(
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
