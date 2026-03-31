import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String countryCode;
  final String city;
  final String role;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.city,
    required this.role,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    countryCode,
    city,
    role,
    isActive,
  ];
}
