class TopDoctorsResponse {
  final List<Doctor> doctors;
  final String message;
  final int status;

  TopDoctorsResponse({
    required this.doctors,
    required this.message,
    required this.status,
  });

  factory TopDoctorsResponse.fromJson(Map<String, dynamic> json) {
    return TopDoctorsResponse(
      doctors: List<Doctor>.from(json['doctors'].map((x) => Doctor.fromJson(x))),
      message: json['message'],
      status: json['status'],
    );
  }
}

class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String gender;
  final String phoneNumber;
  final String rating;
  final String createdAt;
  final String updatedAt;
  final String specializationName;
  final String cityName;
  final String userRole;
  final DoctorImage image;
  final Specialization specialization;
  final City city;
  final DoctorUser user;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.specializationName,
    required this.cityName,
    required this.userRole,
    required this.image,
    required this.specialization,
    required this.city,
    required this.user,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      rating: json['rating'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      specializationName: json['specialization_name'],
      cityName: json['city_name'],
      userRole: json['user_role'],
      image: DoctorImage.fromJson(json['image']),
      specialization: Specialization.fromJson(json['specialization']),
      city: City.fromJson(json['city']),
      user: DoctorUser.fromJson(json['user']),
    );
  }
}

class DoctorImage {
  final int id;
  final String imageName;
  final int doctorId;
  final String createdAt;
  final String updatedAt;

  DoctorImage({
    required this.id,
    required this.imageName,
    required this.doctorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorImage.fromJson(Map<String, dynamic> json) {
    return DoctorImage(
      id: json['id'],
      imageName: json['image_name'],
      doctorId: json['doctor_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Specialization {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Specialization({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class City {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  City({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class DoctorUser {
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;
  final String role;
  final String createdAt;
  final String updatedAt;

  DoctorUser({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorUser.fromJson(Map<String, dynamic> json) {
    return DoctorUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      role: json['role'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
