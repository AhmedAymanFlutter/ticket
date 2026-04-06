import 'package:equatable/equatable.dart';
import 'package:ticket/features/hotels/domain/entities/hotel_entity.dart';

abstract class HotelDetailsState extends Equatable {
  const HotelDetailsState();

  @override
  List<Object?> get props => [];
}

class HotelDetailsInitial extends HotelDetailsState {}

class HotelDetailsLoading extends HotelDetailsState {}

class HotelDetailsSuccess extends HotelDetailsState {
  final HotelDetailsEntity hotelDetails;

  const HotelDetailsSuccess({required this.hotelDetails});

  @override
  List<Object?> get props => [hotelDetails];
}

class HotelDetailsFailure extends HotelDetailsState {
  final String message;

  const HotelDetailsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
