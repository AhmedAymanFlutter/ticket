import 'package:dartz/dartz.dart';
import 'package:ticket/core/error/failures.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';
import 'package:ticket/features/packages/data/models/package_type_country_model.dart';
import 'package:ticket/features/packages/data/models/package_type_model.dart';

abstract class PackagesRepository {
  Future<Either<Failure, List<PackageTypeModel>>> getPackageTypes(String lang);
  Future<Either<Failure, List<PackageTypeCountryModel>>>
  getPackageTypeCountries(String slug, String lang);
  Future<Either<Failure, PackageDetailsModel>> getPackageDetails(
    String packageTypeSlug,
    String packageSlug,
    String lang,
  );
}
