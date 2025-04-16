class HeartDiseasePredictionModel {
  final String prediction;
  final String modelUsed;
  final String probabilityPercentage;
  final String confidenceLevel;
  final double rawProbability;

  HeartDiseasePredictionModel({
    required this.prediction,
    required this.modelUsed,
    required this.probabilityPercentage,
    required this.confidenceLevel,
    required this.rawProbability,
  });

  factory HeartDiseasePredictionModel.fromJson(Map<String, dynamic> json) {
    return HeartDiseasePredictionModel(
      prediction: json['prediction'] ?? '',
      modelUsed: json['model_used'] ?? '',
      probabilityPercentage: json['probability_percentage'] ?? '',
      confidenceLevel: json['confidence_level'] ?? '',
      rawProbability: (json['raw_probability'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prediction': prediction,
      'model_used': modelUsed,
      'probability_percentage': probabilityPercentage,
      'confidence_level': confidenceLevel,
      'raw_probability': rawProbability,
    };
  }
}
