part of 'delete_appointment_cubit.dart';

@immutable
sealed class DeleteAppointmentState {}

final class DeleteAppointmentInitial extends DeleteAppointmentState {}

final class DeleteAppointmentLoading extends DeleteAppointmentState {}

final class DeleteAppointmentSuccess extends DeleteAppointmentState {
  final String message;

  DeleteAppointmentSuccess({required this.message});
}

final class DeleteAppointmentFailure extends DeleteAppointmentState {
  final String error;

  DeleteAppointmentFailure({required this.error});
}
