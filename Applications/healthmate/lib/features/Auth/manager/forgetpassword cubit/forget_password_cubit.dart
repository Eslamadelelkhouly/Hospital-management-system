import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ApiService apiService = ApiService(dio: Dio());
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  Future<void> forgetpasword({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await AuthRepoImplementation(apiService: apiService)
        .forgotPassword(email: email);
    result.fold((error) => emit(ForgetPasswordError(error: error)),
        (sucess) => emit(ForgetPasswordSuccess(message: sucess)));
  }
}
