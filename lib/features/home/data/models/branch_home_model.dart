import 'package:equatable/equatable.dart';

class BranchHomeModel extends Equatable {
  final String id;
  final String name;
  final String? imageCover;
  final List<String> cities;
  final int daysCount;
  final int nightsCount;
  final int price;
  final String? package;
  final String slug;
  final String? alt;

  const BranchHomeModel({
    required this.id,
    required this.name,
    this.imageCover,
    required this.cities,
    required this.daysCount,
    required this.nightsCount,
    required this.price,
    this.package,
    required this.slug,
    this.alt,
  });

  factory BranchHomeModel.fromJson(Map<String, dynamic> json) {
    return BranchHomeModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      imageCover: json['imageCover'],
      cities:
          (json['cities'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      daysCount: json['daysCount'] ?? 0,
      nightsCount: json['nightsCount'] ?? 0,
      price: json['price'] ?? 0,
      package: json['package'],
      slug: json['slug'] ?? '',
      alt: json['alt'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    imageCover,
    cities,
    daysCount,
    nightsCount,
    price,
    package,
    slug,
    alt,
  ];
}
