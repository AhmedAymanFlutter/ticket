import 'package:ticket/core/network/api_endpoint.dart';
import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/features/auth/data/models/signup_request_model.dart';
import 'package:ticket/features/auth/data/models/login_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/data/models/send_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/reset_password_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_response_model.dart';
import 'package:ticket/features/auth/data/models/google_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/facebook_sign_in_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<SignupResponseModel> signup(SignupRequestModel signupRequest);
  Future<SignupResponseModel> login(LoginRequestModel loginRequest);
  Future<SignupResponseModel> getMe();
  Future<SignupResponseModel> sendOtp(SendOtpRequestModel sendOtpRequest);
  Future<SignupResponseModel> resetPassword(
    ResetPasswordRequestModel resetPasswordRequest,
  );
  Future<VerifyOtpResponseModel> verifyOtp(
    VerifyOtpRequestModel verifyOtpRequest,
  );
  Future<SignupResponseModel> googleSignIn(GoogleSignInRequestModel request);
  Future<SignupResponseModel> facebookSignIn(
    FacebookSignInRequestModel request,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final APIHelper apiHelper;

  AuthRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<SignupResponseModel> signup(SignupRequestModel signupRequest) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.signup,
      data: signupRequest.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<SignupResponseModel> login(LoginRequestModel loginRequest) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.login,
      data: loginRequest.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<SignupResponseModel> getMe() async {
    final response = await apiHelper.getRequest(
      endPoint: EndPoints.getMe,
      isProtected: true,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<SignupResponseModel> sendOtp(
    SendOtpRequestModel sendOtpRequest,
  ) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.sendOtp,
      data: sendOtpRequest.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<SignupResponseModel> resetPassword(
    ResetPasswordRequestModel resetPasswordRequest,
  ) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.resetPassword,
      data: resetPasswordRequest.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(
    VerifyOtpRequestModel verifyOtpRequest,
  ) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.verifyOtp,
      data: verifyOtpRequest.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return VerifyOtpResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<SignupResponseModel> googleSignIn(
    GoogleSignInRequestModel request,
  ) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.googleLogin,
      data: request.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }

  @override
  Future<SignupResponseModel> facebookSignIn(
    FacebookSignInRequestModel request,
  ) async {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.facebookLogin,
      data: request.toJson(),
      isFormData: false,
      isAuthorized: false,
    );

    if (response.isSuccess && response.data != null) {
      return SignupResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Unknown error');
    }
  }
}
