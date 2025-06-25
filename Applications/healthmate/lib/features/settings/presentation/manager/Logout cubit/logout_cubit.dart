import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  ApiService apiService = ApiService(dio: Dio());
  LogoutCubit() : super(LogoutInitial());
  Future<void> logOut() async {
    emit(LogoutLoading());
    var result = await AuthRepoImplementation(apiService: apiService).logOut();
    result.fold((error) => emit(LogoutError(errorMessage: error)),
        (sucess) => emit(LogoutSuccess(response: sucess)));
  }
}
