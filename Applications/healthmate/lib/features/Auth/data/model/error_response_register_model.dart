class ErrorResponse {
  final String message;
  final Errors errors;

  ErrorResponse({required this.message, required this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'] ?? '',
      errors: Errors.fromJson(json['errors'] ?? {}),
    );
  }
}

class Errors {
  final List<String> fullName;
  final List<String> email;
  final List<String> password;
  final List<String> dateOfBirth;

  Errors({
    required this.fullName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
  });

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      fullName: List<String>.from(json['fullName'] ?? []),
      email: List<String>.from(json['email'] ?? []),
      password: List<String>.from(json['password'] ?? []),
      dateOfBirth: List<String>.from(json['dateOfBirth'] ?? []),
    );
  }
}

Errors errors({
  List<String>? fullName,
  List<String>? email,
  List<String>? password,
  List<String>? dateOfBirth,
}) {
  return Errors(
    fullName: fullName ?? [],
    email: email ?? [],
    password: password ?? [],
    dateOfBirth: dateOfBirth ?? [],
  );
}
