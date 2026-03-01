import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/api_response.dart';
import '../models/country_model.dart';

class TravelGuideRemoteDataSource {
  final APIHelper _apiHelper;

  TravelGuideRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<CountryModel>>> getCountries() async {
    return await _apiHelper.getRequest<List<CountryModel>>(
      endPoint: EndPoints.countries,
      isProtected: false,
      parser: (json) {
        if (json is Map<String, dynamic> && json['data'] is List) {
          return (json['data'] as List)
              .map((item) => CountryModel.fromJson(item))
              .toList();
        }
        return [];
      },
    );
  }

  Future<ApiResponse<CountryModel>> getCountryDetails(String slug) async {
    return await _apiHelper.getRequest<CountryModel>(
      endPoint: EndPoints.countryDetails(slug),
      isProtected: false,
      parser: (json) {
        if (json is Map<String, dynamic> && json['data'] != null) {
          return CountryModel.fromJson(json['data']);
        }
        throw Exception('Invalid response structure');
      },
    );
  }
}
