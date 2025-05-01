import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_model_request.dart';
import 'package:healthmate/features/sechdule%20treatment/data/repo/book_repo_implement.dart';
import 'package:meta/meta.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());
  ApiService apiService = ApiService(dio: Dio());
  Future<void> bookTreatment(
      {required AppointmentModelRequest appointmentModelRequest}) async {
    emit(AppointmentLoading());
    var response = await BookRepoImplement(apiService: apiService)
        .bookTreatment(appointmentModelRequest: appointmentModelRequest);
    response.fold(
      (failure) => emit(AppointmentError(errorMessage: failure)),
      (appointmentResponse) =>
          emit(appointmentSuccess(appointmentResponse: appointmentResponse)),
    );
  }
}
