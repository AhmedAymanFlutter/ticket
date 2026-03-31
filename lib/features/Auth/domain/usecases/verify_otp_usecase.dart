import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ticket/features/auth/data/models/verify_otp_response_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase({required this.repository});

  Future<Either<Failure, VerifyOtpResponseModel>> call(
    VerifyOtpRequestModel verifyOtpRequest,
  ) async {
    return await repository.verifyOtp(verifyOtpRequest);
  }
}
