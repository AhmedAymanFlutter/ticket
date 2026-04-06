import 'package:equatable/equatable.dart';

class FlightSearchResponseEntity extends Equatable {
  final int count;
  final String tripType;
  final FlightFiltersEntity filters;
  final List<FlightItineraryEntity> itineraries;
  final FlightDealsEntity flightDeals;

  const FlightSearchResponseEntity({
    required this.count,
    required this.tripType,
    required this.filters,
    required this.itineraries,
    required this.flightDeals,
  });

  @override
  List<Object?> get props =>
      [count, tripType, filters, itineraries, flightDeals];
}

class FlightFiltersEntity extends Equatable {
  final double minPrice;
  final String currency;
  final List<FlightFilterAirlineEntity> airlines;
  final List<FlightFilterStopEntity> stops;

  const FlightFiltersEntity({
    required this.minPrice,
    required this.currency,
    required this.airlines,
    required this.stops,
  });

  @override
  List<Object?> get props => [minPrice, currency, airlines, stops];
}

class FlightFilterAirlineEntity extends Equatable {
  final String name;
  final String code;
  final String logo;
  final double minPrice;

  const FlightFilterAirlineEntity({
    required this.name,
    required this.code,
    required this.logo,
    required this.minPrice,
  });

  @override
  List<Object?> get props => [name, code, logo, minPrice];
}

class FlightFilterStopEntity extends Equatable {
  final int count;
  final String label;
  final double minPrice;

  const FlightFilterStopEntity({
    required this.count,
    required this.label,
    required this.minPrice,
  });

  @override
  List<Object?> get props => [count, label, minPrice];
}

class FlightDealsEntity extends Equatable {
  final FlightDealItemEntity? cheapest;
  final FlightDealItemEntity? fastest;
  final FlightDealItemEntity? best;

  const FlightDealsEntity({
    this.cheapest,
    this.fastest,
    this.best,
  });

  @override
  List<Object?> get props => [cheapest, fastest, best];
}

class FlightDealItemEntity extends Equatable {
  final double price;
  final String currencyCode;

  const FlightDealItemEntity({
    required this.price,
    required this.currencyCode,
  });

  @override
  List<Object?> get props => [price, currencyCode];
}

class FlightItineraryEntity extends Equatable {
  final String token;
  final double totalPrice;
  final String currencyCode;
  final String cabinClass;
  final FlightAirlineEntity airline;
  final FlightBaggageEntity baggage;
  final int? seatsLeft;
  final String handoverSummary;
  final FlightLegEntity outbound;
  final FlightLegEntity? returnLeg;
  final bool isCheapest;
  final bool isFastest;
  final bool isBest;

  const FlightItineraryEntity({
    required this.token,
    required this.totalPrice,
    required this.currencyCode,
    required this.cabinClass,
    required this.airline,
    required this.baggage,
    this.seatsLeft,
    required this.handoverSummary,
    required this.outbound,
    this.returnLeg,
    required this.isCheapest,
    required this.isFastest,
    required this.isBest,
  });

  @override
  List<Object?> get props => [
        token,
        totalPrice,
        currencyCode,
        cabinClass,
        airline,
        baggage,
        seatsLeft,
        handoverSummary,
        outbound,
        returnLeg,
        isCheapest,
        isFastest,
        isBest,
      ];
}

class FlightAirlineEntity extends Equatable {
  final String name;
  final String logo;
  final String code;

  const FlightAirlineEntity({
    required this.name,
    required this.logo,
    required this.code,
  });

  @override
  List<Object?> get props => [name, logo, code];
}

class FlightBaggageEntity extends Equatable {
  final bool personalItem;
  final bool cabinBag;
  final bool checkedBag;
  final String summary;

  const FlightBaggageEntity({
    required this.personalItem,
    required this.cabinBag,
    required this.checkedBag,
    required this.summary,
  });

  @override
  List<Object?> get props => [personalItem, cabinBag, checkedBag, summary];
}

class FlightLegEntity extends Equatable {
  final FlightStationEntity origin;
  final FlightStationEntity destination;
  final String departureTime;
  final String arrivalTime;
  final Map<String, String> formattedTimes;
  final String totalDuration;
  final int totalSeconds;
  final int stopsCount;
  final String stopsLabel;
  final List<FlightConnectionEntity> connections;

  const FlightLegEntity({
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.formattedTimes,
    required this.totalDuration,
    required this.totalSeconds,
    required this.stopsCount,
    required this.stopsLabel,
    required this.connections,
  });

  @override
  List<Object?> get props => [
        origin,
        destination,
        departureTime,
        arrivalTime,
        formattedTimes,
        totalDuration,
        totalSeconds,
        stopsCount,
        stopsLabel,
        connections,
      ];
}

class FlightStationEntity extends Equatable {
  final String code;
  final String name;
  final String city;

  const FlightStationEntity({
    required this.code,
    required this.name,
    required this.city,
  });

  @override
  List<Object?> get props => [code, name, city];
}

class FlightConnectionEntity extends Equatable {
  final String flightNumber;
  final FlightAirlineEntity carrier;
  final String origin;
  final String destination;
  final String? departureTerminal;
  final String? arrivalTerminal;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final FlightLayoverEntity? layoverInfo;

  const FlightConnectionEntity({
    required this.flightNumber,
    required this.carrier,
    required this.origin,
    required this.destination,
    this.departureTerminal,
    this.arrivalTerminal,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    this.layoverInfo,
  });

  @override
  List<Object?> get props => [
        flightNumber,
        carrier,
        origin,
        destination,
        departureTerminal,
        arrivalTerminal,
        departureTime,
        arrivalTime,
        duration,
        layoverInfo,
      ];
}

class FlightLayoverEntity extends Equatable {
  final String duration;
  final String airport;

  const FlightLayoverEntity({
    required this.duration,
    required this.airport,
  });

  @override
  List<Object?> get props => [duration, airport];
}
