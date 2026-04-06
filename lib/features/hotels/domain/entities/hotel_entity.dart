import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable {
  final int hotelId;
  final String name;
  final String currency;
  final double price;
  final String image;
  final double rating;
  final String ratingWord;
  final int stars;
  final String address;
  final String? distance;
  final String url;

  const HotelEntity({
    required this.hotelId,
    required this.name,
    required this.currency,
    required this.price,
    required this.image,
    required this.rating,
    required this.ratingWord,
    required this.stars,
    required this.address,
    this.distance,
    required this.url,
  });

  @override
  List<Object?> get props => [
        hotelId,
        name,
        currency,
        price,
        image,
        rating,
        ratingWord,
        stars,
        address,
        distance,
        url,
      ];
}

class HotelDetailsEntity extends Equatable {
  final int hotelId;
  final String name;
  final int stars;
  final String description;
  final String imageCover;
  final List<String> images;
  final String city;
  final String? country;
  final String address;
  final double? latitude;
  final double? longitude;
  final String currency;
  final double rating;
  final String ratingWord;
  final int ratingCount;
  final double price;
  final List<String> facilities;
  final List<HotelRoomEntity> rooms;
  final List<HotelReviewEntity> reviews;
  final HotelPoliciesEntity? policies;

  const HotelDetailsEntity({
    required this.hotelId,
    required this.name,
    required this.stars,
    required this.description,
    required this.imageCover,
    required this.images,
    required this.city,
    this.country,
    required this.address,
    this.latitude,
    this.longitude,
    required this.currency,
    required this.rating,
    required this.ratingWord,
    required this.ratingCount,
    required this.price,
    required this.facilities,
    required this.rooms,
    required this.reviews,
    this.policies,
  });

  @override
  List<Object?> get props => [
        hotelId,
        name,
        stars,
        description,
        imageCover,
        images,
        city,
        country,
        address,
        latitude,
        longitude,
        currency,
        rating,
        ratingWord,
        ratingCount,
        price,
        facilities,
        rooms,
        reviews,
        policies,
      ];
}

class HotelRoomEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String price;
  final String currency;
  final List<String> photos;
  final String bedOptions;
  final int adults;
  final int children;
  final List<String> facilities;
  final String? mealPlan;
  final String? cancellationText;

  const HotelRoomEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.photos,
    required this.bedOptions,
    required this.adults,
    required this.children,
    required this.facilities,
    this.mealPlan,
    this.cancellationText,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        currency,
        photos,
        bedOptions,
        adults,
        children,
        facilities,
        mealPlan,
        cancellationText,
      ];
}

class HotelReviewEntity extends Equatable {
  final String authorName;
  final String? authorAvatar;
  final String title;
  final String date;
  final double score;
  final String pros;
  final String cons;
  final String? reviewerCountry;
  final String? travelerType;

  const HotelReviewEntity({
    required this.authorName,
    this.authorAvatar,
    required this.title,
    required this.date,
    required this.score,
    required this.pros,
    required this.cons,
    this.reviewerCountry,
    this.travelerType,
  });

  @override
  List<Object?> get props => [
        authorName,
        authorAvatar,
        title,
        date,
        score,
        pros,
        cons,
        reviewerCountry,
        travelerType,
      ];
}

class HotelPoliciesEntity extends Equatable {
  final String? checkInFrom;
  final String? checkInUntil;
  final String? checkOutFrom;
  final String? checkOutUntil;
  final List<String> rules;
  final List<String> children;
  final List<String> internet;
  final List<String> pets;
  final List<String> parking;

  const HotelPoliciesEntity({
    this.checkInFrom,
    this.checkInUntil,
    this.checkOutFrom,
    this.checkOutUntil,
    required this.rules,
    required this.children,
    required this.internet,
    required this.pets,
    required this.parking,
  });

  @override
  List<Object?> get props => [
        checkInFrom,
        checkInUntil,
        checkOutFrom,
        checkOutUntil,
        rules,
        children,
        internet,
        pets,
        parking,
      ];
}
