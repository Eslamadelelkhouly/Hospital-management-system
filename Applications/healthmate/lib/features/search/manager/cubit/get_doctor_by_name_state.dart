part of 'get_doctor_by_name_cubit.dart';

@immutable
sealed class GetDoctorByNameState {}

final class GetDoctorByNameInitial extends GetDoctorByNameState {}

final class GetDoctorByNameLoading extends GetDoctorByNameState {}

final class GetDoctorByNameSuccess extends GetDoctorByNameState {
  final DoctorSearch doctorsResponse;
  GetDoctorByNameSuccess({required this.doctorsResponse});
}

final class GetDoctorByNameError extends GetDoctorByNameState {
  final String errorMessage;
  GetDoctorByNameError({required this.errorMessage});
}
