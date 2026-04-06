import 'package:equatable/equatable.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object?> get props => [];
}

class HotelsInitial extends HotelsState {}

class HotelsLoading extends HotelsState {}

class HotelsSuccess extends HotelsState {
  final List<HotelEntity> hotels;

  const HotelsSuccess({required this.hotels});

  @override
  List<Object?> get props => [hotels];
}

class HotelsFailure extends HotelsState {
  final String message;

  const HotelsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
