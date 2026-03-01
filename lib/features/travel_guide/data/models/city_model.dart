class CityModel {
  final String? id;
  final String? name;
  final String? imageCover;
  final String? slug;
  final String? alt;

  CityModel({this.id, this.name, this.imageCover, this.slug, this.alt});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? json['_id'],
      name: json['name'],
      imageCover: json['imageCover'],
      slug: json['slug'],
      alt: json['alt'],
    );
  }
}
