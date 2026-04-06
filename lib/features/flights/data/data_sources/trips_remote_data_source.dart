import 'package:ticket/core/network/api_endpoint.dart';
import 'package:ticket/core/network/api_helper.dart';
import '../models/airline_model.dart';
import '../models/flight_destination_model.dart';
import '../models/flight_search_response_model.dart';

abstract class TripsRemoteDataSource {
  Future<List<FlightDestinationModel>> searchDestinations(String query);
  Future<List<AirlineModel>> getAirlines();
  Future<FlightSearchResponseModel> searchFlights({
    required String fromId,
    required String toId,
    required String departDate,
    String? returnDate,
    required int adults,
    required String childrenAges,
    required int infants,
    required String cabinClass,
  });
}

class TripsRemoteDataSourceImpl implements TripsRemoteDataSource {
  final APIHelper apiHelper;

  TripsRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<List<FlightDestinationModel>> searchDestinations(String query) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.flightSearchDestination,
        queryParameters: {'query': query},
      );

      if (response.isSuccess) {
        final List<dynamic> data = response.data['data'];
        return data
            .map((json) => FlightDestinationModel.fromJson(json))
            .toList();
      } else {
        throw Exception(response.message ?? 'Server Error');
      }
    } catch (e) {
      throw Exception('Server Error: $e');
    }
  }

  @override
  Future<List<AirlineModel>> getAirlines() async {
    try {
      final response =
          await apiHelper.getRequest(endPoint: EndPoints.flightAirlines);

      if (response.isSuccess) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => AirlineModel.fromJson(json)).toList();
      } else {
        throw Exception(response.message ?? 'Server Error');
      }
    } catch (e) {
      throw Exception('Server Error: $e');
    }
  }

  @override
  Future<FlightSearchResponseModel> searchFlights({
    required String fromId,
    required String toId,
    required String departDate,
    String? returnDate,
    required int adults,
    required String childrenAges,
    required int infants,
    required String cabinClass,
  }) async {
    try {
      final queryParams = {
        'fromId': fromId,
        'toId': toId,
        'departDate': departDate,
        'adults': adults,
        'cabinClass': cabinClass,
      };
      if (returnDate != null) queryParams['returnDate'] = returnDate;
      if (childrenAges.isNotEmpty) queryParams['children_ages'] = childrenAges;
      if (infants > 0) queryParams['infants'] = infants;

      final response = await apiHelper.getRequest(
        endPoint: EndPoints.flightSearch,
        queryParameters: queryParams,
      );

      if (response.isSuccess && response.data['success'] == true) {
        return FlightSearchResponseModel.fromJson(response.data['data']);
      } else {
        throw Exception(response.message ?? 'Server Error');
      }
    } catch (e) {
      throw Exception('Server Error: $e');
    }
  }
}
