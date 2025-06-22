import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/confirm%20appointment/data/model/upcoming_model.dart';
import 'package:healthmate/features/confirm%20appointment/data/repos/upcoming_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  ApiService apiService = ApiService(dio: Dio());
  UpcomingCubit() : super(UpcomingInitial());

  Future<void> getUpcomingappointment() async {
    var result = await UpcomingRepoImplementation(apiService: apiService)
        .getUpcomingAppointments();
    result.fold(
      (failure) => emit(UpcomingError(error: failure)),
      (upcoming) => emit(UpcomingSuccess(upcomingAppointment: upcoming)),
    );
  }
}
