import 'package:ticket/features/home/data/models/country_model.dart';

class CityModel {
  final String id;
  final String name;
  final CountryModel? country;
  final String description;
  final String? imageCover;
  final List<String> images;
  final String slug;
  final String? alt;

  CityModel({
    required this.id,
    required this.name,
    this.country,
    required this.description,
    this.imageCover,
    this.images = const [],
    required this.slug,
    this.alt,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
      description: json['description'] ?? '',
      imageCover: json['imageCover'],
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      slug: json['slug'] ?? '',
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'country': country?.toJson(),
      'description': description,
      'imageCover': imageCover,
      'images': images,
      'slug': slug,
      'alt': alt,
    };
  }
}
