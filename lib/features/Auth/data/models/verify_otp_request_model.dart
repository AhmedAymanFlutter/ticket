class VerifyOtpRequestModel {
  final String otpCode;

  VerifyOtpRequestModel({required this.otpCode});

  Map<String, dynamic> toJson() {
    return {'otpCode': otpCode};
  }
}
