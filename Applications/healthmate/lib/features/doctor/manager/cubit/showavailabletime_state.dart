part of 'showavailabletime_cubit.dart';

@immutable
sealed class ShowavailabletimeState {}

final class ShowavailabletimeInitial extends ShowavailabletimeState {}

final class ShowavailabletimeLoading extends ShowavailabletimeState {}

final class showavailabletimeSucess extends ShowavailabletimeState {
  final BookingAvaliabalTimeeModel bookingAvaliabalTimeeModel;

  showavailabletimeSucess({required this.bookingAvaliabalTimeeModel});
}

final class showavailabletimeError extends ShowavailabletimeState {
  final Failures error;
  showavailabletimeError({required this.error});
}
