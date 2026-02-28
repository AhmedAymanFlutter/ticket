import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/services/data/datasources/services_remote_data_source.dart';
import 'package:ticket/features/services/data/models/service_model.dart';
import 'package:ticket/features/services/data/models/service_settings_model.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';
import 'package:ticket/features/services/domain/repositories/services_repository.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesRemoteDataSource remoteDataSource;

  ServicesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ServiceModel>>> getServices(String lang) async {
    try {
      final services = await remoteDataSource.getServices(lang);
      return Right(services);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServiceSettingsModel>> getServiceSettings(
    String lang,
  ) async {
    try {
      final settings = await remoteDataSource.getServiceSettings(lang);
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppSettingsModel>> getAppSettings(String lang) async {
    try {
      final settings = await remoteDataSource.getAppSettings(lang);
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
