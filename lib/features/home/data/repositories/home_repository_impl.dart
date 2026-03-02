import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/home/data/datasources/home_remote_data_source.dart';
import 'package:ticket/features/home/data/models/branch_home_model.dart';
import 'package:ticket/features/home/data/models/city_model.dart';
import 'package:ticket/features/home/data/models/offer_model.dart';
import 'package:ticket/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<List<CityModel>>> getCities() async {
    return await remoteDataSource.getCities();
  }

  @override
  Future<ApiResponse<List<BranchHomeModel>>> getBranches(String lang) async {
    return await remoteDataSource.getBranches(lang);
  }

  @override
  Future<ApiResponse<List<OfferModel>>> getOffers(
    String lang, {
    List<String>? types,
  }) async {
    return await remoteDataSource.getOffers(lang, types: types);
  }
}
