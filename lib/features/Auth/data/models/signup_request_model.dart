class SignupRequestModel {
  final String name;
  final String email;
  final String phone;
  final String countryCode;
  final String password;
  final String city;

  SignupRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.password,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'countryCode': countryCode,
      'password': password,
      'city': city,
    };
  }
}
