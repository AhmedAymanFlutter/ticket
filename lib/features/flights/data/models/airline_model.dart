import '../../domain/entities/airline_entity.dart';

class AirlineModel extends AirlineEntity {
  const AirlineModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.slug,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageCover']?['url'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
