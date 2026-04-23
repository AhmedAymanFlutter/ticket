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
      name: json['name'],
      currency: json['currency'],
      price: (json['price'] as num).toDouble(),
      image: json['image'] is Map ? (json['image']['url'] ?? '') : (json['image'] ?? ''),
      rating: (json['rating'] as num).toDouble(),
      ratingWord: json['ratingWord'],
      stars: json['stars'],
      address: json['address'],
      distance: json['distance'],
      url: json['url'],
    );
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
