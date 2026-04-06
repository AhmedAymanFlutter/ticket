import 'package:ticket/core/network/api_endpoint.dart';
import 'package:ticket/core/network/api_helper.dart';
import 'package:ticket/features/hotels/data/models/hotel_details_model.dart';
import 'package:ticket/features/hotels/data/models/hotel_model.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelModel>> getHotels();
  Future<HotelDetailsModel> getHotelDetails(dynamic id);
}

class HotelsRemoteDataSourceImpl implements HotelsRemoteDataSource {
  final APIHelper apiHelper;

  HotelsRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<List<HotelModel>> getHotels() async {
    final response = await apiHelper.getRequest(
      endPoint: EndPoints.hotels,
      isProtected: true,
    );

    if (response.isSuccess && response.data != null) {
      final List hotelsJson = response.data['data']['hotels'];
      return hotelsJson.map((json) => HotelModel.fromJson(json)).toList();
    } else {
      throw Exception(response.message ?? 'Failed to load hotels');
    }
  }

  @override
  Future<HotelDetailsModel> getHotelDetails(dynamic id) async {
    final response = await apiHelper.getRequest(
      endPoint: EndPoints.hotelDetails(id),
      isProtected: true,
    );

    if (response.isSuccess && response.data != null) {
      return HotelDetailsModel.fromJson(response.data['data']);
    } else {
      throw Exception(response.message ?? 'Failed to load hotel details');
    }
  }
}
