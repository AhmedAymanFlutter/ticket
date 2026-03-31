import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/facebook_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class FacebookSignInUseCase {
  final AuthRepository repository;

  FacebookSignInUseCase({required this.repository});

  Future<Either<Failure, SignupResponseModel>> call(
    FacebookSignInRequestModel request,
  ) async {
    return await repository.facebookSignIn(request);
  }
}
