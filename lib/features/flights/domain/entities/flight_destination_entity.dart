import 'package:equatable/equatable.dart';

class FlightDestinationEntity extends Equatable {
  final String id;
  final String name;
  final String code;
  final String cityName;
  final String countryName;
  final String type; // CITY or AIRPORT
  final String photo;

  const FlightDestinationEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.cityName,
    required this.countryName,
    required this.type,
    required this.photo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        cityName,
        countryName,
        type,
        photo,
      ];
}
