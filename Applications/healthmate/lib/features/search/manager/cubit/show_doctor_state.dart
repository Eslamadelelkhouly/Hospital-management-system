part of 'show_doctor_cubit.dart';

@immutable
sealed class ShowDoctorState {}

final class ShowDoctorInitial extends ShowDoctorState {}

final class ShowDoctorLoading extends ShowDoctorState {}

final class ShowDoctorFailure extends ShowDoctorState {
  Failures errors;
  ShowDoctorFailure({required this.errors});
}

final class ShowDoctorSuccess extends ShowDoctorState {
  DoctorsResponse doctorsResponseModel;
  ShowDoctorSuccess({required this.doctorsResponseModel});
}
