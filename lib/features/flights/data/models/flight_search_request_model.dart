import '../../domain/entities/flight_search_request.dart';

class FlightSearchRequestModel extends FlightSearchRequest {
  const FlightSearchRequestModel({
    required super.isRoundTrip,
    super.fromCity,
    super.toCity,
    super.departureDate,
    super.returnDate,
    required super.passengerCount,
    required super.email,
    required super.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'is_round_trip': isRoundTrip,
      'from_city': fromCity,
      'to_city': toCity,
      'departure_date': departureDate?.toIso8601String(),
      'return_date': returnDate?.toIso8601String(),
      'passenger_count': passengerCount,
      'email': email,
      'phone': phone,
    };
  }
}
