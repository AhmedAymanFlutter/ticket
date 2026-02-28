import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/tours/data/datasources/tours_remote_data_source.dart';
import 'package:ticket/features/tours/data/models/tour_model.dart';
import 'package:ticket/features/tours/data/models/tour_details_model.dart';
import 'package:ticket/features/tours/domain/repositories/tours_repository.dart';

class ToursRepositoryImpl implements ToursRepository {
  final ToursRemoteDataSource remoteDataSource;

  ToursRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<TourDetailsModel>> getTourDetails(
    String lang,
    String productCode,
  ) async {
    return await remoteDataSource.getTourDetails(lang, productCode);
  }

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
    return await remoteDataSource.getTours(
      lang,
      search: search,
      city: city,
      minPrice: minPrice,
      maxPrice: maxPrice,
      page: page,
      limit: limit,
    );
  }
}
