import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String imageCover;
  final String description;
  final String summary;
  final String method;
  final String alt;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageCover,
    required this.description,
    required this.summary,
    required this.method,
    required this.alt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      imageCover: json['imageCover'],
      description: json['description'],
      summary: json['summary'],
      method: json['method'],
      alt: json['alt'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    imageCover,
    description,
    summary,
    method,
    alt,
  ];
}
