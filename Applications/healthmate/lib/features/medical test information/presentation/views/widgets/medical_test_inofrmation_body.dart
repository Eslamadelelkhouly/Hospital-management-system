import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/views/widgets/container_medical_info.dart';

class MedicalTestInofrmationBody extends StatelessWidget {
  const MedicalTestInofrmationBody({super.key});

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
              Image.asset(
                header,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fotter,
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              CustomAppBar(title: 'Medical test information', stateicon: true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset(medicalinfo),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ContainerMedicalInfo(),
            ],
          ),
        ),
      ],
    );
  }
}
