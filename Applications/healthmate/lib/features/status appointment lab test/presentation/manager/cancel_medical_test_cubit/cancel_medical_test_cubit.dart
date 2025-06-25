import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/repos/cancel_apppintment_medical_test_rep_implementation.dart';
import 'package:meta/meta.dart';

part 'cancel_medical_test_state.dart';

class CancelMedicalTestCubit extends Cubit<CancelMedicalTestState> {
  ApiService apiService = ApiService(dio: Dio());
  CancelMedicalTestCubit() : super(CancelMedicalTestInitial());
  
  Future<void> cancelMedicalTest({required String appointmentId}) async {
    emit(CancelMedicalTestLoading());
    var result = await CancelApppintmentMedicalTestRepImplementation(apiService: apiService)
        .cancelappointment(appointmentId: appointmentId);
    result.fold(
      (failure) => emit(CancelMedicalError(errorMessage: failure)),
      (message) => emit(CancelMedicalTestSuccess(message: message)),
    );
  }
}


