import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/services/data/models/service_model.dart';
import 'package:ticket/features/services/data/models/service_settings_model.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';

abstract class ServicesRepository {
  Future<Either<Failure, List<ServiceModel>>> getServices(String lang);
  Future<Either<Failure, ServiceSettingsModel>> getServiceSettings(String lang);
  Future<Either<Failure, AppSettingsModel>> getAppSettings(String lang);
}
