import 'package:equatable/equatable.dart';

class FlightSearchRequest extends Equatable {
  final bool isRoundTrip;
  final String? fromCity;
  final String? toCity;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final int passengerCount;
  final String email;
  final String phone;

  const FlightSearchRequest({
    required this.isRoundTrip,
    this.fromCity,
    this.toCity,
    this.departureDate,
    this.returnDate,
    required this.passengerCount,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
    isRoundTrip,
    fromCity,
    toCity,
    departureDate,
    returnDate,
    passengerCount,
    email,
    phone,
  ];
}
