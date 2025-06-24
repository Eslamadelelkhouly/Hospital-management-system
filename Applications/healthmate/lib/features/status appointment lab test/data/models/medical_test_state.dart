class MedicalTestState {
  final List<AppointmentDetail> appointmentDetails;
  final String message;
  final int status;

  MedicalTestState({
    required this.appointmentDetails,
    required this.message,
    required this.status,
  });

  factory MedicalTestState.fromJson(Map<String, dynamic> json) {
    return MedicalTestState(
      appointmentDetails: (json['appointment_details'] as List)
          .map((e) => AppointmentDetail.fromJson(e))
          .toList(),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointment_details':
          appointmentDetails.map((e) => e.toJson()).toList(),
      'message': message,
      'status': status,
    };
  }
}

class AppointmentDetail {
  final int appointmentId;
  final String testName;
  final String appointmentDate;
  final String appointmentTime;

  AppointmentDetail({
    required this.appointmentId,
    required this.testName,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) {
    return AppointmentDetail(
      appointmentId: json['appointment_id'],
      testName: json['test_name'],
      appointmentDate: json['appointment_date'],
      appointmentTime: json['appointment_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointment_id': appointmentId,
      'test_name': testName,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
    };
  }
}
