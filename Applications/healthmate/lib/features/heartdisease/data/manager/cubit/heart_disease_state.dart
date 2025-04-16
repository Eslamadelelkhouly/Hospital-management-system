part of 'heart_disease_cubit.dart';

@immutable
sealed class HeartDiseaseState {}

final class HeartDiseaseInitial extends HeartDiseaseState {}

final class HeartDiseaseLoading extends HeartDiseaseState {}

final class HeartDiseaseSucess extends HeartDiseaseState {
  final HeartDiseasePredictionModel heartDiseasePredictionModel;

  HeartDiseaseSucess({required this.heartDiseasePredictionModel});
}

final class HeartDiseaseFaiuler extends HeartDiseaseState {
  final Map<String, dynamic> errors;
  HeartDiseaseFaiuler({required this.errors});
}
