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
  final List<String> age;
  final List<String> sex;
  final List<String> cp;
  final List<String> trestbps;
  final List<String> chol;
  final List<String> fbs;
  final List<String> restecg;
  final List<String> thalachh;
  final List<String> exang;
  final List<String> oldpeak;
  final List<String> slope;
  final List<String> ca;
  final List<String> thal;
  final List<String> modelType;

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
      age: List<String>.from(json['age'] ?? []),
      sex: List<String>.from(json['sex'] ?? []),
      cp: List<String>.from(json['cp'] ?? []),
      trestbps: List<String>.from(json['trestbps'] ?? []),
      chol: List<String>.from(json['chol'] ?? []),
      fbs: List<String>.from(json['fbs'] ?? []),
      restecg: List<String>.from(json['restecg'] ?? []),
      thalachh: List<String>.from(json['thalachh'] ?? []),
      exang: List<String>.from(json['exang'] ?? []),
      oldpeak: List<String>.from(json['oldpeak'] ?? []),
      slope: List<String>.from(json['slope'] ?? []),
      ca: List<String>.from(json['ca'] ?? []),
      thal: List<String>.from(json['thal'] ?? []),
      modelType: List<String>.from(json['model_type'] ?? []),
    );
  }
}

// Factory function to return an empty Errors object
Errors errors({
  List<String>? age,
  List<String>? sex,
  List<String>? cp,
  List<String>? trestbps,
  List<String>? chol,
  List<String>? fbs,
  List<String>? restecg,
  List<String>? thalachh,
  List<String>? exang,
  List<String>? oldpeak,
  List<String>? slope,
  List<String>? ca,
  List<String>? thal,
  List<String>? modelType,
}) {
  return Errors(
    age: age ?? [],
    sex: sex ?? [],
    cp: cp ?? [],
    trestbps: trestbps ?? [],
    chol: chol ?? [],
    fbs: fbs ?? [],
    restecg: restecg ?? [],
    thalachh: thalachh ?? [],
    exang: exang ?? [],
    oldpeak: oldpeak ?? [],
    slope: slope ?? [],
    ca: ca ?? [],
    thal: thal ?? [],
    modelType: modelType ?? [],
  );
}
