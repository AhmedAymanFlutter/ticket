class VerifyOtpResponseModel {
  final bool? success;
  final String? message;
  final VerifyOtpData? data;

  VerifyOtpResponseModel({this.success, this.message, this.data});

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? VerifyOtpData.fromJson(json['data']) : null,
    );
  }
}

class VerifyOtpData {
  final bool? verified;
  final String? resetToken;

  VerifyOtpData({this.verified, this.resetToken});

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) {
    return VerifyOtpData(
      verified: json['verified'],
      resetToken: json['resetToken'],
    );
  }
}
