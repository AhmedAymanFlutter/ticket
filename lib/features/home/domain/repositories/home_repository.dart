import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/home/data/models/branch_home_model.dart';
import 'package:ticket/features/home/data/models/city_model.dart';
import 'package:ticket/features/home/data/models/offer_model.dart';

abstract class HomeRepository {
  Future<ApiResponse<List<CityModel>>> getCities();
  Future<ApiResponse<List<BranchHomeModel>>> getBranches(String lang);
  Future<ApiResponse<List<OfferModel>>> getOffers(
    String lang, {
    List<String>? types,
  });
}
