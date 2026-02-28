import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/packages/data/datasources/packages_remote_data_source.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';
import 'package:ticket/features/packages/data/models/package_type_country_model.dart';
import 'package:ticket/features/packages/data/models/package_type_model.dart';
import 'package:ticket/features/packages/domain/repositories/packages_repository.dart';

class PackagesRepositoryImpl implements PackagesRepository {
  final PackagesRemoteDataSource remoteDataSource;

  PackagesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PackageTypeModel>>> getPackageTypes(
    String lang,
  ) async {
    try {
      final result = await remoteDataSource.getPackageTypes(lang);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'Server Error'));
    }
  }

  @override
  Future<Either<Failure, List<PackageTypeCountryModel>>>
  getPackageTypeCountries(String slug, String lang) async {
    try {
      final result = await remoteDataSource.getPackageTypeCountries(slug, lang);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'Server Error'));
    }
  }

  @override
  Future<Either<Failure, PackageDetailsModel>> getPackageDetails(
    String packageTypeSlug,
    String packageSlug,
    String lang,
  ) async {
    try {
      final result = await remoteDataSource.getPackageDetails(
        packageTypeSlug,
        packageSlug,
        lang,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'Server Error'));
    }
  }
}
