import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/flight_destination_entity.dart';
import '../../domain/use_cases/get_airlines_use_case.dart';
import '../../domain/use_cases/search_flight_destinations_use_case.dart';
import '../../domain/use_cases/search_flights_use_case.dart';
import 'flight_search_state.dart';
import 'package:intl/intl.dart';

class FlightSearchCubit extends Cubit<FlightSearchState> {
  final SearchFlightDestinationsUseCase searchFlightDestinationsUseCase;
  final GetAirlinesUseCase getAirlinesUseCase;
  final SearchFlightsUseCase searchFlightsUseCase;

  FlightSearchCubit(
    this.searchFlightDestinationsUseCase,
    this.getAirlinesUseCase,
    this.searchFlightsUseCase,
  ) : super(const FlightSearchState()) {
    getAirlines();
  }

  Future<void> getAirlines() async {
    emit(state.copyWith(isLoadingAirlines: true, errorMessage: null));
    try {
      final airlinesList = await getAirlinesUseCase();
      if (isClosed) return;
      emit(state.copyWith(airlines: airlinesList, isLoadingAirlines: false));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isLoadingAirlines: false, errorMessage: e.toString()));
    }
  }

  Future<void> searchDestinations(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(searchResults: [], isSearching: false, errorMessage: null));
      return;
    }

    emit(state.copyWith(isSearching: true, errorMessage: null));

    try {
      final destinations = await searchFlightDestinationsUseCase(query);
      if (isClosed) return;
      emit(state.copyWith(searchResults: destinations, isSearching: false));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isSearching: false, errorMessage: e.toString()));
    }
  }

  void clearSearchResults() {
    emit(state.copyWith(searchResults: [], isSearching: false, errorMessage: null));
  }

  void updateFromCity(FlightDestinationEntity city) {
    emit(state.copyWith(fromCity: city));
  }

  void updateToCity(FlightDestinationEntity city) {
    emit(state.copyWith(toCity: city));
  }

  void updateDepartureDate(DateTime date) {
    emit(state.copyWith(departureDate: date));
  }

  void updateReturnDate(DateTime date) {
    emit(state.copyWith(returnDate: date));
  }

  void toggleTripType(bool isRoundTrip) {
    emit(state.copyWith(isRoundTrip: isRoundTrip));
  }

  void updatePassengers({
    int? adults,
    int? children,
    int? infants,
    List<int>? childrenAges,
  }) {
    emit(state.copyWith(
      adults: adults ?? state.adults,
      children: children ?? state.children,
      infants: infants ?? state.infants,
      childrenAges: childrenAges ?? state.childrenAges,
    ));
  }

  void updatePassengerCount(int count) {
    if (count > 0) {
      emit(state.copyWith(adults: count));
    }
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void swapStations() {
    emit(state.copyWith(fromCity: state.toCity, toCity: state.fromCity));
  }

  void updateCabinClass(String cabinClass) {
    emit(state.copyWith(cabinClass: cabinClass));
  }

  Future<void> submitRequest() => searchFlights();

  Future<void> searchFlights() async {
    if (state.fromCity == null || state.toCity == null || state.departureDate == null) {
      emit(state.copyWith(errorMessage: 'يرجى استكمال بيانات البحث'));
      return;
    }

    emit(state.copyWith(isLoadingFlights: true, errorMessage: null));

    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd', 'en');
      final departStr = formatter.format(state.departureDate!);
      final returnStr = state.isRoundTrip && state.returnDate != null
          ? formatter.format(state.returnDate!)
          : null;

      final childrenAgesStr = state.childrenAges.join(',');

      final response = await searchFlightsUseCase(
        fromId: state.fromCity!.id,
        toId: state.toCity!.id,
        departDate: departStr,
        returnDate: returnStr,
        adults: state.adults,
        childrenAges: childrenAgesStr,
        infants: state.infants,
        cabinClass: state.cabinClass,
      );

      if (isClosed) return;
      emit(state.copyWith(searchResponse: response, isLoadingFlights: false));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isLoadingFlights: false, errorMessage: e.toString()));
    }
  }
}
