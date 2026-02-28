import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/features/packages/data/models/package_details_model.dart';
import 'package:ticket/features/packages/data/models/package_type_country_model.dart';
import 'package:ticket/features/packages/data/models/package_type_model.dart';

abstract class PackagesRemoteDataSource {
  Future<List<PackageTypeModel>> getPackageTypes(String lang);
  Future<List<PackageTypeCountryModel>> getPackageTypeCountries(
    String slug,
    String lang,
  );
  Future<PackageDetailsModel> getPackageDetails(
    String packageTypeSlug,
    String packageSlug,
    String lang,
  );
}

class PackagesRemoteDataSourceImpl implements PackagesRemoteDataSource {
  @override
  Future<List<PackageTypeModel>> getPackageTypes(String lang) async {
    final response = await APIHelper().getRequest<List<PackageTypeModel>>(
      endPoint: '/packageTypes',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null) {
          final dataList = json['data'] as List<dynamic>;
          return dataList.map((e) => PackageTypeModel.fromJson(e)).toList();
        }
        return [];
      },
    );
    if (response.isSuccess) {
      return response.data ?? [];
    } else {
      throw Exception(response.message ?? 'Unknown Error');
    }
  }

  @override
  Future<List<PackageTypeCountryModel>> getPackageTypeCountries(
    String slug,
    String lang,
  ) async {
    final response = await APIHelper()
        .getRequest<List<PackageTypeCountryModel>>(
          endPoint: '/packageTypes/$slug',
          queryParameters: {'lang': lang},
          isProtected: false,
          parser: (json) {
            if (json != null &&
                json is Map<String, dynamic> &&
                json['data'] != null) {
              final dataList = json['data'] as List<dynamic>;
              return dataList
                  .map((e) => PackageTypeCountryModel.fromJson(e))
                  .toList();
            }
            return [];
          },
        );
    if (response.isSuccess) {
      return response.data ?? [];
    } else {
      throw Exception(response.message ?? 'Unknown Error');
    }
  }

  @override
  Future<PackageDetailsModel> getPackageDetails(
    String packageTypeSlug,
    String packageSlug,
    String lang,
  ) async {
    final response = await APIHelper().getRequest<PackageDetailsModel>(
      endPoint: '/packageTypes/$packageTypeSlug/countries/$packageSlug',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null) {
          return PackageDetailsModel.fromJson(json['data']);
        }
        throw Exception('Invalid response');
      },
    );
    if (response.isSuccess) {
      return response.data!;
    } else {
      throw Exception(response.message ?? 'Unknown Error');
    }
  }
}
