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
    super.contact,
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
      facilities: _parseStringList(hotel['facilities']),
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
      contact: hotel['contact'] != null
          ? HotelContactModel.fromJson(hotel['contact'])
          : null,
    );
  }

  static String? _parseToString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value.trim().isEmpty ? null : value.trim();
    if (value is Map && value.isEmpty) return null;
    return value.toString();
  }

  static List<String> _parseStringList(dynamic list) {
    if (list == null || list is! List) return [];
    return list.map((e) {
      if (e == null) return '';
      if (e is String) return e;
      if (e is Map) {
        return e['text']?.toString() ?? 
               e['description']?.toString() ?? 
               e['content']?.toString() ?? 
               e['name']?.toString() ?? 
               e.toString();
      }
      return e.toString();
    }).where((element) => element.isNotEmpty).toList();
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
    required super.highlights,
    super.maxOccupancy,
    super.isFreeCancellation,
  });

  factory HotelRoomModel.fromJson(Map<String, dynamic> json) {
    return HotelRoomModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0',
      currency: json['currency'] ?? 'SAR',
      photos: HotelDetailsModel._parseStringList(json['photos']),
      bedOptions: json['bedOptions'] ?? '',
      adults: json['occupancy']?['adults'] ?? 0,
      children: json['occupancy']?['children'] ?? 0,
      facilities: HotelDetailsModel._parseStringList(json['facilities']),
      mealPlan: json['mealPlan'],
      cancellationText: json['cancellation']?['text'],
      highlights: HotelDetailsModel._parseStringList(json['highlights']),
      maxOccupancy: json['occupancy']?['maxOccupancy'],
      isFreeCancellation: json['cancellation']?['free'],
    );
  }
}

class HotelContactModel extends HotelContactEntity {
  const HotelContactModel({super.phone, super.email});

  factory HotelContactModel.fromJson(Map<String, dynamic> json) {
    return HotelContactModel(
      phone: json['phone']?.toString(),
      email: json['email']?.toString(),
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
      checkInFrom: HotelDetailsModel._parseToString(json['checkIn']?['from']),
      checkInUntil: HotelDetailsModel._parseToString(json['checkIn']?['until']),
      checkOutFrom: HotelDetailsModel._parseToString(json['checkOut']?['from']),
      checkOutUntil: HotelDetailsModel._parseToString(json['checkOut']?['until']),
      rules: HotelDetailsModel._parseStringList(json['rules']),
      children: HotelDetailsModel._parseStringList(json['children']),
      internet: HotelDetailsModel._parseStringList(json['internet']),
      pets: HotelDetailsModel._parseStringList(json['pets']),
      parking: HotelDetailsModel._parseStringList(json['parking']),
    );
  }
}
