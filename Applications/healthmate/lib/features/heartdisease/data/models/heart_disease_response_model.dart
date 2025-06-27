class HeartDiseasePredictionModel {
  final String prediction;
  final bool isDiagnosed; // ✅ جديد
  final String modelUsed;
  final String probabilityPercentage;
  final String confidenceLevel;
  final double? rawProbability;

  HeartDiseasePredictionModel({
    required this.prediction,
    required this.isDiagnosed, // ✅ جديد
    required this.modelUsed,
    required this.probabilityPercentage,
    required this.confidenceLevel,
    this.rawProbability,
  });

  factory HeartDiseasePredictionModel.fromJson(Map<String, dynamic> json) {
    return HeartDiseasePredictionModel(
      prediction: json['prediction'],
      isDiagnosed: json['is_diagnosed'], // ✅ جديد
      modelUsed: json['model_used'],
      probabilityPercentage: json['probability_percentage'],
      confidenceLevel: json['confidence_level'],
      rawProbability: json['raw_probability']?.toDouble(),
    );
  }
}
