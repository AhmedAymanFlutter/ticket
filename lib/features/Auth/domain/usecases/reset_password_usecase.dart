import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/data/models/reset_password_request_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase({required this.repository});

  Future<Either<Failure, SignupResponseModel>> call(
    ResetPasswordRequestModel resetPasswordRequest,
  ) async {
    return await repository.resetPassword(resetPasswordRequest);
  }
}
