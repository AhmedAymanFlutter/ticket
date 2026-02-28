import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/features/services/data/models/service_model.dart';
import 'package:ticket/features/services/data/models/service_settings_model.dart';
import 'package:ticket/features/services/data/models/app_settings_model.dart';

abstract class ServicesRemoteDataSource {
  Future<List<ServiceModel>> getServices(String lang);
  Future<ServiceSettingsModel> getServiceSettings(String lang);
  Future<AppSettingsModel> getAppSettings(String lang);
}

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  @override
  Future<List<ServiceModel>> getServices(String lang) async {
    final response = await APIHelper().getRequest<List<ServiceModel>>(
      endPoint: '/services',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null &&
            json['data']['services'] != null) {
          final dataList = json['data']['services'] as List<dynamic>;
          return dataList.map((e) => ServiceModel.fromJson(e)).toList();
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
  Future<ServiceSettingsModel> getServiceSettings(String lang) async {
    final response = await APIHelper().getRequest<ServiceSettingsModel>(
      endPoint: '/services',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null &&
            json['data']['settings'] != null) {
          return ServiceSettingsModel.fromJson(json['data']['settings']);
        }
        throw Exception('Invalid response for service settings');
      },
    );

    if (response.isSuccess) {
      return response.data!;
    } else {
      throw Exception(response.message ?? 'Unknown Error');
    }
  }

  @override
  Future<AppSettingsModel> getAppSettings(String lang) async {
    final response = await APIHelper().getRequest<AppSettingsModel>(
      endPoint: '/settings',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null) {
          return AppSettingsModel.fromJson(json['data']);
        }
        throw Exception('Invalid response for app settings');
      },
    );

    if (response.isSuccess) {
      return response.data!;
    } else {
      throw Exception(response.message ?? 'Unknown Error');
    }
  }
}
