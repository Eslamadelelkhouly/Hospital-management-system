import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_disease_response_model.dart';
import 'package:healthmate/features/heartdisease/data/models/heart_request_model.dart';
import 'package:healthmate/features/heartdisease/data/repos/predict_heart_disease_rep_implement.dart';
import 'package:meta/meta.dart';

part 'heart_disease_state.dart';

class HeartDiseaseCubit extends Cubit<HeartDiseaseState> {
  HeartDiseaseCubit() : super(HeartDiseaseInitial());
  final ApiService apiService = ApiService(dio: Dio());

  Future<void> predictHeartDisease({required HeartRequestModel body}) async {
    emit(HeartDiseaseLoading());
    final result = await PredictHeartDiseaseRepImplement(
      apiService: apiService,
    ).predictHeartDisease(
      heartDiseaseBody: body,
    );

    result.fold(
      (failure) => emit(HeartDiseaseFaiuler(errors: failure.errorData)),
      (response) =>
          emit(HeartDiseaseSucess(heartDiseasePredictionModel: response)),
    );
  }
}
