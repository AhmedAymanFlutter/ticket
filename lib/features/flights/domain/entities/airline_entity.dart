import 'package:equatable/equatable.dart';

class AirlineEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String slug;

  const AirlineEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.slug,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, slug];
}
