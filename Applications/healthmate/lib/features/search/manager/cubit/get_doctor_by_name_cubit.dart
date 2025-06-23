import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/data/models/doctor_model_get_by_name.dart';
import 'package:healthmate/features/search/data/repos/get_doctor_repo_implementaion.dart';
import 'package:meta/meta.dart';

part 'get_doctor_by_name_state.dart';

class GetDoctorByNameCubit extends Cubit<GetDoctorByNameState> {
  ApiService apiService = ApiService(dio: Dio());
  GetDoctorByNameCubit() : super(GetDoctorByNameInitial());

  Future<void> getDoctorByName({required String name}) async {
    emit(GetDoctorByNameLoading());
    final result = await GetDoctorRepoImplementaion(apiService: apiService)
        .getDoctorSearch(name: name);
    result.fold(
      (failure) => emit(GetDoctorByNameError(errorMessage: failure)),
      (doctors) => emit(GetDoctorByNameSuccess(doctorsResponse: doctors)),
    );
  }
}
