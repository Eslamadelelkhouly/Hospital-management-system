part of 'cancel_cubit.dart';

@immutable
sealed class CancelState {}

final class CancelInitial extends CancelState {}

final class CancelLoading extends CancelState {}

final class CancelSuccess extends CancelState {
  final UpcomingAppointment upcomingAppointment;

  CancelSuccess({required this.upcomingAppointment});

}

final class CancelFailure extends CancelState {
  final String error;

  CancelFailure({required this.error});
}
