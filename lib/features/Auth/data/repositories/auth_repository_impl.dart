import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/core/network/local_data.dart';
import 'package:ticket/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ticket/features/auth/data/models/signup_request_model.dart';
import 'package:ticket/features/auth/data/models/login_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/data/models/send_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/reset_password_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_response_model.dart';
import 'package:ticket/features/auth/data/models/google_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/facebook_sign_in_request_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SignupResponseModel>> signup(
    SignupRequestModel signupRequest,
  ) async {
    try {
      final response = await remoteDataSource.signup(signupRequest);
      if (response.data != null) {
        await LocalData.saveTokens(accessToken: response.data!.token);
        await LocalData.saveUserData(
          userId: response.data!.id,
          userName: response.data!.name,
          userEmail: response.data!.email,
          userRole: response.data!.role,
        );
      }
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> login(
    LoginRequestModel loginRequest,
  ) async {
    try {
      final response = await remoteDataSource.login(loginRequest);
      if (response.data != null) {
        await LocalData.saveTokens(accessToken: response.data!.token);
        await LocalData.saveUserData(
          userId: response.data!.id,
          userName: response.data!.name,
          userEmail: response.data!.email,
          userRole: response.data!.role,
        );
      }
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> getMe() async {
    try {
      final response = await remoteDataSource.getMe();
      if (response.data != null) {
        await LocalData.saveUserData(
          userId: response.data!.id,
          userName: response.data!.name,
          userEmail: response.data!.email,
          userRole: response.data!.role,
        );
      }
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> sendOtp(
    SendOtpRequestModel sendOtpRequest,
  ) async {
    try {
      final response = await remoteDataSource.sendOtp(sendOtpRequest);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequest,
  ) async {
    try {
      final response = await remoteDataSource.resetPassword(
        resetPasswordRequest,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(
    VerifyOtpRequestModel verifyOtpRequest,
  ) async {
    try {
      final response = await remoteDataSource.verifyOtp(verifyOtpRequest);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> googleSignIn(
    GoogleSignInRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.googleSignIn(request);
      if (response.data != null) {
        await LocalData.saveTokens(accessToken: response.data!.token);
        await LocalData.saveUserData(
          userId: response.data!.id,
          userName: response.data!.name,
          userEmail: response.data!.email,
          userRole: response.data!.role,
        );
      }
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> facebookSignIn(
    FacebookSignInRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.facebookSignIn(request);
      if (response.data != null) {
        await LocalData.saveTokens(accessToken: response.data!.token);
        await LocalData.saveUserData(
          userId: response.data!.id,
          userName: response.data!.name,
          userEmail: response.data!.email,
          userRole: response.data!.role,
        );
      }
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
