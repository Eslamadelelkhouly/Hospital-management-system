import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());
  final ApiService apiService = ApiService(dio: Dio());
  Future<void> logIn(
      {required String email, required String password}) async {
    emit(LoginCubitLoading());
    final result = await AuthRepoImplementation(apiService: apiService)
        .logIn(email: email, password: password);
    result.fold(
      (failure) => emit(LoginCubitFailure(erorMessage: failure.errorData)),
      (response) => emit(LoginCubitSuccess(data: response)),
    );
  }
}
