import 'package:ticket/features/auth/domain/entities/user_entity.dart';

class SignupResponseModel {
  final bool success;
  final String message;
  final SignupDataModel? data;

  SignupResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    final success = json['success'] == true || json['status'] == 'success';
    final rootToken = json['token'] as String?;

    return SignupResponseModel(
      success: success,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? SignupDataModel.fromJson(json['data'], rootToken: rootToken)
          : null,
    );
  }
}

class SignupDataModel extends UserEntity {
  final String token;

  const SignupDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.countryCode,
    required super.city,
    required super.role,
    required super.isActive,
    required this.token,
  });

  factory SignupDataModel.fromJson(
    Map<String, dynamic> json, {
    String? rootToken,
  }) {
    // Check if user data is nested (common in social logins)
    final Map<String, dynamic> userData = json['user'] is Map<String, dynamic>
        ? json['user']
        : json;

    return SignupDataModel(
      id: userData['_id']?.toString() ?? userData['id']?.toString() ?? '',
      name: userData['name'] ?? '',
      email: userData['email'] ?? '',
      phone: userData['phone'] ?? '',
      countryCode: userData['countryCode'] ?? '',
      city: userData['city'] ?? '',
      role: userData['role'] ?? '',
      isActive: userData['isActive'] ?? false,
      token: userData['token']?.toString() ?? rootToken ?? '',
    );
  }
}
