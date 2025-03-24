import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final ApiService apiService = ApiService(dio: Dio());
  Future<void> signUp({
    required String fullname,
    required String email,
    required String password,
    required String dateofbirth,
  }) async {
    emit(RegisterLoading());
    final result = await AuthRepoImplementation(apiService: apiService).signUp(
      fullname: fullname,
      email: email,
      password: password,
      dateofbirth: dateofbirth,
    );
    result.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.errorData)),
      (response) => emit(RegisterSuccess(response: response['patient'])),
    );
  }
}
