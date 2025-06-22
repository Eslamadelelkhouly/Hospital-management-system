import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/confirm%20appointment/data/repos/cancel_appointement_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'delete_appointment_state.dart';

class DeleteAppointmentCubit extends Cubit<DeleteAppointmentState> {
  ApiService apiService = ApiService(dio: Dio());
  DeleteAppointmentCubit() : super(DeleteAppointmentInitial());

  Future<void> deleteAppointment({required String apointmentId}) async {
    var result =
        await CancelAppointementRepoImplementation(apiService: apiService)
            .cancelAppointment(appointmentId: apointmentId);
    emit(DeleteAppointmentLoading());
    result.fold(
      (failure) => emit(DeleteAppointmentFailure(error: failure)),
      (message) => emit(DeleteAppointmentSuccess(message: message)),
    );
  }
}
