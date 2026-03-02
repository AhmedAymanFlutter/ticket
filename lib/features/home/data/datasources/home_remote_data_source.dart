import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/home/data/models/branch_home_model.dart';
import 'package:ticket/features/home/data/models/city_model.dart';
import 'package:ticket/features/home/data/models/offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResponse<List<CityModel>>> getCities();
  Future<ApiResponse<List<BranchHomeModel>>> getBranches(String lang);
  Future<ApiResponse<List<OfferModel>>> getOffers(
    String lang, {
    List<String>? types,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<ApiResponse<List<CityModel>>> getCities() async {
    return await APIHelper().getRequest<List<CityModel>>(
      endPoint: '/cities',
      isProtected: false,
      parser: (json) {
        print('getCities Parser: Raw JSON received: $json');
        if (json == null) return [];

        List<dynamic>? citiesList;
        if (json is List) {
          citiesList = json;
        } else if (json is Map) {
          final data = json['data'];
          if (data is List) {
            citiesList = data;
          } else if (data is Map && data['cities'] is List) {
            citiesList = data['cities'];
          } else if (json['cities'] is List) {
            citiesList = json['cities'];
          }
        }

        if (citiesList != null) {
          final List<CityModel> cities = [];
          for (var item in citiesList) {
            try {
              if (item is Map) {
                cities.add(CityModel.fromJson(Map<String, dynamic>.from(item)));
              }
            } catch (e) {
              print('getCities Parser: Error parsing city item: $e');
              print('getCities Parser: Problematic item: $item');
            }
          }
          print(
            'getCities Parser: Successfully parsed ${cities.length} cities',
          );
          return cities;
        }

        print('getCities Parser: No city list found in response');
        return [];
      },
    );
  }

  @override
  Future<ApiResponse<List<BranchHomeModel>>> getBranches(String lang) async {
    return await APIHelper().getRequest<List<BranchHomeModel>>(
      endPoint: '/branches',
      isProtected: false,
      parser: (json) {
        if (json != null && json is Map<String, dynamic>) {
          // Robust parsing: check for 'data' directly being a list or 'data' containing a 'branches' key
          dynamic branchesData;
          if (json['data'] != null) {
            if (json['data'] is List) {
              branchesData = json['data'];
            } else if (json['data'] is Map &&
                json['data']['branches'] != null) {
              branchesData = json['data']['branches'];
            }
          }

          if (branchesData != null && branchesData is List) {
            return branchesData
                .map((e) => BranchHomeModel.fromJson(e))
                .toList();
          }
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
