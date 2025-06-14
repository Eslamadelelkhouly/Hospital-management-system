import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/models/available_appointment_medical_test_model.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/repos/get_avaliable_medical_test_time_implement_repo.dart';
import 'package:meta/meta.dart';

part 'avaliable_time_medical_test_state.dart';

class AvaliableTimeMedicalTestCubit
    extends Cubit<AvaliableTimeMedicalTestState> {
  AvaliableTimeMedicalTestCubit() : super(AvaliableTimeMedicalTestInitial());
  ApiService apiService = ApiService(dio: Dio());
  Future<void> getavalibleTimeMedicalTest(
      {required String medicalTestId, required String date}) async {
    emit(AvaliableTimeMedicalTestLoading());
    var result =
        await GetAvaliableMedicalTestTimeImplementRepo(apiService: apiService)
            .getAvailableMedicalTestTime(medicalTestId, date);
    result.fold(
      (error) {
        emit(AvaliableTimeMedicalTestError(message: error));
      },
      (availableAppointmentsMedicalTest) {
        emit(AvaliableTimeMedicalTestSucess(
            availableAppointmentsMedicalTest:
                availableAppointmentsMedicalTest));
      },
    );
  }
}
