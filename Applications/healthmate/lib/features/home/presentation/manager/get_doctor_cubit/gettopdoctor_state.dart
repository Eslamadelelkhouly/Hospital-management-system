part of 'gettopdoctor_cubit.dart';

@immutable
sealed class GettopdoctorState {}

final class GettopdoctorInitial extends GettopdoctorState {}

final class GettopdoctorLoading extends GettopdoctorState {}

final class GettopdoctorSuccess extends GettopdoctorState {
  final TopDoctorsResponse topDoctorsResponse;

  GettopdoctorSuccess({required this.topDoctorsResponse});
}

final class GettopdoctorError extends GettopdoctorState {
  final Failures error;

  GettopdoctorError({required this.error});
}