import '../entities/airline_entity.dart';
import '../repositories/trips_repository.dart';

class GetAirlinesUseCase {
  final TripsRepository repository;

  GetAirlinesUseCase(this.repository);

  Future<List<AirlineEntity>> call() async {
    return await repository.getAirlines();
  }
}
