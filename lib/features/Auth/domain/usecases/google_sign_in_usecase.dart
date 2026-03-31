import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/auth/data/models/google_sign_in_request_model.dart';
import 'package:ticket/features/auth/data/models/signup_response_model.dart';
import 'package:ticket/features/auth/domain/repositories/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<Either<Failure, SignupResponseModel>> call(
    GoogleSignInRequestModel request,
  ) async {
    return await repository.googleSignIn(request);
  }
}
