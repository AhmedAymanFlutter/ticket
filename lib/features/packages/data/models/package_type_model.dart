class PackageTypeModel {
  final String id;
  final String name;
  final String description;
  final String slug;
  final String? imageCover;
  final String? alt;
  final SEOModel? seo;

  PackageTypeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.slug,
    this.imageCover,
    this.alt,
    this.seo,
  });

  factory PackageTypeModel.fromJson(Map<String, dynamic> json) {
    return PackageTypeModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      slug: json['slug'] ?? '',
      imageCover: json['imageCover'],
      alt: json['alt'],
      seo: json['seo'] != null ? SEOModel.fromJson(json['seo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'slug': slug,
      'imageCover': imageCover,
      'alt': alt,
      'seo': seo?.toJson(),
    };
  }
}

class SEOModel {
  final double? priority;
  final String? changeFrequency;
  final String? noIndex;
  final String? noFollow;
  final String? noArchive;
  final String? noSnippet;

  SEOModel({
    this.priority,
    this.changeFrequency,
    this.noIndex,
    this.noFollow,
    this.noArchive,
    this.noSnippet,
  });

  factory SEOModel.fromJson(Map<String, dynamic> json) {
    return SEOModel(
      priority: (json['priority'] as num?)?.toDouble(),
      changeFrequency: json['changeFrequency'],
      noIndex: json['noIndex'],
      noFollow: json['noFollow'],
      noArchive: json['noArchive'],
      noSnippet: json['noSnippet'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'priority': priority,
      'changeFrequency': changeFrequency,
      'noIndex': noIndex,
      'noFollow': noFollow,
      'noArchive': noArchive,
      'noSnippet': noSnippet,
    };
  }
}
