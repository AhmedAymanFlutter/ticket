import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/signup_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase({required this.repository});

  Future<Either<Failure, SignupResponseModel>> call(
    SignupRequestModel signupRequest,
  ) async {
    return await repository.signup(signupRequest);
  }
}
