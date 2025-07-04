import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';

class ContainerMedicalInfo extends StatelessWidget {
  const ContainerMedicalInfo({
    super.key,
    required this.nameTest,
    required this.descrption,
    required this.cost,
    required this.id,
  });
  final String nameTest, descrption, cost, id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            nameTest,
            style: ResponsiveStylingSystem.textStyle30semibold(context),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              textAlign: TextAlign.center,
              descrption,
              style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
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
                style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2259CB),
                ),
              ),
              Text(
                ' ${cost}EG',
                style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
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
            onPressed: () {
              GoRouter.of(context).push(Routing.kchooseMedicalTest, extra: id);
            },
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
