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
      message: json['message'],
      status: json['status'],
    );
  }
}

class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String specialization;
  final int experience;
  final String rating;
  final String about;
  final String salary;
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
    return Doctor(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullName: json['full_name'],
      specialization: json['specialization'],
      experience: json['experience'],
      rating: json['rating'],
      about: json['about'],
      salary: json['salary'],
      schedule: Map<String, List<String>>.from(
        jsonDecode(json['schedule']).map(
          (key, value) => MapEntry(key, List<String>.from(value)),
        ),
      ),
      imageName: json['image_name'],
    );
  }
}
