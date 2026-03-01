import 'city_model.dart';

class CountryModel {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? nameEn;
  final String? code;
  final String? continent;
  final String? continentAr;
  final String? continentEn;
  final String? currency;
  final String? currencyAr;
  final String? currencyEn;
  final String? language;
  final String? languageAr;
  final String? languageEn;
  final String? description;
  final String? imageCover;
  final String? slug;
  final List<CityModel>? cities;

  CountryModel({
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.code,
    this.continent,
    this.continentAr,
    this.continentEn,
    this.currency,
    this.currencyAr,
    this.currencyEn,
    this.language,
    this.languageAr,
    this.languageEn,
    this.description,
    this.imageCover,
    this.slug,
    this.cities,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] ?? json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      code: json['code'],
      continent: json['continent'],
      continentAr: json['continentAr'],
      continentEn: json['continentEn'],
      currency: json['currency'],
      currencyAr: json['currencyAr'],
      currencyEn: json['currencyEn'],
      language: json['language'],
      languageAr: json['languageAr'],
      languageEn: json['languageEn'],
      description: json['description'],
      imageCover: json['imageCover'],
      slug: json['slug'],
      cities: json['cities'] != null
          ? (json['cities'] as List)
                .map((item) => CityModel.fromJson(item))
                .toList()
          : null,
    );
  }

  String get displayName => nameEn ?? nameAr ?? name ?? '';
  String get displayContinent => continentEn ?? continentAr ?? continent ?? '';
}
