class ResetPasswordRequestModel {
  final String resetToken;
  final String newPassword;
  final String passwordConfirm;

  ResetPasswordRequestModel({
    required this.resetToken,
    required this.newPassword,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() {
    return {
      'resetToken': resetToken,
      'newPassword': newPassword,
      'passwordConfirm': passwordConfirm,
    };
  }
}
