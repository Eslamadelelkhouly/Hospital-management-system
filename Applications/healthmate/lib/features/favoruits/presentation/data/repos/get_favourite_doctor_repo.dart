import 'package:dartz/dartz.dart';
import 'package:healthmate/features/favoruits/presentation/data/models/favoutite_list_model.dart';

abstract class GetFavouriteDoctorRepo {
  Future<Either<Map<String, dynamic>, FavoriteDoctorsResponse>>
      getFavouritedoctor();
}
