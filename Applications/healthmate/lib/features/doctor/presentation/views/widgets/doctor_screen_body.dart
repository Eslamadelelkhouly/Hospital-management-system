import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/doctor/presentation/manager/cubit/get_doctor_by_id_cubit.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/custom_list_tiel_doctor.dart';
import 'package:healthmate/features/doctor/presentation/views/widgets/row_card_information.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class DoctorScreenBody extends StatefulWidget {
  const DoctorScreenBody({super.key, required this.id});
  final String id;

  @override
  State<DoctorScreenBody> createState() => _DoctorScreenBodyState();
}

class _DoctorScreenBodyState extends State<DoctorScreenBody> {
  List<Map<String, dynamic>> scheduleList = [];

  Doctor doctor = Doctor(
    id: 0,
    firstName: '',
    lastName: '',
    phoneNumber: '',
    rating: '',
    specId: 0,
    cityId: 0,
    image: DoctorImage(id: 0, doctorId: 1, imageName: ''),
    information: DoctorInformation(
      id: 3,
      doctorId: 1,
      about: '',
      experience: 2,
      numberOfPatients: 10,
      schedule: '',
      salary: '2',
    ),
    specialization: Specialization(id: 2, name: ''),
    city: City(id: 3, name: ''),
  );

  @override
  void initState() {
    super.initState();
    context.read<GetDoctorByIdCubit>().getDoctorwithID(id: widget.id);
  }

  List<Map<String, dynamic>> parseSchedule(String scheduleJson) {
    try {
      final scheduleMap = jsonDecode(scheduleJson) as Map<String, dynamic>;
      final list = scheduleMap.entries.map((entry) {
        return {
          'day': entry.key,
          'times': List<String>.from(entry.value),
        };
      }).toList();
      log('Parsed Schedule: $list');
      return list;
    } catch (e) {
      log('Schedule parsing error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: BlocConsumer<GetDoctorByIdCubit, GetDoctorByIdState>(
        listener: (context, state) {
          if (state is GetDoctorByIdSuccess) {
            doctor = state.doctorModel;
            scheduleList = parseSchedule(doctor.information.schedule);
            setState(() {});
          }
        },
        builder: (context, state) {
          if (state is GetDoctorByIdLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetDoctorByIdSuccess) {
            return buildDoctorUI();
          } else if (state is GetDoctorByIdError) {
            return Center(
              child: Text(
                'Failed to load doctor data',
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget buildDoctorUI() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          const CustomAppBar(title: '', stateicon: true),
          5.verticalSpace,
          CustomCardDoctor(doctor: doctor),
          20.verticalSpace,
          RowCardInformation(
            patient: doctor.information.numberOfPatients.toString(),
            experience: doctor.information.experience.toString(),
            rating: doctor.rating.toString(),
          ),
          21.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text('About', style: StylingSystem.textStyle20semibold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: SizedBox(
              width: 362.r,
              height: 96.r,
              child: Text(
                doctor.information.about,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: StylingSystem.textStyle16Medium.copyWith(
                  color: ColorSystem.kGrayColor2,
                ),
              ),
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child:
                Text('Working Hours', style: StylingSystem.textStyle20semibold),
          ),
          10.verticalSpace,
          scheduleList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10).r,
                  child: Text(
                    'No schedule available',
                    style: StylingSystem.textStyle16Medium.copyWith(
                      color: ColorSystem.kGrayColor2,
                    ),
                  ),
                )
              : Column(
                  children: scheduleList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5)
                          .r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['day'],
                            style: StylingSystem.textStyle16Medium.copyWith(
                              color: ColorSystem.kGrayColor2,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              (item['times'] as List<String>).join(', '),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: StylingSystem.textStyle16Medium.copyWith(
                                color: ColorSystem.kGrayColor2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text('Consultation Fee',
                style: StylingSystem.textStyle20semibold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Text(
              '1500 EGP',
              style: StylingSystem.textStyle16Medium.copyWith(
                color: ColorSystem.kGrayColor2,
              ),
            ),
          ),
          30.verticalSpace,
          CustomButton(
            onPressed: () {
              GoRouter.of(context).push(
                Routing.kschedulescreen,
                extra: doctor,
              );
            },
            text: 'Make Appointment',
            width: 362.r,
            height: 48.r,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
