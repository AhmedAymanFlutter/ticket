import 'package:equatable/equatable.dart';
import 'package:ticket/features/home/data/models/offer_model.dart';

abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object?> get props => [];
}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {
  final String
  activeFilter; // Track which filter triggered the load to avoid full jumps

  const OffersLoading({this.activeFilter = 'common.all'});

  @override
  List<Object?> get props => [activeFilter];
}

class OffersSuccess extends OffersState {
  final List<OfferModel> offers;
  final String activeFilter; // Remember the filter (e.g., 'common.hotels')

  const OffersSuccess({required this.offers, required this.activeFilter});

  @override
  List<Object?> get props => [offers, activeFilter];
}

class OffersFailure extends OffersState {
  final String message;
  final String activeFilter; // Helpful to revert state or retry

  const OffersFailure({required this.message, required this.activeFilter});

  @override
  List<Object?> get props => [message, activeFilter];
}
