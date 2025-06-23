import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/helper_function/make_call.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/emergency/presentation/views/widgets/custom_button_emergency.dart';

class EmergencyViewBody extends StatelessWidget {
  const EmergencyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(header),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(fotter),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              const CustomAppBar(
                title: 'Emergency',
                stateicon: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset(emergencyCover),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'Ambulance department',
                style: StylingSystem.textStyle30semibold,
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  textAlign: TextAlign.center,
                  'To request an ambulance, you must call the emergency number.',
                  style: StylingSystem.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff83818E),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              CustomButtonEmergency(
                onPressed: () {
                  makePhoneCall('111');
                },
                text: 'Call',
                width: MediaQuery.of(context).size.width * 0.8,
                height: 45,
                textColor: Colors.white,
                backgrounColor: ColorSystem.kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
