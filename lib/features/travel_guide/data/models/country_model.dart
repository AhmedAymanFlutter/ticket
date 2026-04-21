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
  final String? descriptionAr;
  final String? descriptionEn;
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
    this.descriptionAr,
    this.descriptionEn,
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
      descriptionAr: json['descTextAr'] ?? json['descriptionAr'],
      descriptionEn: json['descTextEn'] ?? json['descriptionEn'],
      imageCover: json['imageCover'],
      slug: json['slug'],
      cities: json['cities'] != null
          ? (json['cities'] as List)
                .map((item) => CityModel.fromJson(item))
                .toList()
          : null,
    );
  }

  String getName(String lang) => lang == 'ar' ? (nameAr ?? name ?? '') : (nameEn ?? name ?? '');
  String getContinent(String lang) => lang == 'ar' ? (continentAr ?? continent ?? '') : (continentEn ?? continent ?? '');
  String getCurrency(String lang) => lang == 'ar' ? (currencyAr ?? currency ?? '') : (currencyEn ?? currency ?? '');
  String getLanguage(String lang) => lang == 'ar' ? (languageAr ?? language ?? '') : (languageEn ?? language ?? '');
  String getDescription(String lang) {
    String text = lang == 'ar'
        ? (descriptionAr ?? description ?? '')
        : (descriptionEn ?? description ?? '');
    // Basic regex to strip HTML tags if they still exist
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ').trim();
  }

  @Deprecated('Use getName(lang)')
  String get displayName => nameEn ?? nameAr ?? name ?? '';
  @Deprecated('Use getContinent(lang)')
  String get displayContinent => continentEn ?? continentAr ?? continent ?? '';
}
