import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/favoruits/presentation/data/models/favoutite_list_model.dart';
import 'package:healthmate/features/favoruits/presentation/data/repos/get_favourite_docotor_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'getfavouritedoctor_state.dart';

class GetfavouritedoctorCubit extends Cubit<GetfavouritedoctorState> {
  GetfavouritedoctorCubit() : super(GetfavouritedoctorInitial());
  final ApiService apiService = ApiService(dio: Dio());

  Future<void> getFavouritedoctor() async {
    emit(GetfavouritedoctorLoading());
    var result =
        await GetFavouriteDocotorRepoImplementation(apiService: apiService)
            .getFavouritedoctor();
    result.fold((error) {
      emit(GetfavouritedoctorError(error: error));
    }, (data) {
      emit(GetfavouritedoctorSuccess(favouriteDoctorsResponse: data));
    });
  }
}
