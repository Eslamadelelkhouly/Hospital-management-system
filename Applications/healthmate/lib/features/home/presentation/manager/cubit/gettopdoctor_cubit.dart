import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/home/data/model/top_doctor_model.dart';
import 'package:healthmate/features/home/data/repo/get_top_doctor_repo_implement.dart';
import 'package:meta/meta.dart';

part 'gettopdoctor_state.dart';

class GettopdoctorCubit extends Cubit<GettopdoctorState> {
  ApiService apiService = ApiService(dio: Dio());
  GettopdoctorCubit() : super(GettopdoctorInitial());
  Future<void> getTopDoctor() async {
    emit(GettopdoctorLoading());
    var result = await GetTopDoctorRepoImplement(apiService: apiService).getTopDoctor();
    result.fold(
      (error) {
        emit(GettopdoctorError(error: error));
      },
      (topDoctorsResponse) {
        emit(GettopdoctorSuccess(topDoctorsResponse: topDoctorsResponse));
      },
    );
  }
}
