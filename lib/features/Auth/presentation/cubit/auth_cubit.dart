import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket/features/auth/data/models/signup_request_model.dart';
import 'package:ticket/features/auth/data/models/login_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/login_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:ticket/features/auth/domain/usecases/facebook_sign_in_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:ticket/features/auth/data/models/google_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/facebook_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/send_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/reset_password_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ticket/core/network/local_data.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final SignupResponseModel response;

  const AuthSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthOtpSent extends AuthState {
  final String email;

  AuthOtpSent({required this.email});

  @override
  List<Object?> get props => [email];
}

class AuthOtpVerified extends AuthState {
  final String resetToken;
  AuthOtpVerified({required this.resetToken});

  @override
  List<Object?> get props => [resetToken];
}

class AuthPasswordResetSuccess extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final GetMeUseCase getMeUseCase;
  final SendOtpUseCase sendOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final FacebookSignInUseCase facebookSignInUseCase;

  AuthCubit({
    required this.signupUseCase,
    required this.loginUseCase,
    required this.getMeUseCase,
    required this.sendOtpUseCase,
    required this.resetPasswordUseCase,
    required this.verifyOtpUseCase,
    required this.googleSignInUseCase,
    required this.facebookSignInUseCase,
  }) : super(AuthInitial());

  Future<void> signup(SignupRequestModel signupRequest) async {
    emit(AuthLoading());
    final result = await signupUseCase(signupRequest);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) => emit(AuthSuccess(response)),
    );
  }

  Future<void> login(LoginRequestModel loginRequest) async {
    emit(AuthLoading());
    final result = await loginUseCase(loginRequest);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) => emit(AuthSuccess(response)),
    );
  }

  Future<void> getMe() async {
    emit(AuthLoading());
    final result = await getMeUseCase();
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) => emit(AuthSuccess(response)),
    );
  }

  Future<void> sendOtp(SendOtpRequestModel sendOtpRequest) async {
    emit(AuthLoading());
    final result = await sendOtpUseCase(sendOtpRequest);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) => emit(AuthOtpSent(email: sendOtpRequest.email)),
    );
  }

  Future<void> verifyOtp(VerifyOtpRequestModel verifyOtpRequest) async {
    emit(AuthLoading());
    final result = await verifyOtpUseCase(verifyOtpRequest);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) =>
          emit(AuthOtpVerified(resetToken: response.data?.resetToken ?? "")),
    );
  }

  Future<void> resetPassword(
    ResetPasswordRequestModel resetPasswordRequest,
  ) async {
    emit(AuthLoading());
    final result = await resetPasswordUseCase(resetPasswordRequest);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) => emit(AuthPasswordResetSuccess()),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await LocalData.clear();
    if (isClosed) return;
    emit(AuthInitial());
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(AuthLoading());
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId:
            '742535730094-ljv9dcdntv3afkacp0hhfsdrl64r2t9v.apps.googleusercontent.com',
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        emit(AuthInitial());
        return;
      }
      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        emit(const AuthError("Failed to get ID Token from Google"));
        return;
      }

      final result = await googleSignInUseCase(
        GoogleSignInRequestModel(idToken: idToken),
      );

      if (isClosed) return;
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (response) => emit(AuthSuccess(response)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      emit(AuthLoading());
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!.tokenString;
        final response = await facebookSignInUseCase(
          FacebookSignInRequestModel(accessToken: accessToken),
        );

        if (isClosed) return;
        response.fold(
          (failure) => emit(AuthError(failure.message)),
          (response) => emit(AuthSuccess(response)),
        );
      } else if (result.status == LoginStatus.cancelled) {
        emit(AuthInitial());
      } else {
        emit(AuthError(result.message ?? "Facebook login failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
