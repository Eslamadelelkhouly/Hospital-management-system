import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/Auth/data/repo/auth_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  ApiService apiService = ApiService(dio: Dio());
  VerificationCubit() : super(VerificationInitial());
  Future<void> verify(
      {required String email,
      required String otp,
      required String password,
      required String confirmpassword}) async {
    emit(VerificationLoading());
    var result = await  AuthRepoImplementation(apiService: apiService).verifyOtp(
      otp: otp,
      email: email,
      password: password,
      confirmpassword: confirmpassword,
    );
    result.fold(
      (failure) => emit(VerificationFailure(errorMessage: failure)),
      (response) => emit(VerificationSuccess(message: response)),
    );
    
  }
}
