import 'package:equatable/equatable.dart';
import '../../domain/entities/airline_entity.dart';
import '../../domain/entities/flight_destination_entity.dart';
import '../../domain/entities/flight_itinerary_entity.dart';

class FlightSearchState extends Equatable {
  final FlightDestinationEntity? fromCity;
  final FlightDestinationEntity? toCity;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final bool isRoundTrip;
  final int adults;
  final int children;
  final int infants;
  final List<FlightDestinationEntity> searchResults;
  final bool isSearching;
  final String? errorMessage;
  final List<AirlineEntity> airlines;
  final bool isLoadingAirlines;
  final String cabinClass;
  final List<int> childrenAges;
  final FlightSearchResponseEntity? searchResponse;
  final bool isLoadingFlights;
  final String email;
  final String phone;

  const FlightSearchState({
    this.fromCity,
    this.toCity,
    this.departureDate,
    this.returnDate,
    this.isRoundTrip = true,
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
    this.searchResults = const [],
    this.isSearching = false,
    this.errorMessage,
    this.airlines = const [],
    this.isLoadingAirlines = false,
    this.cabinClass = 'ECONOMY',
    this.childrenAges = const [],
    this.searchResponse,
    this.isLoadingFlights = false,
    this.email = '',
    this.phone = '',
  });

  int get passengerCount => adults + children + infants;

  FlightSearchState copyWith({
    FlightDestinationEntity? fromCity,
    FlightDestinationEntity? toCity,
    DateTime? departureDate,
    DateTime? returnDate,
    bool? isRoundTrip,
    int? adults,
    int? children,
    int? infants,
    List<FlightDestinationEntity>? searchResults,
    bool? isSearching,
    String? errorMessage,
    List<AirlineEntity>? airlines,
    bool? isLoadingAirlines,
    String? cabinClass,
    List<int>? childrenAges,
    FlightSearchResponseEntity? searchResponse,
    bool? isLoadingFlights,
    String? email,
    String? phone,
  }) {
    return FlightSearchState(
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      isRoundTrip: isRoundTrip ?? this.isRoundTrip,
      adults: adults ?? this.adults,
      children: children ?? this.children,
      infants: infants ?? this.infants,
      searchResults: searchResults ?? this.searchResults,
      isSearching: isSearching ?? this.isSearching,
      errorMessage: errorMessage ?? this.errorMessage,
      airlines: airlines ?? this.airlines,
      isLoadingAirlines: isLoadingAirlines ?? this.isLoadingAirlines,
      cabinClass: cabinClass ?? this.cabinClass,
      childrenAges: childrenAges ?? this.childrenAges,
      searchResponse: searchResponse ?? this.searchResponse,
      isLoadingFlights: isLoadingFlights ?? this.isLoadingFlights,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [
        fromCity,
        toCity,
        departureDate,
        returnDate,
        isRoundTrip,
        adults,
        children,
        infants,
        searchResults,
        isSearching,
        errorMessage,
        airlines,
        isLoadingAirlines,
        cabinClass,
        childrenAges,
        searchResponse,
        isLoadingFlights,
        email,
        phone,
      ];
}
