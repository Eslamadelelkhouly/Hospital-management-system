class PersonalInfoModel {
  final Patient patient;
  final String message;
  final int status;

  PersonalInfoModel({
    required this.patient,
    required this.message,
    required this.status,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      patient: Patient.fromJson(json['patient']),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patient': patient.toJson(),
      'message': message,
      'status': status,
    };
  }
}

class Patient {
  final int id;
  final String fullName;
  final String email;
  final String dateOfBirth;
  final String? gender;
  final String? phoneNumber;
  final String? address;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final ImageModel? image;

  Patient({
    required this.id,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    this.gender,
    this.phoneNumber,
    this.address,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.image,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      dateOfBirth: json['DateofBirth'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'DateofBirth': dateOfBirth,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'image': image?.toJson(),
    };
  }
}

class ImageModel {
  final int id;
  final String imageName;
  final int patientId;
  final String createdAt;
  final String updatedAt;

  ImageModel({
    required this.id,
    required this.imageName,
    required this.patientId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      imageName: json['image_name'],
      patientId: json['patient_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_name': imageName,
      'patient_id': patientId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
