part of 'avaliable_time_medical_test_cubit.dart';

@immutable
sealed class AvaliableTimeMedicalTestState {}

final class AvaliableTimeMedicalTestInitial extends AvaliableTimeMedicalTestState {}

final class AvaliableTimeMedicalTestLoading extends AvaliableTimeMedicalTestState {}

final class AvaliableTimeMedicalTestSucess extends AvaliableTimeMedicalTestState {
  final AvailableAppointmentsMedicalTest availableAppointmentsMedicalTest;

  AvaliableTimeMedicalTestSucess({required this.availableAppointmentsMedicalTest});

}

final class AvaliableTimeMedicalTestError extends AvaliableTimeMedicalTestState {
  final Map<String, dynamic> message;

  AvaliableTimeMedicalTestError({required this.message});
}
