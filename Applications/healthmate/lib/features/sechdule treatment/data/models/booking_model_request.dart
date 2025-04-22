class AppointmentModelRequest {
  final int docId;
  final String appointTime;
  final String appointDate;

  AppointmentModelRequest({
    required this.docId,
    required this.appointTime,
    required this.appointDate,
  });

  // Convert JSON to Dart object
  factory AppointmentModelRequest.fromJson(Map<String, dynamic> json) {
    return AppointmentModelRequest(
      docId: json['doc_id'],
      appointTime: json['appoint_time'],
      appointDate: json['appoint_date'],
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'doc_id': docId,
      'appoint_time': appointTime,
      'appoint_date': appointDate,
    };
  }
}
