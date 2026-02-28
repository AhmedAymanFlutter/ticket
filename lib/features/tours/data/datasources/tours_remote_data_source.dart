import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/tours/data/models/tour_model.dart';
import 'package:ticket/features/tours/data/models/tour_details_model.dart';

abstract class ToursRemoteDataSource {
  Future<ApiResponse<TourDetailsModel>> getTourDetails(
    String lang,
    String productCode,
  );
  Future<ApiResponse<List<TourModel>>> getTours(
    String lang, {
    String? search,
    String? city,
    int? minPrice,
    int? maxPrice,
    int page = 1,
    int limit = 20,
  });
}

class ToursRemoteDataSourceImpl implements ToursRemoteDataSource {
  @override
  Future<ApiResponse<List<TourModel>>> getTours(
    String lang, {
    String? search,
    String? city,
    int? minPrice,
    int? maxPrice,
    int page = 1,
    int limit = 20,
  }) async {
    final queryParams = <String, dynamic>{
      'lang': lang,
      'page': page,
      'limit': limit,
    };

    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    if (city != null && city.isNotEmpty) {
      queryParams['city'] = city;
    }
    if (minPrice != null) {
      queryParams['minPrice'] = minPrice;
    }
    if (maxPrice != null) {
      queryParams['maxPrice'] = maxPrice;
    }

    return await APIHelper().getRequest<List<TourModel>>(
      endPoint: '/tours',
      queryParameters: queryParams,
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['tours'] != null) {
          final dataList = json['tours'] as List<dynamic>;
          return dataList.map((e) => TourModel.fromJson(e)).toList();
        }
        return [];
      },
    );
  }

  @override
  Future<ApiResponse<TourDetailsModel>> getTourDetails(
    String lang,
    String productCode,
  ) async {
    return await APIHelper().getRequest<TourDetailsModel>(
      endPoint: '/tours/$productCode',
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json != null &&
            json is Map<String, dynamic> &&
            json['data'] != null) {
          return TourDetailsModel.fromJson(json['data']);
        }
        throw Exception('Invalid data format');
      },
    );
  }
}
