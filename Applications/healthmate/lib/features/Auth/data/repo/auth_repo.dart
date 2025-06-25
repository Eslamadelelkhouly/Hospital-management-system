import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';

abstract class AuthRepo {
  Future<Either<Failures, Map<String, dynamic>>> signUp({
    required String fullname,
    required String email,
    required String password,
    required String dateofbirth,
  });
  Future<Either<Failures, Map<String, dynamic>>> logIn({
    required String email,
    required String password,
  });
  Future<Either<String, String>> logOut();

  Future<Either<String, String>> forgotPassword({required String email});

  Future<Either<String, String>> verifyOtp({
    required String otp,
    required String email,
    required String password,
    required String confirmpassword,
  });
}
