import 'package:equatable/equatable.dart';

class PackageTypeCountryModel extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String? imageCover;
  final List<PackageCountryCityModel> cities;

  const PackageTypeCountryModel({
    required this.id,
    required this.name,
    required this.slug,
    this.imageCover,
    required this.cities,
  });

  factory PackageTypeCountryModel.fromJson(Map<String, dynamic> json) {
    return PackageTypeCountryModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      imageCover: json['imageCover'],
      cities: (json['cities'] as List? ?? [])
          .map((e) => PackageCountryCityModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, name, slug, imageCover, cities];
}

class PackageCountryCityModel extends Equatable {
  final String id;
  final String? name;

  const PackageCountryCityModel({required this.id, this.name});

  factory PackageCountryCityModel.fromJson(Map<String, dynamic> json) {
    return PackageCountryCityModel(id: json['_id'], name: json['name']);
  }

  @override
  List<Object?> get props => [id, name];
}
