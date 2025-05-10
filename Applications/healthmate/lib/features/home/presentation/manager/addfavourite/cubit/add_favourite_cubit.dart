import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/home/data/repo/add_favourite%20_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'add_favourite_state.dart';

class AddFavouriteCubit extends Cubit<AddFavouriteState> {
  AddFavouriteCubit() : super(AddFavouriteInitial());
  final ApiService apiService = ApiService(
    dio: Dio(),
  );

  Future<void> addFavourite({required int doctorId}) async {
    emit(AddFavouriteInitial());
    var result = await AddFavouriteRepoImplementation(apiService: apiService)
        .addFavourite(doctorId: doctorId);
    result.fold(
      (error) {
        emit(AddFavouriteFailure(error: error));
      },
      (response) {
        emit(AddFavouriteSuccess(response: response));
      },
    );
  }
}
