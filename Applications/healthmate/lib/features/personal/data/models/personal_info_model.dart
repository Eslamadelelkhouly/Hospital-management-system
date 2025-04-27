class PersonalInfoModel {
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

  PersonalInfoModel({
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
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
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
    };
  }
}
