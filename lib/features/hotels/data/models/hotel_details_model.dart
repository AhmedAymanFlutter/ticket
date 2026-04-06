import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelDetailsModel extends HotelDetailsEntity {
  const HotelDetailsModel({
    required super.hotelId,
    required super.name,
    required super.stars,
    required super.description,
    required super.imageCover,
    required super.images,
    required super.city,
    super.country,
    required super.address,
    super.latitude,
    super.longitude,
    required super.currency,
    required super.rating,
    required super.ratingWord,
    required super.ratingCount,
    required super.price,
    required super.facilities,
    required super.rooms,
    required super.reviews,
    super.policies,
  });

  factory HotelDetailsModel.fromJson(Map<String, dynamic> json) {
    final hotel = json['hotel'] ?? (json['data']?['hotel'] ?? json);
    
    return HotelDetailsModel(
      hotelId: hotel['hotelId'] ?? 0,
      name: hotel['name'] ?? '',
      stars: hotel['stars'] ?? 0,
      description: hotel['description'] ?? '',
      imageCover: hotel['imageCover'] ?? '',
      images: (hotel['images']?['all'] as List?)
              ?.map((e) => e['url'] as String)
              .toList() ??
          [],
      city: hotel['city'] ?? '',
      country: hotel['country'] ?? '',
      address: hotel['address'] ?? '',
      latitude: (hotel['latitude'] as num?)?.toDouble(),
      longitude: (hotel['longitude'] as num?)?.toDouble(),
      currency: hotel['currency'] ?? 'SAR',
      rating: (hotel['rating'] as num?)?.toDouble() ?? 0.0,
      ratingWord: hotel['ratingWord'] ?? '',
      ratingCount: hotel['ratingCount'] ?? 0,
      price: (hotel['price'] as num?)?.toDouble() ?? 0.0,
      facilities: (hotel['facilities'] as List?)?.cast<String>() ?? [],
      rooms: (hotel['rooms'] as List?)
              ?.map((e) => HotelRoomModel.fromJson(e))
              .toList() ??
          [],
      reviews: (hotel['reviews'] as List?)
              ?.map((e) => HotelReviewModel.fromJson(e))
              .toList() ??
          [],
      policies: hotel['policies'] != null 
          ? HotelPoliciesModel.fromJson(hotel['policies']) 
          : null,
    );
  }
}

class HotelRoomModel extends HotelRoomEntity {
  const HotelRoomModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.currency,
    required super.photos,
    required super.bedOptions,
    required super.adults,
    required super.children,
    required super.facilities,
    super.mealPlan,
    super.cancellationText,
  });

  factory HotelRoomModel.fromJson(Map<String, dynamic> json) {
    return HotelRoomModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0',
      currency: json['currency'] ?? 'SAR',
      photos: (json['photos'] as List?)?.cast<String>() ?? [],
      bedOptions: json['bedOptions'] ?? '',
      adults: json['occupancy']?['adults'] ?? 0,
      children: json['occupancy']?['children'] ?? 0,
      facilities: (json['facilities'] as List?)?.cast<String>() ?? [],
      mealPlan: json['mealPlan'],
      cancellationText: json['cancellation']?['text'],
    );
  }
}

class HotelReviewModel extends HotelReviewEntity {
  const HotelReviewModel({
    required super.authorName,
    super.authorAvatar,
    required super.title,
    required super.date,
    required super.score,
    required super.pros,
    required super.cons,
    super.reviewerCountry,
    super.travelerType,
  });

  factory HotelReviewModel.fromJson(Map<String, dynamic> json) {
    return HotelReviewModel(
      authorName: json['author']?['name'] ?? 'Anonymous',
      authorAvatar: json['author']?['avatar'],
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      score: (json['average_score'] as num?)?.toDouble() ?? 0.0,
      pros: json['pros'] ?? '',
      cons: json['cons'] ?? '',
      reviewerCountry: json['author']?['countrycode'],
      travelerType: json['author']?['type_string'],
    );
  }
}

class HotelPoliciesModel extends HotelPoliciesEntity {
  const HotelPoliciesModel({
    super.checkInFrom,
    super.checkInUntil,
    super.checkOutFrom,
    super.checkOutUntil,
    required super.rules,
    required super.children,
    required super.internet,
    required super.pets,
    required super.parking,
  });

  factory HotelPoliciesModel.fromJson(Map<String, dynamic> json) {
    return HotelPoliciesModel(
      checkInFrom: json['checkIn']?['from']?.toString(),
      checkInUntil: json['checkIn']?['until']?.toString(),
      checkOutFrom: json['checkOut']?['from']?.toString(),
      checkOutUntil: json['checkOut']?['until']?.toString(),
      rules: (json['rules'] as List?)?.cast<String>() ?? [],
      children: (json['children'] as List?)?.cast<String>() ?? [],
      internet: (json['internet'] as List?)?.cast<String>() ?? [],
      pets: (json['pets'] as List?)?.cast<String>() ?? [],
      parking: (json['parking'] as List?)?.cast<String>() ?? [],
    );
  }
}
