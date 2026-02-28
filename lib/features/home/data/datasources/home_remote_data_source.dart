import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/home/data/models/city_model.dart';
import 'package:ticket/features/home/data/models/offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResponse<List<CityModel>>> getCities(String lang);
  Future<ApiResponse<List<OfferModel>>> getOffers(
    String lang, {
    List<String>? types,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<ApiResponse<List<CityModel>>> getCities(String lang) async {
    return await APIHelper().getRequest<List<CityModel>>(
      endPoint: '/cities',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null) {
          final dataList = json['data'] as List<dynamic>;
          return dataList.map((e) => CityModel.fromJson(e)).toList();
        }
        return [];
      },
    );
  }

  @override
  Future<ApiResponse<List<OfferModel>>> getOffers(
    String lang, {
    List<String>? types,
  }) async {
    // Construct query parameters
    final Map<String, dynamic> queryParams = {'lang': lang};

    if (types != null && types.isNotEmpty) {
      queryParams['type'] = types.first;
    }

    return await APIHelper().getRequest<List<OfferModel>>(
      endPoint: '/offers',
      queryParameters: queryParams,
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null &&
            json['data']['offers'] != null) {
          final dataList = json['data']['offers'] as List<dynamic>;
          return dataList.map((e) => OfferModel.fromJson(e)).toList();
        }
        return [];
      },
    );
  }
}
