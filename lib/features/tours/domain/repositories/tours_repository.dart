import 'package:ticket/core/network/api_response.dart';
import 'package:ticket/features/tours/data/models/tour_model.dart';
import 'package:ticket/features/tours/data/models/tour_details_model.dart';

abstract class ToursRepository {
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
