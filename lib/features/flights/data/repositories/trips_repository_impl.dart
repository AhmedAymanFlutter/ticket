import '../../domain/entities/airline_entity.dart';
import '../../domain/entities/flight_destination_entity.dart';
import '../../domain/entities/flight_itinerary_entity.dart';
import '../../domain/repositories/trips_repository.dart';
import '../data_sources/trips_remote_data_source.dart';

class TripsRepositoryImpl implements TripsRepository {
  final TripsRemoteDataSource remoteDataSource;

  TripsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<FlightDestinationEntity>> searchDestinations(String query) async {
    try {
      final destinations = await remoteDataSource.searchDestinations(query);
      return destinations;
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }

  @override
  Future<List<AirlineEntity>> getAirlines() async {
    try {
      final airlines = await remoteDataSource.getAirlines();
      return airlines;
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }

  @override
  Future<FlightSearchResponseEntity> searchFlights({
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
      final response = await remoteDataSource.searchFlights(
        fromId: fromId,
        toId: toId,
        departDate: departDate,
        returnDate: returnDate,
        adults: adults,
        childrenAges: childrenAges,
        infants: infants,
        cabinClass: cabinClass,
      );
      return response;
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }
}
