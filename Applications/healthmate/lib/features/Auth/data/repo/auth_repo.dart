import 'package:dartz/dartz.dart';
import 'package:healthmate/core/errors/failuers.dart';

abstract class AuthRepo {
  Future<Either<Failuers, Map<String, dynamic>>> signUp({
    required String fullname,
    required String email,
    required String password,
    required String dateofbirth,
  });
}
