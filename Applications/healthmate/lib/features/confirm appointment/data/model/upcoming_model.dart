class UpcomingAppointment {
  final List<AppointmentDetails> appointmentDetails;
  final String message;
  final int status;

  UpcomingAppointment({
    required this.appointmentDetails,
    required this.message,
    required this.status,
  });

  factory UpcomingAppointment.fromJson(Map<String, dynamic> json) {
    return UpcomingAppointment(
      appointmentDetails: List<AppointmentDetails>.from(
        json['appointment_details'].map((x) => AppointmentDetails.fromJson(x)),
      ),
      message: json['message'],
      status: json['status'],
    );
  }
}
class AppointmentDetails {
  final int appointmentId;
  final String doctorImage;
  final String doctorName;
  final String specialization;
  final String appointmentDate;
  final String appointmentTime;

  AppointmentDetails({
    required this.appointmentId,
    required this.doctorImage,
    required this.doctorName,
    required this.specialization,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) {
    return AppointmentDetails(
      appointmentId: json['appointment_id'],
      doctorImage: json['doctor_image'],
      doctorName: json['doctor_name'],
      specialization: json['specialization'],
      appointmentDate: json['appointment_date'],
      appointmentTime: json['appointment_time'],
    );
  }
}
