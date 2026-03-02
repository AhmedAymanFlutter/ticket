class GuideDetailsModel {
  final GuideCityModel? city;
  final GuideCountryModel? country;
  final String? introduction;
  final List<GuidePlaceModel> restaurants;
  final List<GuidePlaceModel> attractions;
  final List<GuidePlaceModel> placesToVisit;
  final List<GuidePlaceModel> thingsToDo;

  GuideDetailsModel({
    this.city,
    this.country,
    this.introduction,
    this.restaurants = const [],
    this.attractions = const [],
    this.placesToVisit = const [],
    this.thingsToDo = const [],
  });

  factory GuideDetailsModel.fromJson(Map<String, dynamic> json) {
    return GuideDetailsModel(
      city: json['city'] != null ? GuideCityModel.fromJson(json['city']) : null,
      country: json['country'] != null
          ? GuideCountryModel.fromJson(json['country'])
          : null,
      introduction: json['introduction'],
      restaurants:
          (json['restaurants'] as List<dynamic>?)
              ?.map((e) => GuidePlaceModel.fromJson(e))
              .toList() ??
          [],
      attractions:
          (json['attractions'] as List<dynamic>?)
              ?.map((e) => GuidePlaceModel.fromJson(e))
              .toList() ??
          [],
      placesToVisit:
          (json['placesToVisit'] as List<dynamic>?)
              ?.map((e) => GuidePlaceModel.fromJson(e))
              .toList() ??
          [],
      thingsToDo:
          (json['thingsToDo'] as List<dynamic>?)
              ?.map((e) => GuidePlaceModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class GuideCityModel {
  final String id;
  final String name;
  final String slug;

  GuideCityModel({required this.id, required this.name, required this.slug});

  factory GuideCityModel.fromJson(Map<String, dynamic> json) {
    return GuideCityModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}

class GuideCountryModel {
  final String id;
  final String slug;

  GuideCountryModel({required this.id, required this.slug});

  factory GuideCountryModel.fromJson(Map<String, dynamic> json) {
    return GuideCountryModel(id: json['_id'] ?? '', slug: json['slug'] ?? '');
  }
}

class GuidePlaceModel {
  final String id;
  final String name;
  final String? description;
  final String? type;
  final List<GuideImageModel> images;
  final double? rating;
  final int? reviewsCount;
  final GuideLocationModel? location;
  final GuidePriceLevelModel? priceLevel;
  final String? bookingUrl;

  GuidePlaceModel({
    required this.id,
    required this.name,
    this.description,
    this.type,
    this.images = const [],
    this.rating,
    this.reviewsCount,
    this.location,
    this.priceLevel,
    this.bookingUrl,
  });

  factory GuidePlaceModel.fromJson(Map<String, dynamic> json) {
    return GuidePlaceModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      type: json['type'],
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => GuideImageModel.fromJson(e))
              .toList() ??
          [],
      rating: json['rating']?.toDouble(),
      reviewsCount: json['reviewsCount'],
      location: json['location'] != null
          ? GuideLocationModel.fromJson(json['location'])
          : null,
      priceLevel: json['priceLevel'] != null
          ? GuidePriceLevelModel.fromJson(json['priceLevel'])
          : null,
      bookingUrl: json['bookingUrl'],
    );
  }

  String? get coverImage => images.length > 0
      ? images
            .firstWhere(
              (img) => img.isCover == true,
              orElse: () => images.first,
            )
            .url
      : null;
}

class GuideImageModel {
  final String url;
  final String? alt;
  final bool? isCover;

  GuideImageModel({required this.url, this.alt, this.isCover});

  factory GuideImageModel.fromJson(Map<String, dynamic> json) {
    return GuideImageModel(
      url: json['url'] ?? '',
      alt: json['alt'],
      isCover: json['isCover'],
    );
  }
}

class GuideLocationModel {
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? googleMapsUrl;

  GuideLocationModel({
    this.latitude,
    this.longitude,
    this.address,
    this.googleMapsUrl,
  });

  factory GuideLocationModel.fromJson(Map<String, dynamic> json) {
    return GuideLocationModel(
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      address: json['address'],
      googleMapsUrl: json['googleMapsUrl'],
    );
  }
}

class GuidePriceLevelModel {
  final String? currency;
  final double? amount;

  GuidePriceLevelModel({this.currency, this.amount});

  factory GuidePriceLevelModel.fromJson(Map<String, dynamic> json) {
    return GuidePriceLevelModel(
      currency: json['currency'],
      amount: json['amount']?.toDouble(),
    );
  }
}
