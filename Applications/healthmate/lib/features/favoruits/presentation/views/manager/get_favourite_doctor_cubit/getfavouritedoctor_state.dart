part of 'getfavouritedoctor_cubit.dart';

@immutable
sealed class GetfavouritedoctorState {}

final class GetfavouritedoctorInitial extends GetfavouritedoctorState {}

final class GetfavouritedoctorLoading extends GetfavouritedoctorState {}

final class GetfavouritedoctorSuccess extends GetfavouritedoctorState {
  final FavoriteDoctorsResponse favouriteDoctorsResponse;

  GetfavouritedoctorSuccess({required this.favouriteDoctorsResponse});
}

final class GetfavouritedoctorError extends GetfavouritedoctorState {
  final Map<String, dynamic> error;
  GetfavouritedoctorError({required this.error});
}
