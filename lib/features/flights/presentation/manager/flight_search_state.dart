import 'package:equatable/equatable.dart';

class FlightSearchState extends Equatable {
  final bool isRoundTrip;
  final String? fromCity;
  final String? toCity;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final int passengerCount;
  final String email;
  final String phone;

  const FlightSearchState({
    this.isRoundTrip = true,
    this.fromCity,
    this.toCity,
    this.departureDate,
    this.returnDate,
    this.passengerCount = 1,
    this.email = '',
    this.phone = '',
  });

  FlightSearchState copyWith({
    bool? isRoundTrip,
    String? fromCity,
    String? toCity,
    DateTime? departureDate,
    DateTime? returnDate,
    int? passengerCount,
    String? email,
    String? phone,
  }) {
    return FlightSearchState(
      isRoundTrip: isRoundTrip ?? this.isRoundTrip,
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      passengerCount: passengerCount ?? this.passengerCount,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

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
