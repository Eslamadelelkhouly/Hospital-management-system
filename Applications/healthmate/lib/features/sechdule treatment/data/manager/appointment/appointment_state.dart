part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class appointmentSuccess extends AppointmentState {
  final Map<String, dynamic> appointmentResponse;

  appointmentSuccess({required this.appointmentResponse});
}

final class AppointmentError extends AppointmentState {
  final Map<String, dynamic> errorMessage;

  AppointmentError({required this.errorMessage});
}
