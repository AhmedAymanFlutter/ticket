import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/signup_request_model.dart';
import 'package:ticket/features/auth/data/models/login_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/data/models/send_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/reset_password_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_response_model.dart';
import 'package:ticket/features/auth/data/models/google_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/facebook_sign_in_request_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignupResponseModel>> signup(
    SignupRequestModel signupRequest,
  );
  Future<Either<Failure, SignupResponseModel>> login(
    LoginRequestModel loginRequest,
  );
  Future<Either<Failure, SignupResponseModel>> getMe();
  Future<Either<Failure, SignupResponseModel>> sendOtp(
    SendOtpRequestModel sendOtpRequest,
  );
  Future<Either<Failure, SignupResponseModel>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequest,
  );
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(
    VerifyOtpRequestModel verifyOtpRequest,
  );
  Future<Either<Failure, SignupResponseModel>> googleSignIn(
    GoogleSignInRequestModel request,
  );
  Future<Either<Failure, SignupResponseModel>> facebookSignIn(
    FacebookSignInRequestModel request,
  );
}
