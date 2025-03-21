class PatientModel {
  final String fullName;
  final String email;
  final String password;
  final String DateofBirth;

  PatientModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.DateofBirth,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'DateofBirth': DateofBirth,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      DateofBirth: map['DateofBirth'] ?? '',
    );
  }
}
