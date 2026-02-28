class TourModel {
  final String? id;
  final String? productCode;
  final String? title;
  final String? description;
  final num? ratingAverage;
  final int? ratingCount;
  final String? cityName;
  final num? priceAmount;
  final String? priceCurrency;
  final String? coverImage;
  final String? cancellationPolicy;
  final String? slug;
  final String? timeZone;

  TourModel({
    this.id,
    this.productCode,
    this.title,
    this.description,
    this.ratingAverage,
    this.ratingCount,
    this.cityName,
    this.priceAmount,
    this.priceCurrency,
    this.coverImage,
    this.cancellationPolicy,
    this.slug,
    this.timeZone,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      id: json['_id']?.toString(),
      productCode: json['productCode']?.toString(),
      title: json['title']?.toString(),
      description: json['description']?.toString(),
      ratingAverage: json['rating']?['average'],
      ratingCount: json['rating']?['count'],
      cityName: json['city']?['name']?.toString(),
      priceAmount: json['price']?['amount'],
      priceCurrency: json['price']?['currency']?.toString(),
      coverImage: json['coverImage']?.toString(),
      cancellationPolicy: json['cancellationPolicy']?['description']
          ?.toString(),
      slug: json['slug']?.toString(),
      timeZone: json['timeZone']?.toString(),
    );
  }
}
