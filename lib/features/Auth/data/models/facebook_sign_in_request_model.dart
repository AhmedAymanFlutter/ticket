class FacebookSignInRequestModel {
  final String accessToken;

  FacebookSignInRequestModel({required this.accessToken});

  Map<String, dynamic> toJson() {
    return {'accessToken': accessToken};
  }
}
