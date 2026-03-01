import '../../../../core/network/api_response.dart';
import '../datasources/travel_guide_remote_data_source.dart';
import '../models/country_model.dart';

class TravelGuideRepository {
  final TravelGuideRemoteDataSource _remoteDataSource;

  TravelGuideRepository(this._remoteDataSource);

  Future<ApiResponse<List<CountryModel>>> getCountries() async {
    return await _remoteDataSource.getCountries();
  }

  Future<ApiResponse<CountryModel>> getCountryDetails(String slug) async {
    return await _remoteDataSource.getCountryDetails(slug);
  }
}
