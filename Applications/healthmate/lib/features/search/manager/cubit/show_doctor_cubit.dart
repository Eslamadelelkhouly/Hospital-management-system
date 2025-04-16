import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/data/repos/get_doctor_repo_implementaion.dart';
import 'package:meta/meta.dart';

part 'show_doctor_state.dart';

class ShowDoctorCubit extends Cubit<ShowDoctorState> {
  ShowDoctorCubit() : super(ShowDoctorInitial());
  ApiService apiService = ApiService(
      dio: Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 80),
      sendTimeout: const Duration(seconds: 60),
    ),
  ));

  Future<void> getDoctors() async {
    emit(ShowDoctorLoading());
    var response =
        await GetDoctorRepoImplementaion(apiService: apiService).getDoctors();
    response.fold(
      (failure) => emit(ShowDoctorFailure(errors: failure)),
      (doctors) => emit(ShowDoctorSuccess(doctorsResponseModel: doctors)),
    );
  }
}
