import 'package:dartz/dartz.dart';

abstract class AddFavouriteRepo {
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> addFavourite({
    required String doctorId,
  });
}