class OfferModel {
  final String? id;
  final String? title;
  final String? description;
  final String? imageCover;
  final List<String>? images;
  final String? type;
  final Map<String, dynamic>? details;
  final int? price;
  final int? originalPrice;
  final String? currency;
  final bool? isFeatured;
  final String? slug;
  final Map<String, dynamic>? seo;

  OfferModel({
    this.id,
    this.title,
    this.description,
    this.imageCover,
    this.images,
    this.type,
    this.details,
    this.price,
    this.originalPrice,
    this.currency,
    this.isFeatured,
    this.slug,
    this.seo,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageCover: json['imageCover'] as String?,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      type: json['type'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      price: json['price'] is int
          ? json['price']
          : int.tryParse(json['price'].toString()),
      originalPrice: json['originalPrice'] is int
          ? json['originalPrice']
          : int.tryParse(json['originalPrice'].toString()),
      currency: json['currency'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      slug: json['slug'] as String?,
      seo: json['seo'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageCover': imageCover,
      'images': images,
      'type': type,
      'details': details,
      'price': price,
      'originalPrice': originalPrice,
      'currency': currency,
      'isFeatured': isFeatured,
      'slug': slug,
      'seo': seo,
    };
  }
}
