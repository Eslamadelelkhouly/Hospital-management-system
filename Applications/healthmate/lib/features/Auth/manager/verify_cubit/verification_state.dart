part of 'verification_cubit.dart';

@immutable
sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}

final class VerificationLoading extends VerificationState {}

final class VerificationFailure extends VerificationState {
  final String errorMessage;
  VerificationFailure({required this.errorMessage});
}

final class VerificationSuccess extends VerificationState {
  final String message;
  VerificationSuccess({required this.message});
}
