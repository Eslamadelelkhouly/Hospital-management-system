import 'dart:convert';

class DoctorsResponse {
  final List<Doctor> doctors;
  final String message;
  final int status;

  DoctorsResponse({
    required this.doctors,
    required this.message,
    required this.status,
  });

  factory DoctorsResponse.fromJson(Map<String, dynamic> json) {
    return DoctorsResponse(
      doctors: (json['doctors'] as List<dynamic>?)
              ?.map((x) => Doctor.fromJson(x))
              .toList() ??
          [],
      message: json['message']?.toString() ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String rating;
  final int specId;
  final int cityId;
  final DoctorImage image;
  final DoctorInformation information;
  final Specialization specialization;
  final City city;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.rating,
    required this.specId,
    required this.cityId,
    required this.image,
    required this.information,
    required this.specialization,
    required this.city,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,
      firstName: json['firstName']?.toString() ?? '',
      lastName: json['lastName']?.toString() ?? '',
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      rating: json['rating']?.toString() ?? '0.0',
      specId: json['spec_id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      image: json['image'] != null
          ? DoctorImage.fromJson(json['image'])
          : DoctorImage(
              id: 0,
              doctorId: 0,
              imageName: 'default.png',
            ),
      information: json['information'] != null
          ? DoctorInformation.fromJson(json['information'])
          : DoctorInformation(
              id: 0,
              doctorId: 0,
              about: '',
              experience: 0,
              numberOfPatients: 0,
              schedule: '{}',
              salary: '0.00',
            ),
      specialization: json['specialization'] != null
          ? Specialization.fromJson(json['specialization'])
          : Specialization(
              id: 0,
              name: 'Unknown',
            ),
      city: json['city'] != null
          ? City.fromJson(json['city'])
          : City(
              id: 0,
              name: 'Unknown',
            ),
    );
  }

  Map<String, dynamic> getSchedule() {
    try {
      return jsonDecode(information.schedule) as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }
}

class DoctorImage {
  final int id;
  final int doctorId;
  final String imageName;

  DoctorImage({
    required this.id,
    required this.doctorId,
    required this.imageName,
  });

  factory DoctorImage.fromJson(Map<String, dynamic> json) {
    return DoctorImage(
      id: json['id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      imageName: json['image_name']?.toString() ?? 'default.png',
    );
  }
}

class DoctorInformation {
  final int id;
  final int doctorId;
  final String about;
  final int experience;
  final int numberOfPatients;
  final String schedule;
  final String salary;

  DoctorInformation({
    required this.id,
    required this.doctorId,
    required this.about,
    required this.experience,
    required this.numberOfPatients,
    required this.schedule,
    required this.salary,
  });

  factory DoctorInformation.fromJson(Map<String, dynamic> json) {
    return DoctorInformation(
      id: json['id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      about: json['about']?.toString() ?? '',
      experience: json['experience'] ?? 0,
      numberOfPatients: json['number_of_patients'] ?? 0,
      schedule: json['schedule']?.toString() ?? '{}',
      salary: json['salary']?.toString() ?? '0.00',
    );
  }
}

class Specialization {
  final int id;
  final String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? 'Unknown',
    );
  }
}

class City {
  final int id;
  final String name;

  City({
    required this.id,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? 'Unknown',
    );
  }
}
