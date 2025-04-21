class BookingAvaliabaleModel {
  final List<String> availableAppointments;
  final String date;
  final String message;
  final int status;

  BookingAvaliabaleModel({
    required this.availableAppointments,
    required this.date,
    required this.message,
    required this.status,
  });

  factory BookingAvaliabaleModel.fromJson(Map<String, dynamic> json) {
    return BookingAvaliabaleModel(
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
