class AvailableMedicalTest {
  final List<String> availableAppointments;
  final String date;
  final String message;
  final int status;

  AvailableMedicalTest({
    required this.availableAppointments,
    required this.date,
    required this.message,
    required this.status,
  });

  factory AvailableMedicalTest.fromJson(Map<String, dynamic> json) {
    return AvailableMedicalTest(
      availableAppointments: List<String>.from(json['available_appointments']),
      date: json['date'],
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available_appointments': availableAppointments,
      'date': date,
      'message': message,
      'status': status,
    };
  }
}
