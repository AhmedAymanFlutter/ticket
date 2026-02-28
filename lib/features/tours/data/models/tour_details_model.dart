class TourDetailsModel {
  final String? id;
  final String? productCode;
  final String? title;
  final String? description;
  final num? ratingAverage;
  final int? ratingCount;
  final String? cityName;
  final String? slug;
  final List<String>? images;
  final CancellationPolicy? cancellationPolicy;
  final String? timeZone;
  final Price? price;
  final PricingInfo? pricingInfo;
  final Reviews? reviews;
  final TicketInfo? ticketInfo;
  final Supplier? supplier;
  final BookingConfirmationSettings? bookingConfirmationSettings;
  final BookingRequirements? bookingRequirements;
  final Seo? seo;
  final List<String>? inclusions;
  final List<String>? exclusions;
  final List<AdditionalInfo>? additionalInfo;
  final Itinerary? itinerary;
  final List<ProductOption>? productOptions;
  final Logistics? logistics;
  final List<Tag>? tags;

  TourDetailsModel({
    this.id,
    this.productCode,
    this.title,
    this.description,
    this.ratingAverage,
    this.ratingCount,
    this.cityName,
    this.slug,
    this.images,
    this.cancellationPolicy,
    this.timeZone,
    this.price,
    this.pricingInfo,
    this.reviews,
    this.ticketInfo,
    this.supplier,
    this.bookingConfirmationSettings,
    this.bookingRequirements,
    this.seo,
    this.inclusions,
    this.exclusions,
    this.additionalInfo,
    this.itinerary,
    this.productOptions,
    this.logistics,
    this.tags,
  });

  factory TourDetailsModel.fromJson(Map<String, dynamic> json) {
    return TourDetailsModel(
      id: json['_id']?.toString(),
      productCode: json['productCode']?.toString(),
      title: json['title']?.toString(),
      description: json['description']?.toString(),
      ratingAverage: json['rating']?['average'],
      ratingCount: json['rating']?['count'],
      cityName: json['city']?['name']?.toString(),
      slug: json['slug']?.toString(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      cancellationPolicy: json['cancellationPolicy'] != null
          ? CancellationPolicy.fromJson(json['cancellationPolicy'])
          : null,
      timeZone: json['timeZone']?.toString(),
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      pricingInfo: json['pricingInfo'] != null
          ? PricingInfo.fromJson(json['pricingInfo'])
          : null,
      reviews: json['reviews'] != null
          ? Reviews.fromJson(json['reviews'])
          : null,
      ticketInfo: json['ticketInfo'] != null
          ? TicketInfo.fromJson(json['ticketInfo'])
          : null,
      supplier: json['supplier'] != null
          ? Supplier.fromJson(json['supplier'])
          : null,
      bookingConfirmationSettings: json['bookingConfirmationSettings'] != null
          ? BookingConfirmationSettings.fromJson(
              json['bookingConfirmationSettings'],
            )
          : null,
      bookingRequirements: json['bookingRequirements'] != null
          ? BookingRequirements.fromJson(json['bookingRequirements'])
          : null,
      seo: json['seo'] != null ? Seo.fromJson(json['seo']) : null,
      inclusions: (json['inclusions'] as List<dynamic>?)
          ?.map((e) => e['description']?.toString() ?? '')
          .toList(),
      exclusions: (json['exclusions'] as List<dynamic>?)
          ?.map((e) => e['description']?.toString() ?? '')
          .toList(),
      additionalInfo: (json['additionalInfo'] as List<dynamic>?)
          ?.map((e) => AdditionalInfo.fromJson(e))
          .toList(),
      itinerary: json['itinerary'] != null
          ? Itinerary.fromJson(json['itinerary'])
          : null,
      productOptions: (json['productOptions'] as List<dynamic>?)
          ?.map((e) => ProductOption.fromJson(e))
          .toList(),
      logistics: json['logistics'] != null
          ? Logistics.fromJson(json['logistics'])
          : null,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e))
          .toList(),
    );
  }
}

class CancellationPolicy {
  final String? type;
  final String? description;

  CancellationPolicy({this.type, this.description});

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) {
    return CancellationPolicy(
      type: json['type']?.toString(),
      description: json['description']?.toString(),
    );
  }
}

class Price {
  final num? amount;
  final String? currency;

  Price({this.amount, this.currency});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      amount: json['amount'],
      currency: json['currency']?.toString(),
    );
  }
}

class PricingInfo {
  final String? type;

  PricingInfo({this.type});

  factory PricingInfo.fromJson(Map<String, dynamic> json) {
    return PricingInfo(type: json['type']?.toString());
  }
}

class Reviews {
  final int? totalReviews;
  final num? averageRating;

  Reviews({this.totalReviews, this.averageRating});

  factory Reviews.fromJson(Map<String, dynamic> json) {
    num? avg = 0;
    if (json['sources'] != null && (json['sources'] as List).isNotEmpty) {
      avg = json['sources'][0]['averageRating'];
    }
    return Reviews(totalReviews: json['totalReviews'], averageRating: avg);
  }
}

class TicketInfo {
  final String? ticketTypeDescription;
  final String? ticketsPerBookingDescription;

  TicketInfo({this.ticketTypeDescription, this.ticketsPerBookingDescription});

  factory TicketInfo.fromJson(Map<String, dynamic> json) {
    return TicketInfo(
      ticketTypeDescription: json['ticketTypeDescription']?.toString(),
      ticketsPerBookingDescription: json['ticketsPerBookingDescription']
          ?.toString(),
    );
  }
}

class Supplier {
  final String? name;

  Supplier({this.name});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(name: json['name']?.toString());
  }
}

class BookingConfirmationSettings {
  final String? confirmationType;

  BookingConfirmationSettings({this.confirmationType});

  factory BookingConfirmationSettings.fromJson(Map<String, dynamic> json) {
    return BookingConfirmationSettings(
      confirmationType: json['confirmationType']?.toString(),
    );
  }
}

class BookingRequirements {
  final int? minTravelersPerBooking;
  final int? maxTravelersPerBooking;
  final bool? requiresAdultForBooking;

  BookingRequirements({
    this.minTravelersPerBooking,
    this.maxTravelersPerBooking,
    this.requiresAdultForBooking,
  });

  factory BookingRequirements.fromJson(Map<String, dynamic> json) {
    return BookingRequirements(
      minTravelersPerBooking: json['minTravelersPerBooking'],
      maxTravelersPerBooking: json['maxTravelersPerBooking'],
      requiresAdultForBooking: json['requiresAdultForBooking'],
    );
  }
}

class Seo {
  final String? ogImage;

  Seo({this.ogImage});

  factory Seo.fromJson(Map<String, dynamic> json) {
    return Seo(ogImage: json['ogImage']?.toString());
  }
}

class AdditionalInfo {
  final String? type;
  final String? description;

  AdditionalInfo({this.type, this.description});

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      type: json['type']?.toString(),
      description: json['description']?.toString(),
    );
  }
}

class Itinerary {
  final String? itineraryType;
  final int? fixedDurationInMinutes;
  final List<ItineraryItem>? items;

  Itinerary({this.itineraryType, this.fixedDurationInMinutes, this.items});

  factory Itinerary.fromJson(Map<String, dynamic> json) {
    return Itinerary(
      itineraryType: json['itineraryType']?.toString(),
      fixedDurationInMinutes: json['duration']?['fixedDurationInMinutes'],
      items: (json['itineraryItems'] as List<dynamic>?)
          ?.map((e) => ItineraryItem.fromJson(e))
          .toList(),
    );
  }
}

class ItineraryItem {
  final int? fixedDurationInMinutes;
  final String? description;
  final String? admissionIncluded;

  ItineraryItem({
    this.fixedDurationInMinutes,
    this.description,
    this.admissionIncluded,
  });

  factory ItineraryItem.fromJson(Map<String, dynamic> json) {
    return ItineraryItem(
      fixedDurationInMinutes: json['duration']?['fixedDurationInMinutes'],
      description: json['description']?.toString(),
      admissionIncluded: json['admissionIncluded']?.toString(),
    );
  }
}

class ProductOption {
  final String? title;
  final String? description;

  ProductOption({this.title, this.description});

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      title: json['title']?.toString(),
      description: json['description']?.toString(),
    );
  }
}

class Logistics {
  final String? specialInstructions;
  final String? travelerPickupInfo;

  Logistics({this.specialInstructions, this.travelerPickupInfo});

  factory Logistics.fromJson(Map<String, dynamic> json) {
    return Logistics(
      specialInstructions: json['redemption']?['specialInstructions']
          ?.toString(),
      travelerPickupInfo: json['travelerPickup']?['additionalInfo']?.toString(),
    );
  }
}

class Tag {
  final String? name;

  Tag({this.name});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(name: json['name']?.toString());
  }
}
