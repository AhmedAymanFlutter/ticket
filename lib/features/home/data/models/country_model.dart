class CountryModel {
  final String id;
  final String name;
  final String slug;

  CountryModel({required this.id, required this.name, this.slug = ''});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'slug': slug};
  }
}
