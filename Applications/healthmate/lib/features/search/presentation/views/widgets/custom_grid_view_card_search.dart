import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/manager/Show%20Doctor%20Cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_search.dart';

class CustomGridViewCardSearch extends StatelessWidget {
  CustomGridViewCardSearch({super.key});

  DoctorsResponse doctorsResponse = DoctorsResponse(
    doctors: [],
    message: 'message',
    status: 1,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowDoctorCubit, ShowDoctorState>(
      listener: (context, state) {
        if (state is ShowDoctorSuccess) {
          doctorsResponse = state.doctorsResponseModel;
        }
      },
      builder: (context, state) {
        if (state is ShowDoctorLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ShowDoctorFailure) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 50.r, color: Colors.red),
                  SizedBox(height: 16.r),
                  Text(
                    'Server Error',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.r),
                  Text(
                    _getErrorMessage(state.errors),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 16.r),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<ShowDoctorCubit>().getDoctors(),
                    child: Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is ShowDoctorSuccess || doctorsResponse.doctors.isNotEmpty) {
          return GridView.builder(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10.r,
              mainAxisExtent: 200.r,
            ),
            itemCount: doctorsResponse.doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctorsResponse.doctors[index];
              log(doctor.image.imageName.toString());
              return ContainerSearch(
                doctor: doctor,
              );
            },
          );
        }

        return const Center(
          child: Text('No doctors available'),
        );
      },
    );
  }

  String _getErrorMessage(Failures failure) {
    if (failure is ServerFailure) {
      return failure.errorData['message'] ?? 'An unknown server error occurred';
    }
    return 'An unknown error occurred';
  }
}
