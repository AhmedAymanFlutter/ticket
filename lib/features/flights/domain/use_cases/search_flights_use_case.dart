import '../entities/flight_itinerary_entity.dart';
import '../repositories/trips_repository.dart';

class SearchFlightsUseCase {
  final TripsRepository repository;

  SearchFlightsUseCase(this.repository);

  Future<FlightSearchResponseEntity> call({
    required String fromId,
    required String toId,
    required String departDate,
    String? returnDate,
    required int adults,
    required String childrenAges,
    required int infants,
    required String cabinClass,
  }) async {
    return await repository.searchFlights(
      fromId: fromId,
      toId: toId,
      departDate: departDate,
      returnDate: returnDate,
      adults: adults,
      childrenAges: childrenAges,
      infants: infants,
      cabinClass: cabinClass,
    );
  }
}
