import '../entities/airline_entity.dart';
import '../entities/flight_destination_entity.dart';
import '../entities/flight_itinerary_entity.dart';

abstract class TripsRepository {
  Future<List<FlightDestinationEntity>> searchDestinations(String query);
  Future<List<AirlineEntity>> getAirlines();
  Future<FlightSearchResponseEntity> searchFlights({
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
