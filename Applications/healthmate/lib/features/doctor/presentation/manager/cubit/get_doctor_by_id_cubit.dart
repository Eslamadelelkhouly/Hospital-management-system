import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/doctor/data/repos/get_docotr_with_id_implementaion.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

part 'get_doctor_by_id_state.dart';

class GetDoctorByIdCubit extends Cubit<GetDoctorByIdState> {
  final ApiService apiService = ApiService(dio: Dio());

  GetDoctorByIdCubit() : super(GetDoctorByIdInitial());

  Future<void> getDoctorwithID({required String id}) async {
    emit(GetDoctorByIdLoading());

    final result = await GetDocotrWithIdImplementaion(apiService: apiService)
        .getDoctorwithID(id: id);

    result.fold(
      (failure) => emit(GetDoctorByIdError(errorMessage: failure)),
      (doctor) => emit(GetDoctorByIdSuccess(doctorModel: doctor)),
    );
  }
}
