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

  Map<String, dynamic> toJson() {
    return {
      'doctors': doctors.map((x) => x.toJson()).toList(),
      'message': message,
      'status': status,
    };
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
  final int specId;
  final int userId;
  final int cityId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DoctorImage image;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    required this.rating,
    required this.specId,
    required this.userId,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
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
      specId: json['spec_id'],
      userId: json['user_id'],
      cityId: json['city_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      image: DoctorImage.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'rating': rating,
      'spec_id': specId,
      'user_id': userId,
      'city_id': cityId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'image': image.toJson(),
    };
  }
}

class DoctorImage {
  final int id;
  final String imageName;
  final int doctorId;
  final DateTime createdAt;
  final DateTime updatedAt;

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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_name': imageName,
      'doctor_id': doctorId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
