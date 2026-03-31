class LoginRequestModel {
  final String phone;
  final String countryCode;
  final String password;

  LoginRequestModel({
    required this.phone,
    required this.countryCode,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'phone': phone, 'countryCode': countryCode, 'password': password};
  }
}
