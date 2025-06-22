import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_avaliabale_model.dart';
import 'package:healthmate/features/sechdule%20treatment/data/repo/show_booking_avilable_repo.dart';
import 'package:healthmate/features/sechdule%20treatment/data/repo/show_booking_avilable_repo_impl.dart';
import 'package:meta/meta.dart';

part 'showavailabletime_state.dart';

class ShowavailabletimeCubit extends Cubit<ShowavailabletimeState> {
  ShowavailabletimeCubit() : super(ShowavailabletimeInitial());
  ApiService apiService = ApiService(dio: Dio());

  Future<void> showAvailableTime({
    required String doctorId,
    required String date,
  }) async {
    emit(ShowavailabletimeLoading());
    var response = await ShowBookingAvilableRepoImpl(apiService: apiService)
        .showBookingAvailable(doctorId: doctorId, date: date);
    response.fold(
      (failure) => emit(showavailabletimeError(error: failure)),
      (availableTime) => emit(
          showavailabletimeSucess(bookingAvaliabalTimeeModel: availableTime)),
    );
  }
}
