class GoogleSignInRequestModel {
  final String idToken;

  GoogleSignInRequestModel({required this.idToken});

  Map<String, dynamic> toJson() {
    return {'idToken': idToken};
  }
}
