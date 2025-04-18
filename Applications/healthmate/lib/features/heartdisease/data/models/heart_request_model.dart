class HeartRequestModel {
  final int age;
  final int sex;
  final int cp;
  final int trestbps;
  final int chol;
  final int fbs;
  final int restecg;
  final int thalachh;
  final int exang;
  final double oldpeak;
  final int slope;
  final int ca;
  final int thal;
  final String modelType;

  HeartRequestModel({
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

  factory HeartRequestModel.fromJson(Map<String, dynamic> json) {
    return HeartRequestModel(
      age: json['age'],
      sex: json['sex'],
      cp: json['cp'],
      trestbps: json['trestbps'],
      chol: json['chol'],
      fbs: json['fbs'],
      restecg: json['restecg'],
      thalachh: json['thalachh'],
      exang: json['exang'],
      oldpeak: (json['oldpeak'] as num).toDouble(),
      slope: json['slope'],
      ca: json['ca'],
      thal: json['thal'],
      modelType: json['model_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'sex': sex,
      'cp': cp,
      'trestbps': trestbps,
      'chol': chol,
      'fbs': fbs,
      'restecg': restecg,
      'thalachh': thalachh,
      'exang': exang,
      'oldpeak': oldpeak,
      'slope': slope,
      'ca': ca,
      'thal': thal,
      'model_type': modelType,
    };
  }
}
