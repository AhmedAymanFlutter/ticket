import '../entities/flight_destination_entity.dart';
import '../repositories/trips_repository.dart';

class SearchFlightDestinationsUseCase {
  final TripsRepository repository;

  SearchFlightDestinationsUseCase(this.repository);

  Future<List<FlightDestinationEntity>> call(String query) async {
    return await repository.searchDestinations(query);
  }
}
