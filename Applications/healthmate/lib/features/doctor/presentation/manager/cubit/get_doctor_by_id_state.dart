part of 'get_doctor_by_id_cubit.dart';

@immutable
sealed class GetDoctorByIdState {}

final class GetDoctorByIdInitial extends GetDoctorByIdState {}

final class GetDoctorByIdLoading extends GetDoctorByIdState {}

final class GetDoctorByIdSuccess extends GetDoctorByIdState {
  final DoctorsResponse doctorModel;
  GetDoctorByIdSuccess({required this.doctorModel});
}

final class GetDoctorByIdError extends GetDoctorByIdState {
  final String errorMessage;
  GetDoctorByIdError({required this.errorMessage});
}
