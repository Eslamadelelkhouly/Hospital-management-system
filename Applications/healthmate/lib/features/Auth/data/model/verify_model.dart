class VerificationErrorModel {
  final String message;
  final int status;
  final Map<String, List<String>> errors;

  VerificationErrorModel({
    required this.message,
    required this.status,
    required this.errors,
  });

  factory VerificationErrorModel.fromJson(Map<String, dynamic> json) {
    return VerificationErrorModel(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      errors: (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          List<String>.from(value),
        ),
      ),
    );
  }
}
