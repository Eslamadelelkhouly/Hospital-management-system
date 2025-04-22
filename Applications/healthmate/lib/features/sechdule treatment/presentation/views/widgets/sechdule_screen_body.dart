import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/sechdule%20treatment/data/manager/show_avliable_time/showavailabletime_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/row_container_time.dart';

class SechduleScreenBody extends StatefulWidget {
  const SechduleScreenBody({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<SechduleScreenBody> createState() => _SechduleScreenBodyState();
}

class _SechduleScreenBodyState extends State<SechduleScreenBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ShowavailabletimeCubit>()
        .showAvailableTime(doctorId: widget.doctor.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.verticalSpace,
          const CustomAppBar(title: 'Choose a date'),
          30.verticalSpace,
          const CustomCelender(),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              25.horizontalSpace,
              Text(
                'Available time',
                style: StylingSystem.textStyle20semibold,
              ),
            ],
          ),
          8.verticalSpace,
          BlocConsumer<ShowavailabletimeCubit, ShowavailabletimeState>(
            listener: (context, state) {
              if (state is showavailabletimeError) {}
            },
            builder: (context, state) {
              return RowContainerTime(
                onChanged: (int index) {
                  log('Selected time index: $index');
                },
              );
            },
          ),
          35.verticalSpace,
          CustomButton(
            onPressed: () {},
            text: 'Make Appointment',
            width: ScreenUtil.defaultSize.width * 0.9,
            height: 48.r,
            textColor: ColorSystem.kbtnColorWhite,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
