import '../../domain/entities/flight_itinerary_entity.dart';

class FlightSearchResponseModel extends FlightSearchResponseEntity {
  const FlightSearchResponseModel({
    required super.count,
    required super.tripType,
    required super.filters,
    required super.itineraries,
    required super.flightDeals,
  });

  factory FlightSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return FlightSearchResponseModel(
      count: json['count'] ?? 0,
      tripType: json['tripType'] ?? '',
      filters: FlightFiltersModel.fromJson(json['filters'] ?? {}),
      itineraries: (json['itineraries'] as List?)
              ?.map((e) => FlightItineraryModel.fromJson(e))
              .toList() ??
          [],
      flightDeals: FlightDealsModel.fromJson(json['flightDeals'] ?? {}),
    );
  }
}

class FlightFiltersModel extends FlightFiltersEntity {
  const FlightFiltersModel({
    required super.minPrice,
    required super.currency,
    required super.airlines,
    required super.stops,
  });

  factory FlightFiltersModel.fromJson(Map<String, dynamic> json) {
    return FlightFiltersModel(
      minPrice: (json['minPrice'] ?? 0).toDouble(),
      currency: json['currency'] ?? '',
      airlines: (json['airlines'] as List?)
              ?.map((e) => FlightFilterAirlineModel.fromJson(e))
              .toList() ??
          [],
      stops: (json['stops'] as List?)
              ?.map((e) => FlightFilterStopModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class FlightFilterAirlineModel extends FlightFilterAirlineEntity {
  const FlightFilterAirlineModel({
    required super.name,
    required super.code,
    required super.logo,
    required super.minPrice,
  });

  factory FlightFilterAirlineModel.fromJson(Map<String, dynamic> json) {
    return FlightFilterAirlineModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      logo: json['logo'] ?? '',
      minPrice: (json['minPrice'] ?? 0).toDouble(),
    );
  }
}

class FlightFilterStopModel extends FlightFilterStopEntity {
  const FlightFilterStopModel({
    required super.count,
    required super.label,
    required super.minPrice,
  });

  factory FlightFilterStopModel.fromJson(Map<String, dynamic> json) {
    return FlightFilterStopModel(
      count: json['count'] ?? 0,
      label: json['label'] ?? '',
      minPrice: (json['minPrice'] ?? 0).toDouble(),
    );
  }
}

class FlightDealsModel extends FlightDealsEntity {
  const FlightDealsModel({
    super.cheapest,
    super.fastest,
    super.best,
  });

  factory FlightDealsModel.fromJson(Map<String, dynamic> json) {
    return FlightDealsModel(
      cheapest: json['CHEAPEST'] != null
          ? FlightDealItemModel.fromJson(json['CHEAPEST'])
          : null,
      fastest: json['FASTEST'] != null
          ? FlightDealItemModel.fromJson(json['FASTEST'])
          : null,
      best: json['BEST'] != null
          ? FlightDealItemModel.fromJson(json['BEST'])
          : null,
    );
  }
}

class FlightDealItemModel extends FlightDealItemEntity {
  const FlightDealItemModel({
    required super.price,
    required super.currencyCode,
  });

  factory FlightDealItemModel.fromJson(Map<String, dynamic> json) {
    return FlightDealItemModel(
      price: (json['price'] ?? 0).toDouble(),
      currencyCode: json['currencyCode'] ?? '',
    );
  }
}

class FlightItineraryModel extends FlightItineraryEntity {
  const FlightItineraryModel({
    required super.token,
    required super.totalPrice,
    required super.currencyCode,
    required super.cabinClass,
    required super.airline,
    required super.baggage,
    super.seatsLeft,
    required super.handoverSummary,
    required super.outbound,
    super.returnLeg,
    required super.isCheapest,
    required super.isFastest,
    required super.isBest,
  });

  factory FlightItineraryModel.fromJson(Map<String, dynamic> json) {
    return FlightItineraryModel(
      token: json['token'] ?? '',
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      currencyCode: json['currencyCode'] ?? '',
      cabinClass: json['cabinClass'] ?? '',
      airline: FlightAirlineModel.fromJson(json['airline'] ?? {}),
      baggage: FlightBaggageModel.fromJson(json['baggage'] ?? {}),
      seatsLeft: json['seatsLeft'],
      handoverSummary: json['handoverSummary'] ?? '',
      outbound: FlightLegModel.fromJson(json['outbound'] ?? {}),
      returnLeg: json['return'] != null
          ? FlightLegModel.fromJson(json['return'])
          : null,
      isCheapest: json['isCheapest'] ?? false,
      isFastest: json['isFastest'] ?? false,
      isBest: json['isBest'] ?? false,
    );
  }
}

class FlightAirlineModel extends FlightAirlineEntity {
  const FlightAirlineModel({
    required super.name,
    required super.logo,
    required super.code,
  });

  factory FlightAirlineModel.fromJson(Map<String, dynamic> json) {
    return FlightAirlineModel(
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      code: json['code'] ?? '',
    );
  }
}

class FlightBaggageModel extends FlightBaggageEntity {
  const FlightBaggageModel({
    required super.personalItem,
    required super.cabinBag,
    required super.checkedBag,
    required super.summary,
  });

  factory FlightBaggageModel.fromJson(Map<String, dynamic> json) {
    return FlightBaggageModel(
      personalItem: json['personalItem'] ?? false,
      cabinBag: json['cabinBag'] ?? false,
      checkedBag: json['checkedBag'] ?? false,
      summary: json['summary'] ?? '',
    );
  }
}

class FlightLegModel extends FlightLegEntity {
  const FlightLegModel({
    required super.origin,
    required super.destination,
    required super.departureTime,
    required super.arrivalTime,
    required super.formattedTimes,
    required super.totalDuration,
    required super.totalSeconds,
    required super.stopsCount,
    required super.stopsLabel,
    required super.connections,
  });

  factory FlightLegModel.fromJson(Map<String, dynamic> json) {
    return FlightLegModel(
      origin: FlightStationModel.fromJson(json['origin'] ?? {}),
      destination: FlightStationModel.fromJson(json['destination'] ?? {}),
      departureTime: json['departureTime'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      formattedTimes: Map<String, String>.from(json['formattedTimes'] ?? {}),
      totalDuration: json['totalDuration'] ?? '',
      totalSeconds: json['totalSeconds'] ?? 0,
      stopsCount: json['stopsCount'] ?? 0,
      stopsLabel: json['stopsLabel'] ?? '',
      connections: (json['connections'] as List?)
              ?.map((e) => FlightConnectionModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class FlightStationModel extends FlightStationEntity {
  const FlightStationModel({
    required super.code,
    required super.name,
    required super.city,
  });

  factory FlightStationModel.fromJson(Map<String, dynamic> json) {
    return FlightStationModel(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      city: json['city'] ?? '',
    );
  }
}

class FlightConnectionModel extends FlightConnectionEntity {
  const FlightConnectionModel({
    required super.flightNumber,
    required super.carrier,
    required super.origin,
    required super.destination,
    super.departureTerminal,
    super.arrivalTerminal,
    required super.departureTime,
    required super.arrivalTime,
    required super.duration,
    super.layoverInfo,
  });

  factory FlightConnectionModel.fromJson(Map<String, dynamic> json) {
    return FlightConnectionModel(
      flightNumber: json['flightNumber'] ?? '',
      carrier: FlightAirlineModel.fromJson(json['carrier'] ?? {}),
      origin: json['origin'] ?? '',
      destination: json['destination'] ?? '',
      departureTerminal: json['departureTerminal'],
      arrivalTerminal: json['arrivalTerminal'],
      departureTime: json['departureTime'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      duration: json['duration'] ?? '',
      layoverInfo: json['layoverInfo'] != null
          ? FlightLayoverModel.fromJson(json['layoverInfo'])
          : null,
    );
  }
}

class FlightLayoverModel extends FlightLayoverEntity {
  const FlightLayoverModel({
    required super.duration,
    required super.airport,
  });

  factory FlightLayoverModel.fromJson(Map<String, dynamic> json) {
    return FlightLayoverModel(
      duration: json['duration'] ?? '',
      airport: json['airport'] ?? '',
    );
  }
}
