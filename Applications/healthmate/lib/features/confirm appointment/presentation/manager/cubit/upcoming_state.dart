part of 'upcoming_cubit.dart';

@immutable
sealed class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {}

final class UpcomingSuccess extends UpcomingState {
  final UpcomingAppointment upcomingAppointment;

  UpcomingSuccess({required this.upcomingAppointment});
}

final class UpcomingError extends UpcomingState {
  final String error;

  UpcomingError({required this.error});
}
