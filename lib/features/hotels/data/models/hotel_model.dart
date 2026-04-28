import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

class HotelModel extends HotelEntity {
  const HotelModel({
    required super.hotelId,
    required super.name,
    required super.currency,
    required super.price,
    required super.image,
    required super.rating,
    required super.ratingWord,
    required super.stars,
    required super.address,
    super.distance,
    required super.url,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      hotelId: json['hotelId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      currency: json['currency']?.toString() ?? 'SAR',
      price: _toDouble(json['price']),
      image: json['image'] is Map ? (json['image']['url'] ?? '') : (json['image']?.toString() ?? ''),
      rating: _toDouble(json['rating']),
      ratingWord: json['ratingWord']?.toString() ?? '',
      stars: _toInt(json['stars']),
      address: json['address']?.toString() ?? '',
      distance: json['distance']?.toString(),
      url: json['url']?.toString() ?? '',
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'hotelId': hotelId,
      'name': name,
      'currency': currency,
      'price': price,
      'image': image,
      'rating': rating,
      'ratingWord': ratingWord,
      'stars': stars,
      'address': address,
      'distance': distance,
      'url': url,
    };
  }
}
