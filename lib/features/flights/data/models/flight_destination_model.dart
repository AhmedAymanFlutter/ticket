import '../../domain/entities/flight_destination_entity.dart';

class FlightDestinationModel extends FlightDestinationEntity {
  const FlightDestinationModel({
    required super.id,
    required super.name,
    required super.code,
    required super.cityName,
    required super.countryName,
    required super.type,
    required super.photo,
  });

  factory FlightDestinationModel.fromJson(Map<String, dynamic> json) {
    return FlightDestinationModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      cityName: json['cityName'] ?? '',
      countryName: json['countryName'] ?? '',
      type: json['type'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'cityName': cityName,
      'countryName': countryName,
      'type': type,
      'photo': photo,
    };
  }
}
