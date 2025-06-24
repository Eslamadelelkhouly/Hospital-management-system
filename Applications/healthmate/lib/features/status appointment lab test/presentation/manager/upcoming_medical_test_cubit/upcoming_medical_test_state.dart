part of 'upcoming_medical_test_cubit.dart';

@immutable
sealed class UpcomingMedicalTestState {}

final class UpcomingMedicalTestInitial extends UpcomingMedicalTestState {}

final class UpcomingMedicalTestLoading extends UpcomingMedicalTestState {}

final class UpcomingMedicalTestSuccess extends UpcomingMedicalTestState {
  final MedicalTestState medicalTestState;
  UpcomingMedicalTestSuccess({required this.medicalTestState});
}

final class UpcomingMedicalTestError extends UpcomingMedicalTestState {
  final String errorMessage;
  UpcomingMedicalTestError({required this.errorMessage});
}
