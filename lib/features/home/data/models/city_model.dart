import 'package:ticket/features/home/data/models/country_model.dart';

class CityModel {
  final String id;
  final String name;
  final String nameAr;
  final String nameEn;
  final CountryModel? country;
  final String description;
  final String descriptionAr;
  final String descriptionEn;
  final String? imageCover;
  final List<String> images;
  final String slug;
  final String? alt;

  CityModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    this.country,
    required this.description,
    required this.descriptionAr,
    required this.descriptionEn,
    this.imageCover,
    this.images = const [],
    required this.slug,
    this.alt,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      nameAr: json['nameAr'] ?? '',
      nameEn: json['nameEn'] ?? '',
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
      description: json['description'] ?? '',
      descriptionAr: json['descTextAr'] ?? json['descriptionAr'] ?? '',
      descriptionEn: json['descTextEn'] ?? json['descriptionEn'] ?? '',
      imageCover: json['imageCover'],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      slug: json['slug'] ?? '',
      alt: json['alt'],
    );
  }

  String getName(String lang) => lang == 'ar' ? nameAr : nameEn;
  String getDescription(String lang) {
    String text = lang == 'ar' ? descriptionAr : descriptionEn;
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ').trim();
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'country': country?.toJson(),
      'description': description,
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'imageCover': imageCover,
      'images': images,
      'slug': slug,
      'alt': alt,
    };
  }
}
