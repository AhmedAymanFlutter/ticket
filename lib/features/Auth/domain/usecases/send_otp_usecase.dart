import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/send_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase({required this.repository});

  Future<Either<Failure, SignupResponseModel>> call(
    SendOtpRequestModel sendOtpRequest,
  ) async {
    return await repository.sendOtp(sendOtpRequest);
  }
}
