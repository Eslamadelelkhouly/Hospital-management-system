import 'dart:convert';

class MedicalTestsResponse {
  final List<MedicalTest> data;
  final String message;
  final int status;

  MedicalTestsResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory MedicalTestsResponse.fromJson(Map<String, dynamic> json) {
    return MedicalTestsResponse(
      data: List<MedicalTest>.from(json['data'].map((x) => MedicalTest.fromJson(x))),
      message: json['message'],
      status: json['status'],
    );
  }
}

class MedicalTest {
  final int id;
  final String testName;
  final String description;
  final Map<String, List<String>> schedule;
  final String cost;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalTest({
    required this.id,
    required this.testName,
    required this.description,
    required this.schedule,
    required this.cost,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalTest.fromJson(Map<String, dynamic> json) {
    final scheduleMap = jsonDecode(json['schedule']) as Map<String, dynamic>;
    return MedicalTest(
      id: json['id'],
      testName: json['test_name'],
      description: json['description'],
      schedule: scheduleMap.map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
      cost: json['cost'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
