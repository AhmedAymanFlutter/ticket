import 'package:equatable/equatable.dart';

class PackageDetailsModel extends Equatable {
  final PackageInfoModel pkg;
  final List<PackageBranchModel> branches;

  const PackageDetailsModel({required this.pkg, required this.branches});

  factory PackageDetailsModel.fromJson(Map<String, dynamic> json) {
    return PackageDetailsModel(
      pkg: PackageInfoModel.fromJson(json['pkg']),
      branches: (json['branches'] as List)
          .map((e) => PackageBranchModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [pkg, branches];
}

class PackageInfoModel extends Equatable {
  final String id;
  final String name;
  final String slug;
  final double ratingsAverage;
  final int ratingsQuantity;

  const PackageInfoModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.ratingsAverage,
    required this.ratingsQuantity,
  });

  factory PackageInfoModel.fromJson(Map<String, dynamic> json) {
    return PackageInfoModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
    );
  }

  @override
  List<Object?> get props => [id, name, slug, ratingsAverage, ratingsQuantity];
}

class PackageBranchModel extends Equatable {
  final String id;
  final String name;
  final int totalBranchPrice;
  final int daysCount;
  final int nightsCount;
  final String? imageCover;
  final List<BranchCityModel> cities;
  final List<PackageDayModel> days;

  const PackageBranchModel({
    required this.id,
    required this.name,
    required this.totalBranchPrice,
    required this.daysCount,
    required this.nightsCount,
    this.imageCover,
    required this.cities,
    required this.days,
  });

  factory PackageBranchModel.fromJson(Map<String, dynamic> json) {
    return PackageBranchModel(
      id: json['_id'],
      name: json['name'],
      totalBranchPrice: json['totalBranchPrice'],
      daysCount: json['daysCount'],
      nightsCount: json['nightsCount'],
      imageCover: json['imageCover'],
      cities: (json['cities'] as List)
          .map((e) => BranchCityModel.fromJson(e))
          .toList(),
      days: (json['days'] as List)
          .map((e) => PackageDayModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    totalBranchPrice,
    daysCount,
    nightsCount,
    imageCover,
    cities,
    days,
  ];
}

class BranchCityModel extends Equatable {
  final String id;
  final String? name;
  final String slug;

  const BranchCityModel({required this.id, this.name, required this.slug});

  factory BranchCityModel.fromJson(Map<String, dynamic> json) {
    return BranchCityModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  @override
  List<Object?> get props => [id, name, slug];
}

class PackageDayModel extends Equatable {
  final int dayNumber;
  final String type;
  final int price;
  final String? title;
  final String? description;
  final PackageTourDetailsModel? tour;

  const PackageDayModel({
    required this.dayNumber,
    required this.type,
    required this.price,
    this.title,
    this.description,
    this.tour,
  });

  factory PackageDayModel.fromJson(Map<String, dynamic> json) {
    return PackageDayModel(
      dayNumber: json['dayNumber'],
      type: json['type'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
      tour: json['tour'] != null
          ? PackageTourDetailsModel.fromJson(json['tour'])
          : null,
    );
  }

  @override
  List<Object?> get props => [dayNumber, type, price, title, description, tour];
}

class PackageTourDetailsModel extends Equatable {
  final String id;
  final String title;
  final List<String> inclusions;
  final List<String> exclusions;
  final double ratingAverage;
  final int ratingCount;
  final int price;

  const PackageTourDetailsModel({
    required this.id,
    required this.title,
    required this.inclusions,
    required this.exclusions,
    required this.ratingAverage,
    required this.ratingCount,
    required this.price,
  });

  factory PackageTourDetailsModel.fromJson(Map<String, dynamic> json) {
    return PackageTourDetailsModel(
      id: json['_id'],
      title: json['title'],
      inclusions: (json['inclusions'] as List)
          .map((e) => e['description'] as String)
          .toList(),
      exclusions: (json['exclusions'] as List)
          .map((e) => e['description'] as String)
          .toList(),
      ratingAverage: (json['rating']['average'] as num).toDouble(),
      ratingCount: json['rating']['count'],
      price: json['price'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    inclusions,
    exclusions,
    ratingAverage,
    ratingCount,
    price,
  ];
}
