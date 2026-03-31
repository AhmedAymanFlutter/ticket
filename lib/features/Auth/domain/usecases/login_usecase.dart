import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/login_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, SignupResponseModel>> call(
    LoginRequestModel loginRequest,
  ) async {
    return await repository.login(loginRequest);
  }
}
