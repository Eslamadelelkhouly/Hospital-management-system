class FavoriteDoctorsResponse {
  final List<DoctorModel> favoriteDoctors;
  final String message;
  final int status;

  FavoriteDoctorsResponse({
    required this.favoriteDoctors,
    required this.message,
    required this.status,
  });

  factory FavoriteDoctorsResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteDoctorsResponse(
      favoriteDoctors: (json['favorite_doctors'] as List)
          .map((e) => DoctorModel.fromJson(e))
          .toList(),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'favorite_doctors': favoriteDoctors.map((e) => e.toJson()).toList(),
        'message': message,
        'status': status,
      };
}

class DoctorModel {
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
  final String createdAt;
  final String updatedAt;
  final PivotModel pivot;
  final ImageModel image;

  DoctorModel({
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
    required this.pivot,
    required this.image,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: PivotModel.fromJson(json['pivot']),
      image: ImageModel.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() => {
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
        'created_at': createdAt,
        'updated_at': updatedAt,
        'pivot': pivot.toJson(),
        'image': image.toJson(),
      };
}

class PivotModel {
  final int patientId;
  final int doctorId;
  final String createdAt;
  final String updatedAt;

  PivotModel({
    required this.patientId,
    required this.doctorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PivotModel.fromJson(Map<String, dynamic> json) {
    return PivotModel(
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'patient_id': patientId,
        'doctor_id': doctorId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class ImageModel {
  final int id;
  final int doctorId;
  final String imageName;

  ImageModel({
    required this.id,
    required this.doctorId,
    required this.imageName,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      imageName: json['image_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'doctor_id': doctorId,
        'image_name': imageName,
      };
}
