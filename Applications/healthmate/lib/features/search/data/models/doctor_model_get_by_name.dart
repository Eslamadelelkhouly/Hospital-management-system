import 'dart:convert';

class DoctorSearch {
  final List<Doctor> doctors;
  final String message;
  final int status;

  DoctorSearch({
    required this.doctors,
    required this.message,
    required this.status,
  });

  factory DoctorSearch.fromJson(Map<String, dynamic> json) {
    return DoctorSearch(
      doctors: (json['doctors'] as List)
          .map((doctor) => Doctor.fromJson(doctor))
          .toList(),
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String specialization;
  final int? experience;
  final double rating;
  final String about;
  final String? salary;
  final Map<String, List<String>> schedule;
  final String imageName;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.about,
    required this.salary,
    required this.schedule,
    required this.imageName,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    final rawSchedule = json['schedule'];
    final decodedSchedule = rawSchedule is String
        ? jsonDecode(rawSchedule)
        : rawSchedule;

    return Doctor(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      fullName: json['full_name'] ?? '',
      specialization: json['specialization'] ?? '',
      experience: json['experience'] as int?,
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      about: json['about'] ?? '',
      salary: json['salary'] as String?,
      schedule: Map<String, List<String>>.from(
        decodedSchedule.map(
          (key, value) => MapEntry(key.toString(), List<String>.from(value)),
        ),
      ),
      imageName: json['image_name'] ?? '',
    );
  }
}
