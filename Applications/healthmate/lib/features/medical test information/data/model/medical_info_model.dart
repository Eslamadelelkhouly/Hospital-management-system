import 'dart:convert';

class MedicalInfoModel {
  final MedicalInfoData data;
  final String message;
  final int status;

  MedicalInfoModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory MedicalInfoModel.fromJson(Map<String, dynamic> json) {
    return MedicalInfoModel(
      data: MedicalInfoData.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }
}

class MedicalInfoData {
  final int id;
  final String testName;
  final String description;
  final Map<String, List<String>> schedule;
  final String cost;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalInfoData({
    required this.id,
    required this.testName,
    required this.description,
    required this.schedule,
    required this.cost,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalInfoData.fromJson(Map<String, dynamic> json) {
    // Decode schedule string to Map
    final Map<String, dynamic> scheduleMap = Map<String, dynamic>.from(
      jsonDecode(json['schedule']),
    );

    final Map<String, List<String>> parsedSchedule = scheduleMap.map(
      (key, value) => MapEntry(key, List<String>.from(value)),
    );

    return MedicalInfoData(
      id: json['id'],
      testName: json['test_name'],
      description: json['description'],
      schedule: parsedSchedule,
      cost: json['cost'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
