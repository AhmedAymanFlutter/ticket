class CityModel {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? nameEn;
  final String? imageCover;
  final String? slug;
  final String? alt;

  CityModel({
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.imageCover,
    this.slug,
    this.alt,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      imageCover: json['imageCover'] is Map ? json['imageCover']['url'] : json['imageCover'],
      slug: json['slug'],
      alt: json['alt'],
    );
  }

  String getName(String lang) => lang == 'ar' ? (nameAr ?? name ?? '') : (nameEn ?? name ?? '');
}
