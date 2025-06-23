import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/data/repos/upcoming_repo_implementation.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_model_request.dart';
import 'package:meta/meta.dart';

part 'cancel_state.dart';

class CancelCubit extends Cubit<CancelState> {
  ApiService apiService = ApiService(dio: Dio());
  CancelCubit() : super(CancelInitial());

  Future<void> getCancelAppointment({required String appointmentId}) async {
    emit(CancelLoading());
    var result = await UpcomingRepoImplementation(apiService: apiService)
        .cancelAppointment();
    result.fold(
      (failure) => emit(CancelFailure(error: failure)),
      (upcoming) => emit(
        CancelSuccess(upcomingAppointment: upcoming),
      ),
    );
  }
}
