class HeartDiseaseResponseError {
  final String message;
  final Errors errors;

  HeartDiseaseResponseError({
    required this.message,
    required this.errors,
  });

  factory HeartDiseaseResponseError.fromJson(Map<String, dynamic> json) {
    return HeartDiseaseResponseError(
      message: json['message'] ?? '',
      errors: Errors.fromJson(json['errors'] ?? {}),
    );
  }
}

class Errors {
  final String age;
  final String sex;
  final String cp;
  final String trestbps;
  final String chol;
  final String fbs;
  final String restecg;
  final String thalachh;
  final String exang;
  final String oldpeak;
  final String slope;
  final String ca;
  final String thal;
  final String modelType;

  Errors({
    required this.age,
    required this.sex,
    required this.cp,
    required this.trestbps,
    required this.chol,
    required this.fbs,
    required this.restecg,
    required this.thalachh,
    required this.exang,
    required this.oldpeak,
    required this.slope,
    required this.ca,
    required this.thal,
    required this.modelType,
  });

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      age: json['age'] ?? '',
      sex: json['sex'] ?? '',
      cp: json['cp'] ?? '',
      trestbps: json['trestbps'] ?? '',
      chol: json['chol'] ?? '',
      fbs: json['fbs'] ?? '',
      restecg: json['restecg'] ?? '',
      thalachh: json['thalachh'] ?? '',
      exang: json['exang'] ?? '',
      oldpeak: json['oldpeak'] ?? '',
      slope: json['slope'] ?? '',
      ca: json['ca'] ?? '',
      thal: json['thal'] ?? '',
      modelType: json['model_type'] ?? '',
    );
  }
}

// Factory function to return an empty Errors object with default messages
Errors errors({
  String? age,
  String? sex,
  String? cp,
  String? trestbps,
  String? chol,
  String? fbs,
  String? restecg,
  String? thalachh,
  String? exang,
  String? oldpeak,
  String? slope,
  String? ca,
  String? thal,
  String? modelType,
}) {
  return Errors(
    age: age ?? "the age is required",
    sex: sex ?? "the sex is required",
    cp: cp ?? "the cp is required",
    trestbps: trestbps ?? "the trestbps is required",
    chol: chol ?? "the chol is required",
    fbs: fbs ?? "the fbs is required",
    restecg: restecg ?? "the restecg is required",
    thalachh: thalachh ?? "the thalachh is required",
    exang: exang ?? "the exang is required",
    oldpeak: oldpeak ?? "the oldpeak is required",
    slope: slope ?? "the slope is required",
    ca: ca ?? "the ca is required",
    thal: thal ?? "the thal is required",
    modelType: modelType ?? "the model_type is required",
  );
}
